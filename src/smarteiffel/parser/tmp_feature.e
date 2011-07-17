-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TMP_FEATURE
	--
	-- Temporary object used during syntax analysis.
	-- At the end, the good effective ANONYMOUS_FEATURE is choose.
	--

insert
	GLOBALS

creation {EIFFEL_PARSER}
	initialize

feature {EIFFEL_PARSER}
	first_name: FEATURE_NAME is
		do
			Result := names.first
		end

	arguments: FORMAL_ARG_LIST

	type: TYPE_MARK

	header_comment: COMMENT

	obsolete_mark: MANIFEST_STRING

	require_assertion: REQUIRE_ASSERTION

	local_vars: LOCAL_VAR_LIST

	routine_body: INSTRUCTION

	names: FAST_ARRAY[FEATURE_NAME]

	busy: BOOLEAN

	initialize is
		require
			not busy
		do
			if names = Void then
				create names.with_capacity(8)
			else
				names.clear_count
			end
			arguments := Void
			type := Void
			header_comment := Void
			obsolete_mark := Void
			require_assertion := Void
			local_vars := Void
			routine_body := Void
			busy := True
		ensure
			arguments = Void
			type = Void
			header_comment = Void
			obsolete_mark = Void
			require_assertion = Void
			local_vars = Void
			routine_body = Void
			names.is_empty
			busy
		end

	done is
		require
			busy
		do
			busy := False
		ensure
			not busy
		end

	add_synonym (a_name: FEATURE_NAME) is
		require
			a_name /= Void
		do
			names.add_last(a_name)
		end

	set_arguments (args: like arguments) is
		require
			args /= Void
		do
			arguments := args
		end

	set_type (t: like type) is
		require
			t /= Void
		do
			type := t
		ensure
			type = t
		end

	set_header_comment (hc: like header_comment) is
		do
			header_comment := hc
		end

	set_obsolete_mark (om: like obsolete_mark) is
		do
			obsolete_mark := om
		end

	set_local_vars (lv: like local_vars) is
		do
			local_vars := lv
		end

	set_require (sp: POSITION; else_flag: BOOLEAN; hc: COMMENT; al: FAST_ARRAY[ASSERTION]) is
		do
			if hc /= Void or else al /= Void then
				create require_assertion.make(sp, else_flag, hc, al)
			end
		end

	set_routine_body (rb: like routine_body) is
		do
			routine_body := rb
		end

	as_writable_attribute: FEATURE_TEXT is
		require
			type /= Void
			arguments = Void
		do
			create Result.writable_attribute(n, type, obsolete_mark, header_comment, require_assertion)
		end

	as_boolean_constant (value: EXPRESSION): FEATURE_TEXT is
		require
			value /= Void
			{BOOLEAN_CONSTANT} ?:= value
		local
			boolean_constant: BOOLEAN_CONSTANT
		do
			boolean_constant ::= value
			constant_attribute_common_checks(value)
			if type.is_boolean then
				create Result.boolean_constant(n, type, boolean_constant)
			else
				error_handler.add_position(type.start_position)
				error_handler.append("The type of this constant feature should be BOOLEAN.")
				error_handler.print_as_fatal_error
			end
		end

	as_character_constant (value: EXPRESSION): FEATURE_TEXT is
		require
			value /= Void
			{CHARACTER_CONSTANT} ?:= value
		local
			character_constant: CHARACTER_CONSTANT
		do
			character_constant ::= value
			constant_attribute_common_checks(value)
			if not type.is_character then
				error_handler.add_position(type.start_position)
				error_handler.append("The type of this constant feature should be CHARACTER.")
				error_handler.print_as_fatal_error
			end
			create Result.character_constant(n, type, character_constant)
		end

	as_constant (value: EXPRESSION): FEATURE_TEXT is
		require
			value /= Void
		local
			integer_constant: INTEGER_CONSTANT; integer_type_mark: INTEGER_TYPE_MARK
			real_constant: REAL_CONSTANT
		do
			constant_attribute_common_checks(value)
			if {INTEGER_CONSTANT} ?:= value then
				integer_constant ::= value
				if type.is_integer then
					integer_type_mark ::= type
					inspect
						integer_type_mark.bit_count
					when 8 then
						if not integer_constant.value_memory.fit_integer_8 then
							error_handler.add_position(integer_type_mark.start_position)
							error_handler.add_position(integer_constant.start_position)
							error_handler.append("Value out of INTEGER_8 range.")
							error_handler.print_as_fatal_error
						end
					when 16 then
						if not integer_constant.value_memory.fit_integer_16 then
							error_handler.add_position(integer_type_mark.start_position)
							error_handler.add_position(integer_constant.start_position)
							error_handler.append("Value out of INTEGER_16 range.")
							error_handler.print_as_fatal_error
						end
					when 32 then
						if not integer_constant.value_memory.fit_integer_32 then
							error_handler.add_position(integer_type_mark.start_position)
							error_handler.add_position(integer_constant.start_position)
							error_handler.append("Value out of INTEGER_32 range.")
							error_handler.print_as_fatal_error
						end
					when 64 then
					end
					create Result.integer_constant(n, integer_type_mark, integer_constant)
				elseif type.is_real then
					--|*** Check for truncation *** (Dom Oct 2004) ***
					create Result.real_constant(n, type, integer_constant.to_real_constant)
				else
					error_handler.add_position(type.start_position)
					error_handler.append("The type of this constant feature should be INTEGER or REAL.")
					error_handler.print_as_fatal_error
				end
			elseif {REAL_CONSTANT} ?:= value then
				real_constant ::= value
				if type.is_real then
					create Result.real_constant(n, type, real_constant)
					real_constant.set_result_type(type)
				else
					error_handler.add_position(type.start_position)
					error_handler.append("The type of this constant feature should be REAL.")
					error_handler.print_as_fatal_error
				end
			else
				error_handler.add_position(type.start_position)
				error_handler.append("Cannot use type ")
				error_handler.append(type.written_name.to_string)
				error_handler.append(" to define a constant.")
				--|*** The error message should indicate the list of
				--| allowed types: CHARACTER, INTEGER, INTEGER_8/16/32/64, REAL, REAL_32/64/80/128/EXTENDED, STRING
				--| and UNICODE_STRING.
				--|*** Is this list complete and tested ? *** Dom March 25th ***
				error_handler.print_as_fatal_error
			end
		end

	as_string_constant (value: MANIFEST_STRING): FEATURE_TEXT is
		do
			constant_attribute_common_checks(value)
			if not type.is_string then
				error_handler.add_position(type.start_position)
				error_handler.append("The type of this constant feature should be STRING.")
				error_handler.print_as_fatal_error
			end
			create Result.string_constant(n, type, value)
		end

	as_deferred_routine: FEATURE_TEXT is
		do
			if type = Void then
				create Result.deferred_procedure(n, arguments, obsolete_mark, header_comment, require_assertion)
			else
				create Result.deferred_function(n, arguments, type, obsolete_mark, header_comment, require_assertion)
			end
		end

	as_external_routine (native: NATIVE; alias_tag: MANIFEST_STRING): FEATURE_TEXT is
		do
			if type = Void then
				create Result.external_procedure(n, arguments, obsolete_mark, header_comment, require_assertion, native, alias_tag)
			else
				create Result.external_function(n, arguments, type, obsolete_mark, header_comment, require_assertion, native, alias_tag)
			end
		end

	as_once_routine: FEATURE_TEXT is
		do
			if type = Void then
				create Result.once_procedure(n, arguments, obsolete_mark, header_comment, require_assertion, local_vars, routine_body)
			else
				create Result.once_function(n, arguments, type, obsolete_mark, header_comment, require_assertion, local_vars, routine_body)
			end
		end

	as_procedure_or_function: FEATURE_TEXT is
		do
			if type = Void then
				create Result.e_procedure(n, arguments, obsolete_mark, header_comment, require_assertion, local_vars, routine_body)
			else
				create Result.e_function(n, arguments, type, obsolete_mark, header_comment, require_assertion, local_vars, routine_body)
			end
		end

	as_unique_constant: FEATURE_TEXT is
		do
			constant_attribute_common_checks(Void)
			if not type.is_integer then
				error_handler.add_position(names.first.start_position)
				error_handler.append("Unique feature must have INTEGER type.")
				error_handler.print_as_fatal_error
			end
			create Result.unique_constant(n, type)
		end

