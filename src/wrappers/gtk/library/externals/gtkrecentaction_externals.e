-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTACTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_action_get_type: NATURAL_32 is
 		-- gtk_recent_action_get_type (node at line 5987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_action_get_type()"
		}"
		end

	gtk_recent_action_set_show_numbers (an_action: POINTER; a_show_numbers: INTEGER_32) is
 		-- gtk_recent_action_set_show_numbers (node at line 20706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_action_set_show_numbers"
		}"
		end

	gtk_recent_action_new_for_manager (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER; a_manager: POINTER): POINTER is
 		-- gtk_recent_action_new_for_manager (node at line 21287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_action_new_for_manager"
		}"
		end

	gtk_recent_action_get_show_numbers (an_action: POINTER): INTEGER_32 is
 		-- gtk_recent_action_get_show_numbers (node at line 24751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_action_get_show_numbers"
		}"
		end

	gtk_recent_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_recent_action_new (node at line 30433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_action_new"
		}"
		end


end -- class GTKRECENTACTION_EXTERNALS
