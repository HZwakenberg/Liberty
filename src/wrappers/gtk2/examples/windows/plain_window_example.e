indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class PLAIN_WINDOW_EXAMPLE

inherit
	GTK_MAIN
	
creation
	make
	
feature {} -- creation
	make is
		do
			initialize_gtk
			create window.make
			window.set_title ("Wow my first Eiffel window!")
			window.show
			run_gtk_main_loop
		end
feature -- foo
	window: GTK_WINDOW
			-- the window
	

end
	
	
	