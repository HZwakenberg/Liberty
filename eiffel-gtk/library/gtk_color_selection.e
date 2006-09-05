indexing
	description: "GtkColorSelection — A widget used to select a color."
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

class GTK_COLOR_SELECTION

inherit GTK_VBOX
	redefine struct_size end

insert
	GTK_COLOR_SELECTION_EXTERNALS

creation from_external_pointer

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkColorSelection)"
		end

feature

	current_color: GDK_COLOR is
			-- Returns the current color in the GTK_COLOR_SELECTION widget
		do
			create Result.make
			gtk_color_selection_get_current_color (handle, Result.handle)
		end

	set_current_color (a_color: GDK_COLOR) is
			-- Sets the current color to be a_color. The first time this is
			-- called, it will also set the original color to be a_color too.
		do
			gtk_color_selection_set_current_color (handle, a_color.handle)
		end

--	new:

-- Synopsis
-- 
-- #include <gtk/gtk.h>
-- 
-- 
--             GtkColorSelection;
-- GtkWidget*  gtk_color_selection_new         (void);
-- void        gtk_color_selection_set_update_policy
--                                             (GtkColorSelection *colorsel,
--                                              GtkUpdateType policy);
-- void        gtk_color_selection_set_has_opacity_control
--                                             (GtkColorSelection *colorsel,
--                                              gboolean has_opacity);
-- gboolean    gtk_color_selection_get_has_opacity_control
--                                             (GtkColorSelection *colorsel);
-- void        gtk_color_selection_set_has_palette
--                                             (GtkColorSelection *colorsel,
--                                              gboolean has_palette);
-- gboolean    gtk_color_selection_get_has_palette
--                                             (GtkColorSelection *colorsel);
-- guint16     gtk_color_selection_get_current_alpha
--                                             (GtkColorSelection *colorsel);
-- void        gtk_color_selection_set_current_alpha
--                                             (GtkColorSelection *colorsel,
--                                              guint16 alpha);
-- guint16     gtk_color_selection_get_previous_alpha
--                                             (GtkColorSelection *colorsel);
-- void        gtk_color_selection_set_previous_alpha
--                                             (GtkColorSelection *colorsel,
--                                              guint16 alpha);
-- void        gtk_color_selection_get_previous_color
--                                             (GtkColorSelection *colorsel,
--                                              GdkColor *color);
-- void        gtk_color_selection_set_previous_color
--                                             (GtkColorSelection *colorsel,
--                                              const GdkColor *color);
-- gboolean    gtk_color_selection_is_adjusting
--                                             (GtkColorSelection *colorsel);
-- gboolean    gtk_color_selection_palette_from_string
--                                             (const gchar *str,
--                                              GdkColor **colors,
--                                              gint *n_colors);
-- gchar*      gtk_color_selection_palette_to_string
--                                             (const GdkColor *colors,
--                                              gint n_colors);
-- GtkColorSelectionChangePaletteFunc gtk_color_selection_set_change_palette_hook
--                                             (GtkColorSelectionChangePaletteFunc func);
-- void        (*GtkColorSelectionChangePaletteFunc)
--                                             (const GdkColor *colors,
--                                              gint n_colors);
-- GtkColorSelectionChangePaletteWithScreenFunc gtk_color_selection_set_change_palette_with_screen_hook
--                                             (GtkColorSelectionChangePaletteWithScreenFunc func);
-- void        (*GtkColorSelectionChangePaletteWithScreenFunc)
--                                             (GdkScreen *screen,
--                                              const GdkColor *colors,
--                                              gint n_colors);
-- void        gtk_color_selection_set_color   (GtkColorSelection *colorsel,
--                                              gdouble *color);
-- void        gtk_color_selection_get_color   (GtkColorSelection *colorsel,
--                                              gdouble *color);
-- 
-- 
-- 
-- Object Hierarchy
-- 
--   GObject
--    +----GInitiallyUnowned
--          +----GtkObject
--                +----GtkWidget
--                      +----GtkContainer
--                            +----GtkBox
--                                  +----GtkVBox
--                                        +----GtkColorSelection
-- 
-- Implemented Interfaces
-- 
-- GtkColorSelection implements AtkImplementorIface.
-- Properties
-- 
--   "current-alpha"        guint                 : Read / Write
--   "current-color"        GdkColor              : Read / Write
--   "has-opacity-control"  gboolean              : Read / Write
--   "has-palette"          gboolean              : Read / Write
-- 
-- Signals
-- 
-- "color-changed"
--             void        user_function      (GtkColorSelection *colorselection,
--                                             gpointer           user_data)           : Run first
-- 
-- Description
-- 
-- The GtkColorSelection is a widget that is used to select a color. It consists of a color wheel and number of sliders and entry boxes for color parameters such as hue, saturation, value, red, green, blue, and opacity. It is found on the standard color selection dialog box GtkColorSelectionDialog.
-- Details
-- GtkColorSelection
-- 
-- typedef struct _GtkColorSelection GtkColorSelection;
-- 
-- The GtkColorSelection struct contains private data only, and should be accessed using the functions below.
-- gtk_color_selection_new ()
-- 
-- GtkWidget*  gtk_color_selection_new         (void);
-- 
-- Creates a new GtkColorSelection.
-- 
-- Returns : 	a new GtkColorSelection
-- gtk_color_selection_set_update_policy ()
-- 
-- void        gtk_color_selection_set_update_policy
--                                             (GtkColorSelection *colorsel,
--                                              GtkUpdateType policy);
-- 
-- Warning
-- 
-- gtk_color_selection_set_update_policy is deprecated and should not be used in newly-written code.
-- 
-- Sets the policy controlling when the color_changed signals are emitted. The available policies are:
-- 
--     *
-- 
--       GTK_UPDATE_CONTINUOUS - signals are sent continuously as the color selection changes.
--     *
-- 
--       GTK_UPDATE_DISCONTINUOUS - signals are sent only when the mouse button is released.
--     *
-- 
--       GTK_UPDATE_DELAYED - signals are sent when the mouse button is released or when the mouse has been motionless for a period of time.
-- 
-- colorsel : 	a GtkColorSelection.
-- policy : 	a GtkUpdateType value indicating the desired policy.
-- gtk_color_selection_set_has_opacity_control ()
-- 
-- void        gtk_color_selection_set_has_opacity_control
--                                             (GtkColorSelection *colorsel,
--                                              gboolean has_opacity);
-- 
-- Sets the colorsel to use or not use opacity.
-- 
-- colorsel : 	a GtkColorSelection.
-- has_opacity : 	TRUE if colorsel can set the opacity, FALSE otherwise.
-- gtk_color_selection_get_has_opacity_control ()
-- 
-- gboolean    gtk_color_selection_get_has_opacity_control
--                                             (GtkColorSelection *colorsel);
-- 
-- Determines whether the colorsel has an opacity control.
-- 
-- colorsel : 	a GtkColorSelection.
-- Returns : 	TRUE if the colorsel has an opacity control. FALSE if it does't.
-- gtk_color_selection_set_has_palette ()
-- 
-- void        gtk_color_selection_set_has_palette
--                                             (GtkColorSelection *colorsel,
--                                              gboolean has_palette);
-- 
-- Shows and hides the palette based upon the value of has_palette.
-- 
-- colorsel : 	a GtkColorSelection.
-- has_palette : 	TRUE if palette is to be visible, FALSE otherwise.
-- gtk_color_selection_get_has_palette ()
-- 
-- gboolean    gtk_color_selection_get_has_palette
--                                             (GtkColorSelection *colorsel);
-- 
-- Determines whether the color selector has a color palette.
-- 
-- colorsel : 	a GtkColorSelection.
-- Returns : 	TRUE if the selector has a palette. FALSE if it hasn't.
-- gtk_color_selection_get_current_alpha ()
-- 
-- guint16     gtk_color_selection_get_current_alpha
--                                             (GtkColorSelection *colorsel);
-- 
-- Returns the current alpha value.
-- 
-- colorsel : 	a GtkColorSelection.
-- Returns : 	an integer between 0 and 65535.
-- gtk_color_selection_set_current_alpha ()
-- 
-- void        gtk_color_selection_set_current_alpha
--                                             (GtkColorSelection *colorsel,
--                                              guint16 alpha);
-- 
-- Sets the current opacity to be alpha. The first time this is called, it will also set the original opacity to be alpha too.
-- 
-- colorsel : 	a GtkColorSelection.
-- alpha : 	an integer between 0 and 65535.

