-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GIOCHANNEL_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_io_channel_get_close_on_unref (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_close_on_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_close_on_unref"
		}"
		end

	g_io_channel_get_encoding (a_channel: POINTER): POINTER is
 		-- g_io_channel_get_encoding
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_encoding"
		}"
		end

	g_io_create_watch (a_channel: POINTER; a_condition: INTEGER_32): POINTER is
 		-- g_io_create_watch
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_create_watch"
		}"
		end

	g_io_add_watch_full (a_channel: POINTER; a_priority: INTEGER_32; a_condition: INTEGER_32; a_func: POINTER; an_user_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_io_add_watch_full
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_add_watch_full"
		}"
		end

	g_io_channel_get_buffer_condition (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_buffer_condition
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_buffer_condition"
		}"
		end

	g_io_channel_set_buffered (a_channel: POINTER; a_buffered: INTEGER_32) is
 		-- g_io_channel_set_buffered
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_buffered"
		}"
		end

	g_io_channel_read (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_read: POINTER): INTEGER_32 is
 		-- g_io_channel_read
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read"
		}"
		end

	g_io_channel_seek_position (a_channel: POINTER; an_offset: INTEGER_64; a_type: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_seek_position
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_seek_position"
		}"
		end

	g_io_channel_error_quark: NATURAL_32 is
 		-- g_io_channel_error_quark
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_error_quark"
		}"
		end

	g_io_channel_get_line_term (a_channel: POINTER; a_length: POINTER): POINTER is
 		-- g_io_channel_get_line_term
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_line_term"
		}"
		end

	g_io_channel_get_buffered (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_buffered
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_buffered"
		}"
		end

	g_io_channel_read_chars (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_read: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_read_chars
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read_chars"
		}"
		end

	g_io_add_watch (a_channel: POINTER; a_condition: INTEGER_32; a_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_io_add_watch
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_add_watch"
		}"
		end

	g_io_channel_write_unichar (a_channel: POINTER; a_thechar: NATURAL_32; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_write_unichar
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_write_unichar"
		}"
		end

	g_io_channel_write (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_written: POINTER): INTEGER_32 is
 		-- g_io_channel_write
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_write"
		}"
		end

	g_io_channel_close (a_channel: POINTER) is
 		-- g_io_channel_close
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_close"
		}"
		end

	g_io_channel_set_encoding (a_channel: POINTER; an_encoding: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_set_encoding
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_encoding"
		}"
		end

	g_io_channel_get_flags (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_flags
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_flags"
		}"
		end

	g_io_channel_unref (a_channel: POINTER) is
 		-- g_io_channel_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_unref"
		}"
		end

	g_io_channel_init (a_channel: POINTER) is
 		-- g_io_channel_init
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_init"
		}"
		end

	g_io_channel_unix_get_fd (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_unix_get_fd
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_unix_get_fd"
		}"
		end

	g_io_channel_set_buffer_size (a_channel: POINTER; a_size: NATURAL_32) is
 		-- g_io_channel_set_buffer_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_buffer_size"
		}"
		end

	g_io_channel_read_line_string (a_channel: POINTER; a_buffer: POINTER; a_terminator_pos: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_read_line_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read_line_string"
		}"
		end

	g_io_channel_error_from_errno (an_en: INTEGER_32): INTEGER_32 is
 		-- g_io_channel_error_from_errno
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_error_from_errno"
		}"
		end

	g_io_channel_set_close_on_unref (a_channel: POINTER; a_do_close: INTEGER_32) is
 		-- g_io_channel_set_close_on_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_close_on_unref"
		}"
		end

	g_io_channel_read_line (a_channel: POINTER; a_str_return: POINTER; a_length: POINTER; a_terminator_pos: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_read_line
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read_line"
		}"
		end

	g_io_channel_read_to_end (a_channel: POINTER; a_str_return: POINTER; a_length: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_read_to_end
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read_to_end"
		}"
		end

	g_io_channel_set_line_term (a_channel: POINTER; a_line_term: POINTER; a_length: INTEGER_32) is
 		-- g_io_channel_set_line_term
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_line_term"
		}"
		end

	g_io_channel_unix_new (a_fd: INTEGER_32): POINTER is
 		-- g_io_channel_unix_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_unix_new"
		}"
		end

	g_io_channel_shutdown (a_channel: POINTER; a_flush: INTEGER_32; an_err: POINTER): INTEGER_32 is
 		-- g_io_channel_shutdown
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_shutdown"
		}"
		end

	g_io_channel_flush (a_channel: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_flush
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_flush"
		}"
		end

	g_io_channel_write_chars (a_channel: POINTER; a_buf: POINTER; a_count: INTEGER_32; a_bytes_written: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_write_chars
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_write_chars"
		}"
		end

	g_io_channel_set_flags (a_channel: POINTER; a_flags: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_set_flags
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_set_flags"
		}"
		end

	g_io_channel_read_unichar (a_channel: POINTER; a_thechar: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_io_channel_read_unichar
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_read_unichar"
		}"
		end

	g_io_channel_seek (a_channel: POINTER; an_offset: INTEGER_64; a_type: INTEGER_32): INTEGER_32 is
 		-- g_io_channel_seek
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_seek"
		}"
		end

	g_io_channel_ref (a_channel: POINTER): POINTER is
 		-- g_io_channel_ref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_ref"
		}"
		end

	g_io_channel_new_file (a_filename: POINTER; a_mode: POINTER; an_error: POINTER): POINTER is
 		-- g_io_channel_new_file
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_new_file"
		}"
		end

	g_io_channel_get_buffer_size (a_channel: POINTER): NATURAL_32 is
 		-- g_io_channel_get_buffer_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_io_channel_get_buffer_size"
		}"
		end

end