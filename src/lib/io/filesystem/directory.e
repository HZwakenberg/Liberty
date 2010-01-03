-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class DIRECTORY
	--
	-- Tools for file-system directory handling.
	-- High-level facade for class BASIC_DIRECTORY.
	--

inherit
	FILE

insert
	DIRECTORY_NOTATION_HANDLER

creation {ANY}
	scan, scan_current_working_directory

feature {ANY}
	name: FIXED_STRING
			-- The directory short name.

	path: FIXED_STRING
			-- The directory path in use (see `scan').

	is_directory: BOOLEAN is True
	is_regular: BOOLEAN is False

	as_directory: DIRECTORY is
		do
			Result := Current
		end

	as_regular: REGULAR_FILE is
		do
			check False end
		end

	exists: BOOLEAN

	has_file (a_file_name: ABSTRACT_STRING): BOOLEAN is
		local
			fn: FIXED_STRING
		do
			fn := case_canonical_filename(a_file_name)
			if files /= Void then
				Result := files.fast_has(fn)
			end
			if not Result then
				Result := collection_sorter.has(name_list, fn)
			end
		end

	file (a_file_name: ABSTRACT_STRING): FILE is
		require
			has_file(a_file_name)
		local
			fn: FIXED_STRING
		do
			fn := case_canonical_filename(a_file_name)
			if files /= Void then
				Result := files.fast_reference_at(fn)
			end
			if Result = Void then
				Result := create_file(fn)
			end
		end

	file_at (index: INTEGER): FILE is
		require
			valid_index(index)
		do
			Result := file(item(index))
		end

feature {} -- Disk access:
	connect_directory (directory_path: ABSTRACT_STRING): FIXED_STRING is
		do
			basic_directory.ensure_system_notation
			basic_directory.compute_absolute_file_path_with(directory_path)
			Result := basic_directory.last_entry.intern
			basic_directory.connect_to(Result)
		end

	connect_current_directory: FIXED_STRING is
		do
			basic_directory.connect_to_current_working_directory
			if basic_directory.is_connected then
				Result := basic_directory.last_entry.intern
			end
		end

	scan (directory_path: ABSTRACT_STRING) is
			-- Scans some existing `directory_path' which is supposed to be a correctly spelled
			-- directory path.
			--
			-- See also `scan_current_working_directory'.
		require
			not directory_path.is_empty
			directory_path /= path
		do
			path := connect_directory(directory_path)
			if basic_directory.is_connected then
				create name_list.with_capacity(32)
				from
					basic_directory.read_entry
				until
					basic_directory.end_of_input
				loop
					name_list.add_last(basic_directory.last_entry.intern)
					basic_directory.read_entry
				end
				basic_directory.disconnect
				collection_sorter.sort(name_list)
				exists := True
				basic_directory.compute_short_name_of(path)
				name := basic_directory.last_entry.intern
			end
		ensure
			path /= directory_path
		end

	scan_current_working_directory is
			-- Scans the current working directory.
			--
			-- See also `scan'.
		do
			path := connect_current_directory
			if basic_directory.is_connected then
				create name_list.with_capacity(32)
				from
					basic_directory.read_entry
				until
					basic_directory.end_of_input
				loop
					name_list.add_last(basic_directory.last_entry.intern)
					basic_directory.read_entry
				end
				basic_directory.disconnect
				collection_sorter.sort(name_list)
				exists := True
				basic_directory.compute_short_name_of(path)
				name := basic_directory.last_entry.intern
			end
		end

feature {ANY} -- Access:
	lower: INTEGER is 1
			-- Index of the first item.

	upper: INTEGER is
			-- Index of the last item.
		do
			Result := name_list.upper + 1
		end

	count: INTEGER is
			-- Number of items (files or directories) in Current.
		do
			Result := name_list.count
		ensure
			Result >= 0
		end

	is_empty: BOOLEAN is
		do
			Result := count = 0
		ensure
			definition: Result = (count = 0)
		end

	valid_index (index: INTEGER): BOOLEAN is
		do
			if index >= 1 then
				Result := index <= name_list.upper + 1
			end
		ensure
			Result = (lower <= index and index <= upper)
		end

	item (index: INTEGER): FIXED_STRING is
			-- Return the name of entry (file or subdirectory) at `index'.
		require
			valid_index(index)
		do
			Result := name_list.item(index - 1)
		ensure
			has(Result)
		end

	has (entry_name: ABSTRACT_STRING): BOOLEAN is
			-- Does Current contain the `entry_name' (file or subdirectory) ?
		require
			not entry_name.is_empty
		do
			Result := collection_sorter.has(name_list, case_canonical_filename(entry_name))
		end

feature {ANY} -- File access:
	connect_to_file_stream (file_stream: FILE_STREAM; filename: STRING) is
			-- Connect the `file' to the operating system file given by its `filename'.
		require
			not file_stream.is_connected
		do
			basic_directory.compute_file_path_with(path, filename)
			path_buffer.copy(basic_directory.last_entry)
			file_stream.connect_to(path_buffer)
		end

feature {FILE}
	set_file (a_file_name: ABSTRACT_STRING; a_file: FILE) is
		require
			not file_set(a_file_name)
		do
			if files = Void then
				create {HASHED_DICTIONARY[FILE, FIXED_STRING]} files.make
			end
			files.add(a_file, case_canonical_filename(a_file_name))
		ensure
			file(a_file_name) = a_file
		end

	file_set (a_file_name: ABSTRACT_STRING): BOOLEAN is
		do
			if files /= Void then
				Result := files.fast_has(case_canonical_filename(a_file_name))
			end
		end

feature {}
	case_canonical_filename (a_file_name: ABSTRACT_STRING): FIXED_STRING is
		do
			if basic_directory.is_case_sensitive then
				Result := a_file_name.intern
			else
				Result := a_file_name.as_lower.intern
			end
		end

	path_buffer: STRING is
		once
			create Result.make(16)
		end

	collection_sorter: COLLECTION_SORTER[FIXED_STRING]

	files: DICTIONARY[FILE, FIXED_STRING]

	name_list: FAST_ARRAY[FIXED_STRING]
			-- Actual list of entries (files or subdirectories).

	create_file (a_file_name: FIXED_STRING): FILE is
		require
			not file_set(a_file_name)
		local
			p: STRING
		do
			p := once ""
			basic_directory.compute_subdirectory_with(path, a_file_name)
			p.copy(basic_directory.last_entry)
			if file_tools.is_directory(p) then
				create {DIRECTORY} Result.scan(p)
			else
				basic_directory.compute_file_path_with(path, a_file_name)
				p.copy(basic_directory.last_entry)
				if file_tools.is_file(p) then
					create {REGULAR_FILE} Result.make(p)
				end
			end
			if Result /= Void then
				set_file(a_file_name, Result)
			end
		end

	file_tools: FILE_TOOLS

invariant
	path /= Void
	name_list /= Void
	collection_sorter.is_sorted(name_list)
	not exists implies is_empty

end -- class DIRECTORY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