-- gtk_color_selection_get_previous_alpha ()
-- 
-- guint16     gtk_color_selection_get_previous_alpha
--                                             (GtkColorSelection *colorsel);
-- 
-- Returns the previous alpha value.
-- 
-- colorsel : 	a GtkColorSelection.
-- Returns : 	an integer between 0 and 65535.
-- gtk_color_selection_set_previous_alpha ()
-- 
-- void        gtk_color_selection_set_previous_alpha
--                                             (GtkColorSelection *colorsel,
--                                              guint16 alpha);
-- 
-- Sets the 'previous' alpha to be alpha. This function should be called with some hesitations, as it might seem confusing to have that alpha change.
-- 
-- colorsel : 	a GtkColorSelection.
-- alpha : 	an integer between 0 and 65535.
-- gtk_color_selection_get_previous_color ()
-- 
-- void        gtk_color_selection_get_previous_color
--                                             (GtkColorSelection *colorsel,
--                                              GdkColor *color);
-- 
-- Fills color in with the original color value.
-- 
-- colorsel : 	a GtkColorSelection.
-- color : 	a GdkColor to fill in with the original color value.
-- gtk_color_selection_set_previous_color ()
-- 
-- void        gtk_color_selection_set_previous_color
--                                             (GtkColorSelection *colorsel,
--                                              const GdkColor *color);
-- 
-- Sets the 'previous' color to be color. This function should be called with some hesitations, as it might seem confusing to have that color change. Calling gtk_color_selection_set_current_color() will also set this color the first time it is called.
-- 
-- colorsel : 	a GtkColorSelection.
-- color : 	a GdkColor to set the previous color with.
-- gtk_color_selection_is_adjusting ()
-- 
-- gboolean    gtk_color_selection_is_adjusting
--                                             (GtkColorSelection *colorsel);
-- 
-- Gets the current state of the colorsel.
-- 
-- colorsel : 	a GtkColorSelection.
-- Returns : 	TRUE if the user is currently dragging a color around, and FALSE if the selection has stopped.
-- gtk_color_selection_palette_from_string ()
-- 
-- gboolean    gtk_color_selection_palette_from_string
--                                             (const gchar *str,
--                                              GdkColor **colors,
--                                              gint *n_colors);
-- 
-- Parses a color palette string; the string is a colon-separated list of color names readable by gdk_color_parse().
-- 
-- str : 	a string encoding a color palette.
-- colors : 	return location for allocated array of GdkColor.
-- n_colors : 	return location for length of array.
-- Returns : 	TRUE if a palette was successfully parsed.
-- gtk_color_selection_palette_to_string ()
-- 
-- gchar*      gtk_color_selection_palette_to_string
--                                             (const GdkColor *colors,
--                                              gint n_colors);
-- 
-- Encodes a palette as a string, useful for persistent storage.
-- 
-- colors : 	an array of colors.
-- n_colors : 	length of the array.
-- Returns : 	allocated string encoding the palette.
-- gtk_color_selection_set_change_palette_hook ()
-- 
-- GtkColorSelectionChangePaletteFunc gtk_color_selection_set_change_palette_hook
--                                             (GtkColorSelectionChangePaletteFunc func);
-- 
-- Warning
-- 
-- gtk_color_selection_set_change_palette_hook is deprecated and should not be used in newly-written code. This function is deprecated in favor of gtk_color_selection_set_change_palette_with_screen_hook(), and does not work in multihead environments.
-- 
-- Installs a global function to be called whenever the user tries to modify the palette in a color selection. This function should save the new palette contents, and update the GtkSettings property "gtk-color-palette" so all GtkColorSelection widgets will be modified.
-- 
-- func : 	a function to call when the custom palette needs saving.
-- Returns : 	the previous change palette hook (that was replaced).
-- GtkColorSelectionChangePaletteFunc ()
-- 
-- void        (*GtkColorSelectionChangePaletteFunc)
--                                             (const GdkColor *colors,
--                                              gint n_colors);
-- 
-- colors : 	
-- n_colors : 	
-- gtk_color_selection_set_change_palette_with_screen_hook ()
-- 
-- GtkColorSelectionChangePaletteWithScreenFunc gtk_color_selection_set_change_palette_with_screen_hook
--                                             (GtkColorSelectionChangePaletteWithScreenFunc func);
-- 
-- Installs a global function to be called whenever the user tries to modify the palette in a color selection. This function should save the new palette contents, and update the GtkSettings property "gtk-color-palette" so all GtkColorSelection widgets will be modified.
-- 
-- func : 	a function to call when the custom palette needs saving.
-- Returns : 	the previous change palette hook (that was replaced).
-- 
-- Since 2.2
-- GtkColorSelectionChangePaletteWithScreenFunc ()
-- 
-- void        (*GtkColorSelectionChangePaletteWithScreenFunc)
--                                             (GdkScreen *screen,
--                                              const GdkColor *colors,
--                                              gint n_colors);
-- 
-- screen : 	
-- colors : 	
-- n_colors : 	
-- 
-- Since 2.2
-- gtk_color_selection_set_color ()
-- 
-- void        gtk_color_selection_set_color   (GtkColorSelection *colorsel,
--                                              gdouble *color);
-- 
-- Warning
-- 
-- gtk_color_selection_set_color is deprecated and should not be used in newly-written code. Use gtk_color_selection_set_current_color() instead.
-- 
-- Sets the current color to be color. The first time this is called, it will also set the original color to be color too.
-- 
-- colorsel : 	a GtkColorSelection.
-- color : 	an array of 4 doubles specifying the red, green, blue and opacity to set the current color to.
-- gtk_color_selection_get_color ()
-- 
-- void        gtk_color_selection_get_color   (GtkColorSelection *colorsel,
--                                              gdouble *color);
-- 
-- Warning
-- 
-- gtk_color_selection_get_color is deprecated and should not be used in newly-written code.
-- 
-- Sets color to be the current color in the GtkColorSelection widget.
-- 
-- This function is deprecated, use gtk_color_selection_get_current_color() instead.
-- 
-- colorsel : 	a GtkColorSelection.
-- color : 	an array of 4 gdouble to fill in with the current color.
-- Property Details
-- The "current-alpha" property
-- 
--   "current-alpha"        guint                 : Read / Write
-- 
-- The current opacity value (0 fully transparent, 65535 fully opaque).
-- 
-- Allowed values: <= 65535
-- 
-- Default value: 65535
-- The "current-color" property
-- 
--   "current-color"        GdkColor              : Read / Write
-- 
-- The current color.
-- The "has-opacity-control" property
-- 
--   "has-opacity-control"  gboolean              : Read / Write
-- 
-- Whether the color selector should allow setting opacity.
-- 
-- Default value: FALSE
-- The "has-palette" property
-- 
--   "has-palette"          gboolean              : Read / Write
-- 
-- Whether a palette should be used.
-- 
-- Default value: FALSE
-- Signal Details
-- The "color-changed" signal
-- 
-- void        user_function                  (GtkColorSelection *colorselection,
--                                             gpointer           user_data)           : Run first
-- 
-- This signal is emitted when the color changes in the GtkColorSelection according to its update policy.
-- colorselection : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.

end -- class GTK_COLOR_SELECTION