indexing
	description: "."
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
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description

			-- The GtkEntry widget is a single line text entry widget. A
			-- fairly large set of key bindings are supported by
			-- default. If the entered text is longer than the allocation
			-- of the widget, the widget will scroll so that the cursor
			-- position is visible.

class GTK_ENTRY
inherit
	GTK_WIDGET -- DELETE: undefine make end --rename make as make_gtk_widget end
	GTK_EDITABLE 
	GTK_CELL_EDITABLE
		-- GtkEntry implements AtkImplementorIface, GtkCellEditable and GtkEditable.
	G_OBJECT_RETRIEVER [GTK_MENU]
insert
	GTK_ENTRY_EXTERNALS
creation make, from_external_pointer
feature {NONE} -- Creation
	make is
			-- Creates a new GtkEntry widget.
		do
			handle:=gtk_entry_new
			store_eiffel_wrapper
		end

feature
	set_text (a_text: STRING) is
			-- Sets the text in the widget to the given value, replacing
			-- the current contents.
		require valid_text: a_text/=Void
		do
			gtk_entry_set_text (handle, a_text.to_external)
		end

	text: STRING is
			-- the contents of the entry widget.
		do
			-- TODO: implement something that doesn't involve copying 
			create Result.from_external_copy(gtk_entry_get_text(handle))
			-- The result of gtk_entry_get_text is a pointer to the
			-- contents of the widget as a string. This string points to
			-- internally allocated storage in the widget and must not be
			-- freed, modified or stored.
		end

feature -- visibility
	set_visible is
			-- Makes the contents of the entry visible.
		do
			gtk_entry_set_visibility (handle,1)
		ensure is_visible
		end

	set_invisible is
			-- Makes the contents of the entry invisible. Characters are
			-- displayed as the invisible char, and will also appear that
			-- way when the text in the entry widget is copied
			-- elsewhere. The default invisible char is the asterisk `*',
			-- but it can be changed with `set_invisible_char'.
		do
			gtk_entry_set_visibility (handle,0)
		ensure not is_visible
		end

	is_visible: BOOLEAN is
			-- is the text currently visible?
		do
			Result:=(gtk_entry_get_visibility(handle)).to_boolean
		end

	set_invisible_char (a_unicode: INTEGER) is
			-- Sets the character to use in place of the actual text when
			-- is_visible is False. i.e. this is the character used in
			-- "password mode" to show the user how many characters have
			-- been typed. The default invisible char is an asterisk
			-- ('*'). If you set the invisible char to 0, then the user
			-- will get no feedback at all; there will be no text on the
			-- screen as they type.
		do
			gtk_entry_set_invisible_char (handle, a_unicode)
		end
feature -- maximum lenght
	max_length: INTEGER is
			-- the maximum allowed length of the text in entry; 0 if
			-- there is no maximum.
		do
			Result := gtk_entry_get_max_length (handle)
		end

	set_max_length (a_maximum_length: INTEGER) is
			-- Sets the maximum allowed length of the contents of the
			-- widget. If the current contents are longer than the given
			-- length, then they will be truncated to fit. The value
			-- passed in will be clamped to the range 0-65536.
		do
			gtk_entry_set_max_length (handle, a_maximum_length)
		end
	
	set_no_maximum_length is
		do
			gtk_entry_set_max_length (handle, 0)
		end
	
	-- TODO: gtk_entry_get_activates_default ()

	-- gboolean    gtk_entry_get_activates_default (GtkEntry *entry);
	
	-- Retrieves the value set by gtk_entry_set_activates_default().
	
	-- entry : 	a GtkEntry
	-- Returns : 	TRUE if the entry will activate the default widget

	has_frame: BOOLEAN is
			-- Has the entry a beveled frame?
		do
			Result := (gtk_entry_get_has_frame(handle)).to_boolean
		end
	
	set_has_frame is
		do
			gtk_entry_set_has_frame (handle,1)
		end

	unset_has_frame is
		do
			gtk_entry_set_has_frame (handle,0)
		end

