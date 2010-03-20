-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FOREIGN_DLL_FUNCTION

inherit
	FOREIGN_AGENT

creation {ANY}
	make

feature {}
	make (external_function: STRING; a_parameter_types: like parameter_types; a_result_type: like result_type) is
			-- This signature is surely not right. It will depend in the
			-- dlopen library.
		require
			external_function /= Void
			a_parameter_types /= Void
		do
			not_yet_implemented
		ensure
			parameter_types = a_parameter_types
			result_type = a_result_type
		end

end -- class FOREIGN_DLL_FUNCTION
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
