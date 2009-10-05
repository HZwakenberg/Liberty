-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GMAPPEDFILE_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_mapped_file_get_length (a_file: POINTER): NATURAL_32 is
 		-- g_mapped_file_get_length
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_get_length"
		}"
		end

	g_mapped_file_free (a_file: POINTER) is
 		-- g_mapped_file_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_free"
		}"
		end

	g_mapped_file_unref (a_file: POINTER) is
 		-- g_mapped_file_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_unref"
		}"
		end

	g_mapped_file_new (a_filename: POINTER; a_writable: INTEGER_32; an_error: POINTER): POINTER is
 		-- g_mapped_file_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_new"
		}"
		end

	g_mapped_file_ref (a_file: POINTER): POINTER is
 		-- g_mapped_file_ref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_ref"
		}"
		end

	g_mapped_file_get_contents (a_file: POINTER): POINTER is
 		-- g_mapped_file_get_contents
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mapped_file_get_contents"
		}"
		end

end