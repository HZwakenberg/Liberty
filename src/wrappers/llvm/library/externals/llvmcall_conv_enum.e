-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMCALL_CONV_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ccall_conv_low_level)  or else
				(a_value = fast_call_conv_low_level)  or else
				(a_value = cold_call_conv_low_level)  or else
				(a_value = x86stdcall_call_conv_low_level)  or else
				(a_value = x86fastcall_call_conv_low_level) )
		end

feature -- Setters
	default_create,
	set_ccall_conv is
		do
			value := ccall_conv_low_level
		end

	set_fast_call_conv is
		do
			value := fast_call_conv_low_level
		end

	set_cold_call_conv is
		do
			value := cold_call_conv_low_level
		end

	set_x86stdcall_call_conv is
		do
			value := x86stdcall_call_conv_low_level
		end

	set_x86fastcall_call_conv is
		do
			value := x86fastcall_call_conv_low_level
		end

feature -- Queries
	ccall_conv: BOOLEAN is
		do
			Result := (value=ccall_conv_low_level)
		end

	fast_call_conv: BOOLEAN is
		do
			Result := (value=fast_call_conv_low_level)
		end

	cold_call_conv: BOOLEAN is
		do
			Result := (value=cold_call_conv_low_level)
		end

	x86stdcall_call_conv: BOOLEAN is
		do
			Result := (value=x86stdcall_call_conv_low_level)
		end

	x86fastcall_call_conv: BOOLEAN is
		do
			Result := (value=x86fastcall_call_conv_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ccall_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCCallConv"
 			}"
 		end

	fast_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFastCallConv"
 			}"
 		end

	cold_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMColdCallConv"
 			}"
 		end

	x86stdcall_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86StdcallCallConv"
 			}"
 		end

	x86fastcall_call_conv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86FastcallCallConv"
 			}"
 		end


end -- class LLVMCALL_CONV_ENUM