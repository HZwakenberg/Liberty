-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCCLOSURE_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gcclosure_struct_set_callback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for callback field of GCCLOSURE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcclosure_struct_set_callback"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field closure.
	gcclosure_struct_get_callback (a_structure: POINTER): POINTER is
			-- Query for callback field of GCCLOSURE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcclosure_struct_get_callback"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GCClosure"
		}"
		end

end -- class GCCLOSURE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

