-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TEXT_CHILD_ANCHOR_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_text_child_anchor_struct_set_segment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for segment field of GTK_TEXT_CHILD_ANCHOR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_struct_set_segment"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_text_child_anchor_struct_get_segment (a_structure: POINTER): POINTER is
			-- Query for segment field of GTK_TEXT_CHILD_ANCHOR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_struct_get_segment"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextChildAnchor"
		}"
		end

end -- class GTK_TEXT_CHILD_ANCHOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

