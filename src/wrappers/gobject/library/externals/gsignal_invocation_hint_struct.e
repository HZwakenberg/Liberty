-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSIGNAL_INVOCATION_HINT_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gsignal_invocation_hint_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for signal_id field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_set_signal_id"
		}"
		end

	gsignal_invocation_hint_struct_set_detail (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for detail field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_set_detail"
		}"
		end

	gsignal_invocation_hint_struct_set_run_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for run_type field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_set_run_type"
		}"
		end

feature {} -- Low-level queries

	gsignal_invocation_hint_struct_get_signal_id (a_structure: POINTER): NATURAL_32 is
			-- Query for signal_id field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_get_signal_id"
		}"
		end

	gsignal_invocation_hint_struct_get_detail (a_structure: POINTER): NATURAL_32 is
			-- Query for detail field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_get_detail"
		}"
		end

	gsignal_invocation_hint_struct_get_run_type (a_structure: POINTER): INTEGER is
			-- Query for run_type field of GSIGNAL_INVOCATION_HINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_invocation_hint_struct_get_run_type"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSignalInvocationHint"
		}"
		end

end -- class GSIGNAL_INVOCATION_HINT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