feature -- 
	width_chars: INTEGER is
			-- number of chars to request space for, or negative if unset
		do
			Result:=gtk_entry_get_width_chars(handle)
		end

	set_width_chars (n_chars: INTEGER) is
			-- Changes the size request of the entry to be about the
			-- right size for `n_chars' characters. Note that it changes
			-- the size request, the size can still be affected by how
			-- you pack the widget into containers. If `n_chars' is -1,
			-- the size reverts to the default entry size.
		do
			gtk_entry_set_width_chars (handle, n_chars)
		end

	set_activates_default is
			-- Makes pressing Enter in the entry will activate the
			-- default widget for the window containing the entry. This
			-- usually means that the dialog box containing the entry
			-- will be closed, since the default widget is usually one of
			-- the dialog buttons. 

			-- (For experts: if setting is TRUE, the entry calls gtk_window_activate_default() on the window containing the entry, in the default handler for the "activate" signal.)

			-- setting : 	TRUE to activate window's default widget on Enter keypress
		do
			gtk_entry_set_activates_default (handle, 1)
		end

	unset_activates_default is
			-- When pressing Enter the default widget is not activated
		do
			gtk_entry_set_activates_default (handle, 0)
		end

	invisible_char: INTEGER is
			-- the (unicode) character displayed in place of the real
			-- characters for entries with visibility set to false. See
			-- `set_invisible_char'. If 0 the entry does not show
			-- invisible text at all.
		do
			Result:= gtk_entry_get_invisible_char (handle)
		end

feature -- Alignment
	set_alignment (an_x_align: REAL) is
			-- Sets the alignment for the contents of the entry. This
			-- controls the horizontal positioning of the contents when
			-- the displayed text is shorter than the width of the
			-- entry. The horizontal alignment ranges from 0 (left) to 1
			-- (right) and it is reversed for RTL layouts.
		do
			gtk_entry_set_alignment (handle,an_x_align)
		end

	alignment: REAL is
		-- the alignment for the contents of the entry. 
		do
			Result := gtk_entry_get_alignment (handle)
		end

	
-- TODO: gtk_entry_get_layout ()

-- PangoLayout* gtk_entry_get_layout           (GtkEntry *entry);

-- Gets the PangoLayout used to display the entry. The layout is useful to e.g. convert text positions to pixel positions, in combination with gtk_entry_get_layout_offsets(). The returned layout is owned by the entry and must not be modified or freed by the caller.

-- Keep in mind that the layout text may contain a preedit string, so gtk_entry_layout_index_to_text_index() and gtk_entry_text_index_to_layout_index() are needed to convert byte indices in the layout to byte indices in the entry contents.

-- entry : 	a GtkEntry
-- Returns : 	the PangoLayout for this entry
-- gtk_entry_get_layout_offsets ()

-- TODO: void        gtk_entry_get_layout_offsets    (GtkEntry *entry,
--                                              gint *x,
--                                              gint *y);

-- Obtains the position of the PangoLayout used to render text in the entry, in widget coordinates. Useful if you want to line up the text in an entry with some other text, e.g. when using the entry to implement editable cells in a sheet widget.

-- Also useful to convert mouse events into coordinates inside the PangoLayout, e.g. to take some action if some part of the entry text is clicked.

-- Note that as the user scrolls around in the entry the offsets will change; you'll need to connect to the "notify::scroll-offset" signal to track this. Remember when using the PangoLayout functions you need to convert to and from pixels using PANGO_PIXELS() or PANGO_SCALE.

-- Keep in mind that the layout text may contain a preedit string, so gtk_entry_layout_index_to_text_index() and gtk_entry_text_index_to_layout_index() are needed to convert byte indices in the layout to byte indices in the entry contents.

-- entry : 	a GtkEntry
-- x : 	location to store X offset of layout, or NULL
-- y : 	location to store Y offset of layout, or NULL
-- gtk_entry_layout_index_to_text_index ()

-- gint        gtk_entry_layout_index_to_text_index
--                                             (GtkEntry *entry,
--                                              gint layout_index);

-- Converts from a position in the entry contents (returned by gtk_entry_get_text()) to a position in the entry's PangoLayout (returned by gtk_entry_get_layout(), with text retrieved via pango_layout_get_text()).

-- entry : 	a GtkEntry
-- layout_index : 	byte index into the entry layout text
-- Returns : 	byte index into the entry contents
-- gtk_entry_text_index_to_layout_index ()

-- gint        gtk_entry_text_index_to_layout_index
--                                             (GtkEntry *entry,
--                                              gint text_index);

-- Converts from a position in the entry's PangoLayout (returned by gtk_entry_get_layout()) to a position in the entry contents (returned by gtk_entry_get_text()).

-- entry : 	a GtkEntry
-- text_index : 	byte index into the entry contents
-- Returns : 	byte index into the entry layout text

	
	set_completion (an_entry_completion: GTK_ENTRY_COMPLETION) is
			-- Sets completion to be the auxiliary completion object to
			-- use with entry. All further configuration of the
			-- completion mechanism is done on completion using the
			-- GTK_ENTRY_COMPLETION.
		do
			gtk_entry_set_completion (handle, an_entry_completion.handle)
		end

	completion: GTK_ENTRY_COMPLETION is
			-- the auxiliary completion object currently in use by entry.
		do
			create Result.from_external_pointer (gtk_entry_get_completion(handle))
		end

	
feature -- Property Details
	-- The "activates-default" property
	
	--   "activates-default"    gboolean              : Read / Write

	-- Whether to activate the default widget (such as the default button in a dialog) when Enter is pressed.

	-- Default value: FALSE
	-- The "cursor-position" property
	
	--   "cursor-position"      gint                  : Read

-- The current position of the insertion cursor in chars.

-- Allowed values: [0,65535]

-- Default value: 0
-- The "editable" property

--   "editable"             gboolean              : Read / Write

-- Whether the entry contents can be edited.

-- Default value: TRUE
-- The "has-frame" property

--   "has-frame"            gboolean              : Read / Write

-- FALSE removes outside bevel from entry.

-- Default value: TRUE
-- The "invisible-char" property

--   "invisible-char"       guint                 : Read / Write

-- The character to use when masking entry contents (in "password mode").

-- Default value: '*'
-- The "max-length" property

--   "max-length"           gint                  : Read / Write

-- Maximum number of characters for this entry. Zero if no maximum.

-- Allowed values: [0,65535]

-- Default value: 0
-- The "scroll-offset" property

--   "scroll-offset"        gint                  : Read

-- Number of pixels of the entry scrolled off the screen to the left.

-- Allowed values: >= 0

-- Default value: 0
-- The "selection-bound" property

--   "selection-bound"      gint                  : Read

-- The position of the opposite end of the selection from the cursor in chars.

-- Allowed values: [0,65535]

-- Default value: 0
-- The "text" property

--   "text"                 gchararray            : Read / Write

-- The contents of the entry.

-- Default value: ""
-- The "visibility" property

--   "visibility"           gboolean              : Read / Write

-- FALSE displays the "invisible char" instead of the actual text (password mode).

-- Default value: TRUE
-- The "width-chars" property

--   "width-chars"          gint                  : Read / Write

-- Number of characters to leave space for in the entry.

-- Allowed values: >= -1

-- Default value: -1
-- The "xalign" property

--   "xalign"               gfloat                : Read / Write

-- The horizontal alignment, from 0 (left) to 1 (right). Reversed for RTL layouts.

-- Allowed values: [0,1]

-- Default value: 0

-- Since 2.4
-- Signal Details
feature -- The "activate" signal
	activate_signal_name: STRING is "activate"

	on_activate is
			-- Built-in activate signal handler; empty by design; redefine it.
		do
		end

	enable_on_activate is
			-- Connects "activate" signal to `on_activate' feature.
		do
			connect (Current, activate_signal_name, $on_activate)
		end

	connect_agent_to_activate_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_ENTRY]]) is
		require
			valid_procedure: a_procedure /= Void
		local
			activate_callback: ACTIVATE_CALLBACK[like Current]
		do
			create activate_callback.make
			activate_callback.connect (Current, a_procedure)
		end

