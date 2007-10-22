indexing
	description: "GtkCellEditable -- Interface for widgets which can are used for editing cells."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class GTK_CELL_EDITABLE
inherit
	--   GInterface
	
	-- TODO: check if this tense in GTK documentation: "Prerequisites:
	-- GtkCellEditable requires GtkWidget" actually means that every
	-- GTK_CELL_EDITABLE is a GTK_WIDGET. Poor GTK programmers, they
	-- don't have Eiffel's multiple inheritance. I assume it is. Paolo
	-- 2006-01-21
	
	GTK_WIDGET

			-- GtkCellEditable is implemented by GtkEntry, GtkComboBox,
			-- GtkSpinButton and GtkComboBoxEntry.
insert
	GTK_CELL_EDITABLE_EXTERNALS

feature -- Editing
	start_editing (a_gdkevent: GDK_EVENT) is
			-- Begins editing on a cell_editable. `a_gdkevent' began the
			-- editing process; it may be Void, in the instance that
			-- editing was initiated through programatic means.
		do
			gtk_cell_editable_start_editing (handle, null_or(a_gdkevent))
		end

	editing_done is
			-- Emits the "editing_done" signal. This signal is a sign for
			-- the cell renderer to update its value from the cell.
		do
			gtk_cell_editable_editing_done  (handle)
		end

	remove_widget is
			-- Emits the "remove_widget" signal. This signal is meant to
			-- indicate that the cell is finished editing, and the widget
			-- may now be destroyed.
		do
			gtk_cell_editable_remove_widget (handle)
		end


feature -- The "editing-done" signal

	-- void        user_function                  (GtkCellEditable *celleditable,
	--                                             gpointer         user_data)         : Run last
	
	-- celleditable : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "remove-widget" signal

	-- void        user_function                  (GtkCellEditable *celleditable,
	--                                             gpointer         user_data)         : Run last
	
	-- celleditable : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
	
end
