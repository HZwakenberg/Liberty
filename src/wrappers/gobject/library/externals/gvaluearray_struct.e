-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVALUEARRAY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gvaluearray_struct_set_n_values (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_values field of GVALUEARRAY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_set_n_values"
		}"
		end

	gvaluearray_struct_set_values (a_structure: POINTER; a_value: POINTER) is
			-- Setter for values field of GVALUEARRAY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_set_values"
		}"
		end

	gvaluearray_struct_set_n_prealloced (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_prealloced field of GVALUEARRAY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_set_n_prealloced"
		}"
		end

feature {} -- Low-level queries

	gvaluearray_struct_get_n_values (a_structure: POINTER): NATURAL_32 is
			-- Query for n_values field of GVALUEARRAY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_get_n_values"
		}"
		end

	gvaluearray_struct_get_values (a_structure: POINTER): POINTER is
			-- Query for values field of GVALUEARRAY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_get_values"
		}"
		end

	gvaluearray_struct_get_n_prealloced (a_structure: POINTER): NATURAL_32 is
			-- Query for n_prealloced field of GVALUEARRAY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvaluearray_struct_get_n_prealloced"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GValueArray"
		}"
		end

end -- class GVALUEARRAY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
