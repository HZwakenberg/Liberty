-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_TYPE_PARENT_LOADER
--
-- Loads the type's parents, but also initializes general type information such as obsolete, deferred and so
-- on
--

insert
	LIBERTY_TYPE_BUILDER_TOOLS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_builder: like builder; a_type: like type; a_universe: like universe; default_effective_generic_parameters: like effective_generic_parameters) is
		require
			a_builder /= Void
			a_type /= Void
			a_universe /= Void
		do
			builder := a_builder
			type := a_type
			universe := a_universe
			effective_generic_parameters := default_effective_generic_parameters
		ensure
			builder = a_builder
			type = a_type
			universe = a_universe
			effective_generic_parameters = default_effective_generic_parameters
		end

feature {LIBERTY_TYPE_BUILDER}
	load is
		local
			ast: LIBERTY_AST_ONE_CLASS
			has_parents: BOOLEAN
		do
			ast := type.ast
			if ast.obsolete_clause.count > 0 then
				errors.add_position(semantics_position_at(ast.obsolete_clause.string))
				errors.set(level_warning, decoded_string(ast.obsolete_clause.string))
			end
			if is_any then
				heart_beat.beat
			else
				has_parents := add_parents(ast.inherit_clause, True, False)
				has_parents := add_parents(ast.insert_clause, False, has_parents)
				check
					has_parents
				end
			end
		end

feature {}
	add_parents (parents: LIBERTY_AST_LIST[LIBERTY_AST_PARENT]; conformant, had_parents: BOOLEAN): BOOLEAN is
			-- Returns True if at least a parent was added
		local
			i: INTEGER; parent_clause: LIBERTY_AST_PARENT
			parent: LIBERTY_TYPE
		do
			debug
				if conformant then
					std_output.put_line("Adding conformant parents to " + type.full_name)
				else
					std_output.put_line("Adding non-conformant parents to " + type.full_name)
				end
			end
			from
				Result := had_parents
				i := parents.list_lower
			until
				errors.has_error or else i > parents.list_upper
			loop
				parent_clause := parents.list_item(i)
				parent := builder.get_type_from_type_definition(parent_clause.type_definition)
				debug
					if conformant then
						std_output.put_line("  " + type.full_name + " <-- " + parent.full_name)
					else
						std_output.put_line("  " + type.full_name + " <+- " + parent.full_name)
					end
				end
				if parent /= Void then
					type.add_parent(parent, conformant)
					Result := True
				end
				i := i + 1
			end
			if not conformant and then not Result and then not errors.has_error then
				debug
					std_output.put_line(type.name + ": adding default parent ANY")
				end
				parent := universe.type_any
				type.add_parent(parent, False)
				Result := True
			end
		end

end -- class LIBERTY_TYPE_PARENT_LOADER