feature -- The "backspace" signal
	backspace_signal_name: STRING is "backspace"

	on_backspace is
			-- Built-in backspace signal handler; empty by design; redefine it.
		local a_foo: INTEGER
		do
			a_foo := 12 -- Dummy instructions
		end

	enable_on_backspace is
			-- Connects "backspace" signal to `on_backspace' feature.
		do
			connect (Current, backspace_signal_name, $on_backspace)
		end

	-- TODO: implement connect_agent_to_backspace_signal (a_procedure:
	-- PROCEDURE [ANY, TUPLE[GTK_ENTRY]]). See GTK_BUTTON's clicked for
	-- inspiration.
	
feature -- The "copy-clipboard" signal
	copy_clipboard_signal_name: STRING is "copy-clipboard"

	on_copy_clipboard is
			-- Built-in copy-clipboard signal handler; empty by design; redefine it.
		do
		end

	enable_on_copy_clipboard is
			-- Connects "copy_clipboard" signal to `on_copy_clipboard' feature.
		do
			connect (Current, copy_clipboard_signal_name, $on_copy_clipboard)
		end

	-- TODO: implement connect_agent_to_backspace_signal (a_procedure:
	-- PROCEDURE [ANY, TUPLE[GTK_ENTRY]]). See GTK_BUTTON's clicked for
	-- inspiration.

