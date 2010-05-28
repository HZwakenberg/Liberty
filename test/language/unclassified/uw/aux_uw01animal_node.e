indexing
	description: "nodes representing animals";
	status: "See notice at end of class";
	author: "Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>";
	version: "$Revision$";
	last_modification: "$Date$";
class AUX_UW01ANIMAL_NODE

inherit
	AUX_UW01YES_NO_NODE
		rename
			make_full as make_full_yes_no,
			make_simple as make_simple_yes_no,
			description as name
		redefine
			yes_action, no_action
		end;

creation
	make_simple,
	make_full

feature
	
	make_simple(nam : STRING) is
			-- set up node with name `nam'
		require
			good_name: nam /= Void and then nam.count > 0
		do
			make_simple_yes_no(nam)
		end; -- make_simple

	make_full(y, n, p : AUX_UW01YES_NO_NODE; nam : STRING) is
			-- set up node with name `nam', yes link `y', 
			-- no link `n', and parent `p'
		require
			good_name: nam /= Void and then nam.count > 0
		do
			make_full_yes_no(y, n, p, nam)
		end; -- make_full
	
	execute is
			-- perform action
		do
			extra_io.print_multi({ARRAY[STRING] 1, <<language.s4, name,
					       language.s5>>});
		end; -- execute
	
	yes_action is
			-- the animal has been guessed correctly
		do
			io.put_string(language.s2);
		end; -- yes_action

	no_action is
			-- the animal is unknown
		do
			io.put_string(language.s3);
		end; -- no_action
	
	read_answer is
			-- ask question about animal
		do
			extra_io.read_yes_no(language.s6);
			last_answer := extra_io.last_boolean
		end; -- read_answer
	
end -- AUX_UW01ANIMAL_NODE
-- Copyright (c) 1998 by Ulrich Windl
-- Copyright (c) 1998 by Klinikum der Universit�t Regensburg,
--      D-93042 Regensburg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA