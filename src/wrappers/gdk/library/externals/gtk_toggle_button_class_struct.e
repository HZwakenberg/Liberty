-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOGGLE_BUTTON_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_toggle_button_class_struct_set_toggled (a_structure: POINTER; a_value: POINTER) is
			-- Setter for toggled field of GTK_TOGGLE_BUTTON_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_class_struct_set_toggled"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_toggle_button_class_struct_get_toggled (a_structure: POINTER): POINTER is
			-- Query for toggled field of GTK_TOGGLE_BUTTON_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_button_class_struct_get_toggled"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToggleButtonClass"
		}"
		end

end -- class GTK_TOGGLE_BUTTON_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