feature -- The "cut-clipboard" signal
	cut_clipboard_signal_name: STRING is "cut-clipboard"

	on_cut_clipboard is
			-- Built-in cut_clipboard signal handler; empty by design; redefine it.
		do
		end

	enable_on_cut_clipboard is
			-- Connects "cut_clipboard" signal to `on_cut_clipboard' feature.
		do
			connect (Current, cut_clipboard_signal_name, $on_cut_clipboard)
		end

	-- TODO: implement connect_agent_to_cut_clipboard_signal (a_procedure:
	-- PROCEDURE [ANY, TUPLE[GTK_ENTRY]]). See GTK_BUTTON's clicked for
	-- inspiration.

feature -- The "delete-from-cursor" signal

-- void        user_function                  (GtkEntry     *entry,
--                                             GtkDeleteType arg1,
--                                             gint          arg2,
--                                             gpointer      user_data)      : Run last / Action

-- entry : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- user_data : 	user data set when the signal handler was connected.
feature -- The "insert-at-cursor" signal

-- void        user_function                  (GtkEntry *entry,
--                                             gchar    *arg1,
--                                             gpointer  user_data)      : Run last / Action

-- entry : 	the object which received the signal.
-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	
feature -- The "move-cursor" signal

-- void        user_function                  (GtkEntry       *entry,
--                                             GtkMovementStep arg1,
--                                             gint            arg2,
--                                             gboolean        arg3,
--                                             gpointer        user_data)      : Run last / Action

-- entry : 	the object which received the signal.
-- arg1 : 	
-- arg2 : 	
-- arg3 : 	
-- user_data : 	user data set when the signal handler was connected.

feature -- The "paste-clipboard" signal
	paste_clipboard_signal_name: STRING is "paste-clipboard"

	on_paste_clipboard is
			-- Built-in paste-clipboard signal handler; empty by design; redefine it.
		do
		end

	enable_on_paste_clipboard is
			-- Connects "paste-clipboard" signal to `on_paste_clipboard' feature.
		do
			connect (Current, paste_clipboard_signal_name, $on_paste_clipboard)
		end

	-- TODO: implement connect_agent_to_paste_clipboard_signal (a_procedure:
	-- PROCEDURE [ANY, TUPLE[GTK_ENTRY]]). See GTK_BUTTON's clicked for
	-- inspiration.

feature -- The "populate-popup" signal
	populate_popup_signal_name: STRING is "populate-popup"

	on_populate_popup (a_menu: GTK_MENU) is
			-- Built-in paste-clipboard signal handler; empty by design; redefine it.
		require menu_not_void: a_menu/=Void 
		do
		end

	enable_on_populate_popup is
			-- Connects "paste-clipboard" signal to `on_populate_popup' feature.
		do
			connect (Current, populate_popup_signal_name, $hidden_on_populate_popup)
		end

	-- TODO: implement connect_agent_to_populate_popup_signal (a_procedure:
	-- PROCEDURE [ANY, TUPLE[GTK_ENTRY]]). See GTK_BUTTON's clicked for
	-- inspiration.

feature {} -- populate-popup signal implementation
	hidden_on_populate_popup (a_gtk_menu, a_gtk_entry: POINTER) is
		require 
			menu_not_null: a_gtk_menu.is_not_null
			entry_not_null: a_gtk_entry.is_not_null -- Otherwise very bad things are happening.
		local a_menu: GTK_MENU
		do
			a_menu := retrieve_eiffel_wrapper_from_gobject_pointer(a_gtk_menu)
			check a_menu_not_void: a_menu /= Void end
			on_populate_popup (a_menu)
		end
	-- void user_function (GtkEntry *entry, GtkMenu *arg1, gpointer
	--                                             user_data) : Run
	--                                             last
	
	-- entry : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was 
	-- connected.

feature -- The "toggle-overwrite" signal

-- void        user_function                  (GtkEntry *entry,
--                                             gpointer  user_data)      : Run last / Action

-- entry : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
end
