-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_NO_METHOD_HANDLER
   --
   -- Default method handler when no handler is returned by the factory.
   -- Just answers 501 (Not Implemented).
   --

inherit
   HTTP_METHOD_HANDLER

create {HTTP_CONNECTION}
   make

feature {HTTP_CONNECTION}
   prepare_ok: BOOLEAN is True

   method: STRING is "UNKNOWN"

   add_header (header: STRING) is
      do
         -- forget it
      end

   add_body (body: STRING) is
      do
         -- forget it
      end

   make (a_uri, a_version: STRING) is
      do
         uri := a_uri
         version := a_version
         if response_header = Void then
            create response_header.with_capacity(2)
            response_body := once ""
         end
      end

   prepare_answer is
      do
         code := 501
      end

   expect (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         events.expect(t.timeout(0))
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := True
      end

end -- class HTTP_NO_METHOD_HANDLER
--
-- Copyright (c) 2009-2014 by all the people cited in the AUTHORS file.
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
