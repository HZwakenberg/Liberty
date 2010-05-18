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
class LIBERTY_ETC_GRAMMAR
	--
	-- Grammar for the etc files (i.e. master configuration, in /etc for UNIX)
	--

insert
	EIFFEL_GRAMMAR
		redefine
			the_table
		end

create {LIBERTY_ETC}
	make

feature {}
	the_table: PARSE_TABLE is
		once
			Result := {PARSE_TABLE <<
											 "Master", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW master", "KW entity name", "Environment", "Cluster*", "KW end", "KW end of file" >> }, agent build_root >> };
											 "Environment", {PARSE_NON_TERMINAL << epsilon, Void;
																								{FAST_ARRAY[STRING] << "KW environment", "Environment_Variable*" >> }, Void >> };
											 "Environment_Variable*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Environment_Variable*");
																											 {FAST_ARRAY[STRING] << "Environment_Variable", "Environment_Variable*" >> }, agent build_continue_list("Environment_Variable", 0, "Environment_Variable*") >> };
											 "Environment_Variable", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "KW is", "KW string" >> }, Void >> };
											 "Cluster*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Cluster*");
																							{FAST_ARRAY[STRING] << "Cluster", "Cluster*" >> }, agent build_continue_list("Cluster", 0, "Cluster*") >> };
											 "Cluster", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW cluster", "KW entity name", "Location", "Version", "Includes", "Needs", "KW end", "KW end of file" >> }, agent build_root >> };
											 "Needs", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW needs", "Cluster_Configuration*" >>}, Void >> };
											 "Cluster_Configuration*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Cluster_Configuration*");
																											  {FAST_ARRAY[STRING] << "Cluster_Configuration", "Cluster_Configuration*" >> }, agent build_continue_list("Cluster_Configuration", 0, "Cluster_Configuration*");
																											  {FAST_ARRAY[STRING] << "Cluster_Configuration", "KW ;", "Cluster_Configuration*" >> }, agent build_continue_list("Cluster_Configuration", 1, "Cluster_Configuration*") >> };
											 "Cluster_Configuration", { PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW cluster name", "Cluster_Constraints", "Cluster_Details" >> }, Void >> };
											 "Cluster_Constraints", {PARSE_NON_TERMINAL << epsilon, Void;
																										  {FAST_ARRAY[STRING] << "KW (", "Cluster_Version_Constraint", "KW )" >> }, Void >> };
											 "Cluster_Version_Constraint", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW version", "Version_Operator", "KW string" >> }, Void >> };
											 "Version_Operator", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW =" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW <=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW >=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW /=" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW <" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW >" >> }, Void >> };
											 "Cluster_Details", {PARSE_NON_TERMINAL << epsilon, Void;
																									 {FAST_ARRAY[STRING] << "Concurrency", "Assertion", "Debug", "KW end" >> }, Void >> };
											 "Assertion", {PARSE_NON_TERMINAL << epsilon, Void;
																							 {FAST_ARRAY[STRING] << "KW assertion", "Assertion_Level" >> }, Void >> };
											 "Assertion_Level", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW none" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW require" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW ensure" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW loop" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW check" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW all" >> }, Void >> };
											 "Debug", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW debug", "Debug_Configuration*" >> }, Void >> };
											 "Debug_Configuration*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Debug_Configuration*");
																											{FAST_ARRAY[STRING] << "Debug_Configuration", "Debug_Configuration*" >> }, agent build_continue_list("Debug_Configuration", 0, "Debug_Configuration+");
																											{FAST_ARRAY[STRING] << "Debug_Configuration", "KW ;", "Debug_Configuration*" >> }, agent build_continue_list("Debug_Configuration", 1, "Debug_Configuration*") >> };
											 "Debug_Configuration", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW default", "KW :", "Debug_Key+" >> }, Void;
																										  {FAST_ARRAY[STRING] << "KW class name", "KW :", "Debug_Key+" >> }, Void >> };
											 "Debug_Key+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Debug_Key" >> }, agent build_new_list("Debug_Key", "Debug_Key+");
																							  {FAST_ARRAY[STRING] << "Debug_Key", "KW ,", "Debug_Key+" >> }, agent build_continue_list("Debug_Key", 1, "Debug_Key+") >> };
											 "Debug_Key", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW string" >> }, Void >> };
											 "Concurrency", {PARSE_NON_TERMINAL << epsilon, Void >> };

											 "KW master", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "master"), Void);
											 "KW environment", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "environment"), Void);
											 "KW assertion", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "assertion"), Void);
											 "KW none", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "none"), Void);
											 "KW require", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "require"), Void);
											 "KW ensure", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "ensure"), Void);
											 "KW loop", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "loop"), Void);
											 "KW check", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "check"), Void);
											 "KW all", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "all"), Void);
											 "KW needs", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "needs"), Void);
											 "KW version", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "version"), Void);
											 "KW <", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<"), Void);
											 "KW >", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">"), Void);
											 "KW <=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<="), Void);
											 "KW >=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">="), Void);
											 "KW =", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "="), Void);
											 "KW /=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "/="), Void);
											 "KW concurrency", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "concurrency"), Void);
											 "KW debug", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "debug"), Void);
											 "KW :", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ":"), Void);
											 "KW .", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "."), Void);
											 "KW ;", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ";"), Void);
											 "KW ,", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ","), Void);
											 "KW (", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "("), Void);
											 "KW )", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")"), Void);
											 "KW end", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
											 "KW thread", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "thread"), Void);
											 "KW process", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "process"), Void);
											 "KW server", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "server"), Void);
											 "KW client", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "client"), Void);
											 "KW is", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
											 "KW daemon", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "daemon"), Void);
											 "KW True", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "True"), Void);
											 "KW False", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "False"), Void);
											 "KW creation", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "creation"), Void);
											 "KW as needed", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "as needed"), Void);
											 "KW pool of", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "pool of"), Void);
											 "KW shared", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "shared"), Void);
											 "KW listen", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "listen"), Void);
											 "KW connect", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "connect"), Void);
											 "KW mmap", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "mmap"), Void);
											 "KW message", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "message"), Void);
											 "KW cluster", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "cluster"), Void);
											 "KW includes", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "includes"), Void);
											 "KW not", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "not"), Void);
											 "KW configuration", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "configuration"), Void);
											 "KW overrides", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "overrides"), Void);
											 "KW clusters", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "clusters"), Void);
											 "KW string", create {PARSE_TERMINAL}.make(agent parse_string, Void);
											 "KW cluster name", create {PARSE_TERMINAL}.make(agent parse_class_or_cluster_name, Void);
											 "KW class name", create {PARSE_TERMINAL}.make(agent parse_class_or_cluster_name, Void);
											 "KW entity name", create {PARSE_TERMINAL}.make(agent parse_entity_name, Void);
											 "KW end of file", create {PARSE_TERMINAL}.make(agent parse_end, Void)
											 >> };
		end

	parse_class_or_cluster_name (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position, dot_position: like position; image: STRING; c: CHARACTER; s: INTEGER
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			from
				image := once ""
				image.clear_count
			until
				s < 0
			loop
				if buffer.end_reached then
					s := -1
				else
					c := buffer.current_character
					inspect s
					when 0 then
						-- expecting a letter
						inspect c
						when 'A'..'Z' then
							image.extend(c)
							next_character(buffer)
							s := 1
						else
							s := -1
						end
					when 1 then
						-- at least a letter read
						inspect c
						when 'A'..'Z' then
							image.extend(c)
							next_character(buffer)
						when '.' then
							dot_position := position
							next_character(buffer)
							s := 2
						else
							s := -1
						end
					when 2 then
						-- after a dot
						inspect c
						when 'A'..'Z' then
							image.extend('.')
							image.extend(c)
							next_character(buffer)
							s := 1
						else
							restore(buffer, dot_position)
							s := -1
						end
					end
				end
			end
			if image.is_empty then
				restore(buffer, old_position)
			else
				create Result.make(image, last_blanks.twin, start_position)
			end
		end

end
