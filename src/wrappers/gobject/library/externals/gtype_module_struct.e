-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPE_MODULE_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gtype_module_struct_set_use_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for use_count field of GTYPE_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_set_use_count"
		}"
		end

	gtype_module_struct_set_type_infos (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type_infos field of GTYPE_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_set_type_infos"
		}"
		end

	gtype_module_struct_set_interface_infos (a_structure: POINTER; a_value: POINTER) is
			-- Setter for interface_infos field of GTYPE_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_set_interface_infos"
		}"
		end

	gtype_module_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GTYPE_MODULE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_set_name"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtype_module_struct_get_use_count (a_structure: POINTER): NATURAL_32 is
			-- Query for use_count field of GTYPE_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_get_use_count"
		}"
		end

	gtype_module_struct_get_type_infos (a_structure: POINTER): POINTER is
			-- Query for type_infos field of GTYPE_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_get_type_infos"
		}"
		end

	gtype_module_struct_get_interface_infos (a_structure: POINTER): POINTER is
			-- Query for interface_infos field of GTYPE_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_get_interface_infos"
		}"
		end

	gtype_module_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GTYPE_MODULE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtype_module_struct_get_name"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeModule"
		}"
		end

end -- class GTYPE_MODULE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

