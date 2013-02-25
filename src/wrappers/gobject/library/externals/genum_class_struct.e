-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GENUM_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	genum_class_struct_set_minimum (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for minimum field of GENUM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_set_minimum"
		}"
		end

	genum_class_struct_set_maximum (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for maximum field of GENUM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_set_maximum"
		}"
		end

	genum_class_struct_set_n_values (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_values field of GENUM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_set_n_values"
		}"
		end

	genum_class_struct_set_values (a_structure: POINTER; a_value: POINTER) is
			-- Setter for values field of GENUM_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_set_values"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_type_class.
	genum_class_struct_get_minimum (a_structure: POINTER): INTEGER_32 is
			-- Query for minimum field of GENUM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_get_minimum"
		}"
		end

	genum_class_struct_get_maximum (a_structure: POINTER): INTEGER_32 is
			-- Query for maximum field of GENUM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_get_maximum"
		}"
		end

	genum_class_struct_get_n_values (a_structure: POINTER): NATURAL_32 is
			-- Query for n_values field of GENUM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_get_n_values"
		}"
		end

	genum_class_struct_get_values (a_structure: POINTER): POINTER is
			-- Query for values field of GENUM_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genum_class_struct_get_values"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GEnumClass"
		}"
		end

end -- class GENUM_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

