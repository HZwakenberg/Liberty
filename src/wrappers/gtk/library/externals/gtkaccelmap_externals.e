-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELMAP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_map_lock_path (an_accel_path: POINTER) is
 		-- gtk_accel_map_lock_path (node at line 1180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_lock_path"
		}"
		end

	-- `hidden' function _gtk_accel_map_init skipped.
	gtk_accel_map_save (a_file_name: POINTER) is
 		-- gtk_accel_map_save (node at line 3996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_save"
		}"
		end

	gtk_accel_map_get: POINTER is
 		-- gtk_accel_map_get (node at line 9585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_get()"
		}"
		end

	-- `hidden' function _gtk_accel_map_remove_group skipped.
	gtk_accel_map_add_entry (an_accel_path: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER) is
 		-- gtk_accel_map_add_entry (node at line 13378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_add_entry"
		}"
		end

	gtk_accel_map_get_type: NATURAL_32 is
 		-- gtk_accel_map_get_type (node at line 14753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_get_type()"
		}"
		end

	gtk_accel_map_unlock_path (an_accel_path: POINTER) is
 		-- gtk_accel_map_unlock_path (node at line 15308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_unlock_path"
		}"
		end

	gtk_accel_map_save_fd (a_fd: INTEGER_32) is
 		-- gtk_accel_map_save_fd (node at line 18828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_save_fd"
		}"
		end

	gtk_accel_map_lookup_entry (an_accel_path: POINTER; a_key: POINTER): INTEGER_32 is
 		-- gtk_accel_map_lookup_entry (node at line 21810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_lookup_entry"
		}"
		end

	gtk_accel_map_foreach (a_data: POINTER; a_foreach_func: POINTER) is
 		-- gtk_accel_map_foreach (node at line 22175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_foreach"
		}"
		end

	gtk_accel_map_foreach_unfiltered (a_data: POINTER; a_foreach_func: POINTER) is
 		-- gtk_accel_map_foreach_unfiltered (node at line 22343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_foreach_unfiltered"
		}"
		end

	-- `hidden' function _gtk_accel_path_is_valid skipped.
	gtk_accel_map_add_filter (a_filter_pattern: POINTER) is
 		-- gtk_accel_map_add_filter (node at line 32217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_add_filter"
		}"
		end

	gtk_accel_map_load_scanner (a_scanner: POINTER) is
 		-- gtk_accel_map_load_scanner (node at line 32747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load_scanner"
		}"
		end

	gtk_accel_map_load_fd (a_fd: INTEGER_32) is
 		-- gtk_accel_map_load_fd (node at line 33769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load_fd"
		}"
		end

	gtk_accel_map_load (a_file_name: POINTER) is
 		-- gtk_accel_map_load (node at line 34386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_load"
		}"
		end

	gtk_accel_map_change_entry (an_accel_path: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER; a_replace: INTEGER_32): INTEGER_32 is
 		-- gtk_accel_map_change_entry (node at line 36098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_map_change_entry"
		}"
		end

	-- `hidden' function _gtk_accel_map_add_group skipped.

end -- class GTKACCELMAP_EXTERNALS
