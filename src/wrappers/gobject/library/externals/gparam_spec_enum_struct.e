-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAM_SPEC_ENUM_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gparam_spec_enum_struct_set_enum_class (a_structure: POINTER; a_value: POINTER) is
			-- Setter for enum_class field of GPARAM_SPEC_ENUM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_enum_struct_set_enum_class"
		}"
		end

	gparam_spec_enum_struct_set_default_value (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for default_value field of GPARAM_SPEC_ENUM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_enum_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparam_spec_enum_struct_get_enum_class (a_structure: POINTER): POINTER is
			-- Query for enum_class field of GPARAM_SPEC_ENUM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_enum_struct_get_enum_class"
		}"
		end

	gparam_spec_enum_struct_get_default_value (a_structure: POINTER): INTEGER_32 is
			-- Query for default_value field of GPARAM_SPEC_ENUM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_enum_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecEnum"
		}"
		end

end -- class GPARAM_SPEC_ENUM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
