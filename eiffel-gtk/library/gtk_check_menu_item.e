indexing
	description: "GtkCheckMenuItem -- A menu item with a check box."
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

class GTK_CHECK_MENU_ITEM
inherit GTK_MENU_ITEM
	
creation make

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCheckMenuItem)"
		end

feature {} -- Creation
	--   

	--    

	-- Synopsis


	--  #include <gtk/gtk.h>


	--              GtkCheckMenuItem;
	--  GtkWidget*  gtk_check_menu_item_new         (void);
	--  GtkWidget*  gtk_check_menu_item_new_with_label
	--                                              (const gchar *label);
	--  GtkWidget*  gtk_check_menu_item_new_with_mnemonic
	--                                              (const gchar *label);
	--  #define     gtk_check_menu_item_set_state
	--  gboolean    gtk_check_menu_item_get_active  (GtkCheckMenuItem *check_menu_item);
	--  void        gtk_check_menu_item_set_active  (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean is_active);
	--  void        gtk_check_menu_item_set_show_toggle
	--                                              (GtkCheckMenuItem *menu_item,
	--                                               gboolean always);
	--  void        gtk_check_menu_item_toggled     (GtkCheckMenuItem *check_menu_item);
	--  gboolean    gtk_check_menu_item_get_inconsistent
	--                                              (GtkCheckMenuItem *check_menu_item);
	--  void        gtk_check_menu_item_set_inconsistent
	--                                              (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean setting);
	--  void        gtk_check_menu_item_set_draw_as_radio
	--                                              (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean draw_as_radio);
	--  gboolean    gtk_check_menu_item_get_draw_as_radio
	--                                              (GtkCheckMenuItem *check_menu_item);



	-- Object Hierarchy


	--    GObject
	--     +----GInitiallyUnowned
	--           +----GtkObject
	--                 +----GtkWidget
	--                       +----GtkContainer
	--                             +----GtkBin
	--                                   +----GtkItem
	--                                         +----GtkMenuItem
	--                                               +----GtkCheckMenuItem
	--                                                     +----GtkRadioMenuItem

	-- Implemented Interfaces

	--    GtkCheckMenuItem implements AtkImplementorIface.

	-- Properties


	--    "active"               gboolean              : Read / Write
	--    "draw-as-radio"        gboolean              : Read / Write
	--    "inconsistent"         gboolean              : Read / Write

	-- Style Properties


	--    "indicator-size"       gint                  : Read

	-- Signals


	--  "toggled"   void        user_function      (GtkCheckMenuItem *checkmenuitem,
	--                                              gpointer          user_data)          : Run first

	-- Description

	--    A GtkCheckMenuItem is a menu item that maintains the state of a boolean value in addition to a GtkMenuItem's
	--    usual role in activating application code.

	--    A check box indicating the state of the boolean value is displayed at the left side of the GtkMenuItem.
	--    Activating the GtkMenuItem toggles the value.

	-- Details

	--   GtkCheckMenuItem

	--  typedef struct _GtkCheckMenuItem GtkCheckMenuItem;

	--    The GtkCheckMenuItem-struct struct contains the following fields. (These fields should be considered
	--    read-only. They should never be set by an application.)

	--    guint active;                                TRUE if the check box is active.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_new ()

	--  GtkWidget*  gtk_check_menu_item_new         (void);

	--    Creates a new GtkCheckMenuItem.

	--    Returns : a new GtkCheckMenuItem.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_new_with_label ()

	--  GtkWidget*  gtk_check_menu_item_new_with_label
	--                                              (const gchar *label);

	--    Creates a new GtkCheckMenuItem with a label.

	--    label :   the string to use for the label.
	--    Returns : a new GtkCheckMenuItem.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_new_with_mnemonic ()

	--  GtkWidget*  gtk_check_menu_item_new_with_mnemonic
	--                                              (const gchar *label);

	--    Creates a new GtkCheckMenuItem containing a label. The label will be created using
	--    gtk_label_new_with_mnemonic(), so underscores in label indicate the mnemonic for the menu item.

	--    label :   The text of the button, with an underscore in front of the mnemonic character
	--    Returns : a new GtkCheckMenuItem

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_set_state

	--  #define gtk_check_menu_item_set_state           gtk_check_menu_item_set_active

	--   Warning

	--    gtk_check_menu_item_set_state is deprecated and should not be used in newly-written code.

	--    This macro is provided to preserve compatibility with older code. New code should use
	--    gtk_check_menu_item_set_active() function instead.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_get_active ()

	--  gboolean    gtk_check_menu_item_get_active  (GtkCheckMenuItem *check_menu_item);

	--    Returns whether the check menu item is active. See gtk_check_menu_item_set_active().

	--    check_menu_item : a GtkCheckMenuItem
	--    Returns :         TRUE if the menu item is checked.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_set_active ()

	--  void        gtk_check_menu_item_set_active  (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean is_active);

	--    Sets the active state of the menu item's check box.

	--    check_menu_item : a GtkCheckMenuItem.
	--    is_active :       boolean value indicating whether the check box is active.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_set_show_toggle ()

	--  void        gtk_check_menu_item_set_show_toggle
	--                                              (GtkCheckMenuItem *menu_item,
	--                                               gboolean always);

	--   Warning

	--    gtk_check_menu_item_set_show_toggle is deprecated and should not be used in newly-written code.

	--    Controls whether the check box is shown at all times. Normally the check box is shown only when it is active
	--    or while the menu item is selected.

	--    menu_item : a GtkCheckMenuItem.
	--    always :    boolean value indicating whether to always show the check box.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_toggled ()

	--  void        gtk_check_menu_item_toggled     (GtkCheckMenuItem *check_menu_item);

	--    Emits the GtkCheckMenuItem::toggled signal.

	--    check_menu_item : a GtkCheckMenuItem.

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_get_inconsistent ()

	--  gboolean    gtk_check_menu_item_get_inconsistent
	--                                              (GtkCheckMenuItem *check_menu_item);

	--    Retrieves the value set by gtk_check_menu_item_set_inconsistent().

	--    check_menu_item : a GtkCheckMenuItem
	--    Returns :         TRUE if inconsistent

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_set_inconsistent ()

	--  void        gtk_check_menu_item_set_inconsistent
	--                                              (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean setting);

	--    If the user has selected a range of elements (such as some text or spreadsheet cells) that are affected by a
	--    boolean setting, and the current values in that range are inconsistent, you may want to display the check in
	--    an "in between" state. This function turns on "in between" display. Normally you would turn off the
	--    inconsistent state again if the user explicitly selects a setting. This has to be done manually,
	--    gtk_check_menu_item_set_inconsistent() only affects visual appearance, it doesn't affect the semantics of
	--    the widget.

	--    check_menu_item : a GtkCheckMenuItem
	--    setting :         TRUE to display an "inconsistent" third state check

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_set_draw_as_radio ()

	--  void        gtk_check_menu_item_set_draw_as_radio
	--                                              (GtkCheckMenuItem *check_menu_item,
	--                                               gboolean draw_as_radio);

	--    Sets whether check_menu_item is drawn like a GtkRadioMenuItem

	--    check_menu_item : a GtkCheckMenuItem
	--    draw_as_radio :   whether check_menu_item is drawn like a GtkRadioMenuItem

	--    Since 2.4

	--    ------------------------------------------------------------------------------------------------------------

	--   gtk_check_menu_item_get_draw_as_radio ()

	--  gboolean    gtk_check_menu_item_get_draw_as_radio
	--                                              (GtkCheckMenuItem *check_menu_item);

	--    Returns whether check_menu_item looks like a GtkRadioMenuItem

	--    check_menu_item : a GtkCheckMenuItem
	--    Returns :         Whether check_menu_item looks like a GtkRadioMenuItem

	--    Since 2.4

	-- Property Details

	--   The "active" property

	--    "active"               gboolean              : Read / Write

	--    Whether the menu item is checked.

	--    Default value: FALSE

	--    ------------------------------------------------------------------------------------------------------------

	--   The "draw-as-radio" property

	--    "draw-as-radio"        gboolean              : Read / Write

	--    Whether the menu item looks like a radio menu item.

	--    Default value: FALSE

	--    ------------------------------------------------------------------------------------------------------------

	--   The "inconsistent" property

	--    "inconsistent"         gboolean              : Read / Write

	--    Whether to display an "inconsistent" state.

	--    Default value: FALSE

	-- Style Property Details

	--   The "indicator-size" style property

	--    "indicator-size"       gint                  : Read

	--    Size of check or radio indicator.

	--    Allowed values: >= 0

	--    Default value: 12

	-- Signal Details

	--   The "toggled" signal

	--  void        user_function                  (GtkCheckMenuItem *checkmenuitem,
	--                                              gpointer          user_data)          : Run first

	--    This signal is emitted when the state of the check box is changed.

	--    A signal handler can examine the active field of the GtkCheckMenuItem-struct struct to discover the new
	--    state.

	--    checkmenuitem : the object which received the signal.
	--    user_data :     user data set when the signal handler was connected.

end
