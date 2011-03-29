-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INDEXABLE[E_]
   --
   -- An `INDEXABLE[E_]' is a finite readable sequence of objects of type E_.
   --
   -- A good performance should always be obtained by sequentially acessing an `INDEXABLE' with increasing
   -- indexes (from `lower' to `upper'), as demonstrated in the following code snippet :
   --
   --  from
   --     i := a_indexable.lower
   --  until
   --     i > a_indexable.upper
   --  loop
   --     do_something_with(a_indexable.item(i))
   --     i := i + 1
   --  end
   --
   -- Other accessing methods (including random access and sequential access from `upper' to `lower') may or
   -- may not lead to acceptable performance, depending on the particular implementation of `INDEXABLE'.
   --

inherit
   HOARD[E_]

feature {ANY} -- Indexing:
   lower: INTEGER is
         -- Minimum index.
         --
         -- See also `upper', `valid_index', `item'.
      deferred
      end

   upper: INTEGER is
         -- Maximum index.
         --
         -- See also `lower', `valid_index', `item'.
      deferred
      end

   valid_index (i: INTEGER): BOOLEAN is
         -- True when `i' is valid (i.e., inside actual bounds).
         --
         -- See also `lower', `upper', `item'.
      do
         Result := lower <= i and then i <= upper
      ensure
         definition: Result = (lower <= i and i <= upper)
      end

feature {ANY} -- Accessing:
   item (i: INTEGER): E_ is
         -- Item at the corresponding index `i'.
         --
         -- See also `lower', `upper', `valid_index'.
      require
         valid_index(i)
      deferred
      end

   first: like item is
         -- The very `first' item.
         --
         -- See also `last', `item'.
      require
         not is_empty
      deferred
      ensure
         definition: Result = item(lower)
      end

   last: like item is
         -- The `last' item.
         --
         -- See also `first', `item'.
      require
         not is_empty
      deferred
      ensure
         definition: Result = item(upper)
      end

feature {ANY} -- Looking and Searching:
   has (x: like item): BOOLEAN is
         -- Look for `x' using `is_equal' for comparison.
         --
         -- See also `fast_has', `index_of', `fast_index_of'.
      deferred
      ensure
         definition: Result = valid_index(first_index_of(x))
      end

   fast_has (x: like item): BOOLEAN is
         -- Look for `x' using basic `=' for comparison.
         --
         -- See also `has', `fast_index_of', `index_of'.
      deferred
      ensure
         definition: Result = valid_index(fast_first_index_of(x))
      end

   first_index_of (element: like item): INTEGER is
         -- Give the index of the first occurrence of `element' using `is_equal' for comparison.
         -- Answer `upper + 1' when `element' is not inside.
         --
         -- See also `fast_first_index_of', `index_of', `last_index_of', `reverse_index_of'.
      deferred
      ensure
         definition: Result = index_of(element, lower)
      end

   index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `upper + 1' when `element' when the search fail.
         --
         -- See also `fast_index_of', `reverse_index_of', `first_index_of'.
      deferred
      ensure
         Result.in_range(start_index, upper + 1)
         valid_index(Result) implies (create {SAFE_EQUAL[E_]}).test(element, item(Result))
      end

   reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or before
         -- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_reverse_index_of', `last_index_of', `index_of'.
      require
         valid_index(start_index)
      deferred
      ensure
         Result.in_range(lower - 1, start_index)
         valid_index(Result) implies item(Result).is_equal(element)
      end

   last_index_of (element: like item): INTEGER is
         -- Using `is_equal' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_last_index_of', `reverse_index_of', `index_of'.
      deferred
      ensure
         definition: Result = reverse_index_of(element, upper)
      end

   fast_first_index_of (element: like item): INTEGER is
         -- Give the index of the first occurrence of `element' using basic `=' for comparison.
         -- Answer `upper + 1' when `element' is not inside.
         --
         -- See also `first_index_of', `last_index_of', `fast_last_index_of'.
      deferred
      ensure
         definition: Result = fast_index_of(element, lower)
      end

   fast_index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
         -- `start_index'. Answer `upper + 1' when `element' when the search fail.
         --
         -- See also `index_of', `fast_reverse_index_of', `fast_first_index_of'.
      deferred
      ensure
         Result.in_range(start_index, upper + 1)
         valid_index(Result) implies element = item(Result)
      end

   fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
         -- Using basic `=' comparison, gives the index of the first occurrence of `element' at or before
         -- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `reverse_index_of', `fast_index_of', `fast_last_index_of'.
      require
         valid_index(start_index)
      deferred
      ensure
         Result.in_range(lower - 1, start_index)
         valid_index(Result) implies item(Result) = element
      end

   fast_last_index_of (element: like item): INTEGER is
         -- Using basic `=' for comparison, gives the index of the last occurrence of `element' at or before
         -- `upper'. Search is done in reverse direction, which means from the `upper' down to the
         -- `lower' index . Answer `lower -1' when the search fail.
         --
         -- See also `fast_reverse_index_of', `last_index_of'.
      deferred
      ensure
         definition: Result = fast_reverse_index_of(element, upper)
      end

feature {ANY} -- Agent-based features:
   do_all (action: ROUTINE[TUPLE[E_]]) is
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists', `aggregate'.
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            action.call([item(i)])
            i := i + 1
         end
      end

   for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Do all items satisfy `test'?
         --
         -- See also `do_all', `exists', `aggregate'.
      local
         i: INTEGER
      do
         from
            Result := True
            i := lower
         until
            not Result or else i > upper
         loop
            Result := test.item([item(i)])
            i := i + 1
         end
      end

   exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Does at least one item satisfy `test'?
         --
         -- See also `do_all', `for_all', `aggregate'.
      local
         i: INTEGER
      do
         from
            i := lower
         until
            Result or else i > upper
         loop
            Result := test.item([item(i)])
            i := i + 1
         end
      end

   aggregate (action: FUNCTION[TUPLE[E_, E_], E_]; initial: E_): E_ is
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `do_all', `for_all', `exists'.
      local
         i: INTEGER
      do
         from
            Result := initial
            i := lower
         until
            i > upper
         loop
            Result := action.item([Result, item(i)])
            i := i + 1
         end
      end

end -- class INDEXABLE
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