feature {}
	constant_attribute_common_checks (constant_expression: EXPRESSION) is
			-- Where `constant_expression' is the one written just after the "is" keyword (except for
			-- a "unique" definition).
		do
			if type = Void or else arguments /= Void then
				if constant_expression /= Void then
					error_handler.append("Using a static constant expression just after the %"is%" keyword %
												%is suitable only for a constant attribute definition. The constant %
												%found (i.e. ")
					error_handler.add_expression(constant_expression)
					error_handler.append(") cannot be used as the definition of the feature ")
					error_handler.add_feature_name(names.first)
					error_handler.append(".")
				else
					error_handler.append("A %"unique%" definition is actually a constant attribute definition.")
				end
				error_handler.append(" Actually, feature ")
				error_handler.add_feature_name(names.first)
				if type = Void then
					error_handler.append(" has no result type")
				else
					error_handler.append(" has an argument list")
				end
				error_handler.append(". Bad constant-attribute definition.")
				error_handler.add_position(names.first.start_position)
				error_handler.print_as_fatal_error
			elseif not type.is_static then
				error_handler.add_position(type.start_position)
				error_handler.append("Must not use such a non-static type mark for a constant-attribute %
											%definition.")
				error_handler.print_as_fatal_error
			end
		end

	n: FEATURE_NAME_LIST is
		require
			not names.is_empty
		do
			if names.count = 1 then
				create Result.make_1(names.first)
			else
				create Result.make_n(names)
			end
		end

end -- class TMP_FEATURE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------