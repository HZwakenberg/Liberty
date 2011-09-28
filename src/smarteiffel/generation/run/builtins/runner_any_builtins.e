-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class RUNNER_ANY_BUILTINS[E_]
   --
   -- a collection of builtins tools
   --

insert
   RUNNER_FACET

feature {RUNNER_BUILTINS}
   call (processor: RUNNER_PROCESSOR) is
      deferred
      end

feature {}
   left (processor: RUNNER_PROCESSOR): RUNNER_NATIVE_EXPANDED[E_] is
      do
         Result ::= processor.current_frame.target
      end

   right (processor: RUNNER_PROCESSOR): RUNNER_NATIVE_EXPANDED[E_] is
      do
         Result ::= processor.current_frame.arguments.first
      end

   set_return (processor: RUNNER_PROCESSOR; value: E_) is
      local
         the_factory: RUNNER_EXPANDED_FACTORY[E_]
      do
         processor.current_frame.set_return(the_factory.new(processor, value, processor.current_frame.type_of_result))
      end

end -- class RUNNER_ANY_BUILTINS
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