#!/usr/bin/env ruby
=begin
  linkbutton.rb - Gtk::LinkButton sample.

  Copyright (c) 2006-2015 Ruby-GNOME2 Project Team
  This program is licenced under the same licence as Ruby-GNOME2.
=end

require "gtk3"

window = Gtk::Window.new("Gtk::LinkButton sample")
window.signal_connect("destroy"){Gtk.main_quit}

vbox = Gtk::Box.new(:vertical)

# URI only
button1 = Gtk::LinkButton.new("http://ruby-gnome2.sourceforge.jp/")
button1.signal_connect("clicked") do
  puts button1.uri
end
vbox.pack_start(button1)

# URI with a label
button2 = Gtk::LinkButton.new("http://ruby-gnome2.sourceforge.jp/",
			      "Ruby-GNOME2 Website")
button2.signal_connect("clicked") do
  puts button2.uri
end

vbox.pack_start(button2)

window.add(vbox)
window.show_all

Gtk.main
