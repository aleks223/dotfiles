# Author::  s__C
# Version:: 11.1.2011
# License:: GNU GPL

# == Options
#
# Following options change behaviour and sizes of the window manager:
#
# Border size in pixel of the windows
set :border, 3

# Window move/resize steps in pixel per keypress
set :step, 2

# Window screen border snapping
set :snap, 4

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, true

# Enable respecting of size hints globally
set :resize, false

# Screen size padding (left, right, top, bottom)
set :padding,    [3, 3, 2, 2]

# Font string either take from e.g. xfontsel or use xft
set :font, "xft:Pragmata-9"
#set :font, "xft:terminus-10"

# Space around windows
set :gap, 4

# Separator between sublets
set :separator, "·"

# Outline border size in pixel of panel items
set :outline, 0

#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and sublets
# screen wise. Per default only the top panel on the first screen is used, it's
# up to the user to enable the bottom panel or disable either one or both.
#
# Empty panels are hidden.
#
# Following items are available:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# === Link
#
# http://subforge.org/wiki/subtle/Panel
#

screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the top panel
  top     [ :views, :spacer, :clock, :spacer, :battery, :separator, :volume, :separator, :wifi]

  # Content of the bottom panel
  bottom  [ :mpd, :spacer, :tray ]
end

#
# == Colors
#
# Colors directly define the look of subtle, valid values are:
#
# [*hexadecimal*] #0000ff
# [*decimal*]     (0, 0, 255)
# [*names*]       blue
#
# Whenever there is no valid value for a color set - subtle will use a default
# one. There is only one exception to this: If no background color is given no
# color will be set. This will ensure a custom background pixmap won't be
# overwritten.
#
# === Link
#
# http://subforge.org/wiki/subtle/Themes
#

# panel and separator
color :stipple,      "#353535"
color :panel,        "#151515"
color :separator,    "#850000"

# title
color :title_fg,        "#888888"
color :title_bg,        "#151515"
color :title_border,    "#151515"

# view button
color :views_fg,      "#353535"
color :views_bg,      "#151515" 
color :views_border,  "#151515"

# sublets
color :fg_sublets,    "#565f6f"
color :sublets_bg,    "#151515" 
color :sublets_border,"#151515"
 
# focus window titles and active views
color :focus_fg,         "#5d6aa6" 
color :focus_bg,         "#151515" 
color :focus_border,     "#ffffff"
 
# occupied
color :occupied_fg,      "#888888" 
color :occupied_bg,      "#151515" 
color :occupied_border,  "#151515" 

# urgent window titles and views
color :urgent_fg,        "#FFC400" 
color :urgent_bg,        "#151515" 
color :urgent_border,    "#151515" 
 
# client
color :client_active,   "#5d6aa6" 
color :client_inactive, "#888888"

# Background color of root background
#color :background,    "#3d3d3d"

#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/wiki/subtle/Gravity
#

  # Gravities
thirtythree = 1.0/3*100
gravity :top_left,      [0, 0, 50, 50]
gravity :top_left33,    [0, 0, thirtythree, thirtythree]
gravity :top_left50,    [0, 0, thirtythree, 50]
gravity :top,           [50, 0, 100, 50]
gravity :top33,         [50, 0, thirtythree, thirtythree]
gravity :top50,         [50, 0, thirtythree, 50]
gravity :top_right,     [100, 0, 50, 50]
gravity :top_right33,   [100, 0, thirtythree, thirtythree]
gravity :top_right50,   [100, 0, thirtythree, 50]
gravity :left,          [0, 0, 50, 100]
gravity :left66,        [0, 50, 25, 100]
gravity :left50,        [0, 50, 50, thirtythree]
gravity :left33,        [0, 50, thirtythree, thirtythree]
gravity :leftw,         [0, 50, 2*thirtythree, 100]
gravity :lefth,         [0, 50, 75, 100]
gravity :center,        [0, 0, 100, 100]
gravity :center66,      [0, 50, 100, thirtythree]
gravity :center33,      [50, 50, 50, thirtythree]
gravity :center75,      [50, 50, 50, 100]
gravity :right,         [100, 0, 50, 100]
gravity :right66,       [100, 50, 25, 100]
gravity :right50,       [100, 50, 50, thirtythree]
gravity :right33,       [100, 50, thirtythree, thirtythree]
gravity :rightw,        [100, 0, 60, 100]
gravity :righth,        [100, 50, 2*thirtythree, 100]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left50, [0, 100, thirtythree, 50]
gravity :bottom_left33, [0, 100, thirtythree, thirtythree]
gravity :bottom,        [0, 100, 100, 50]
gravity :bottom66,      [50, 100, thirtythree, 50]
gravity :bottom33,      [50, 100, thirtythree, thirtythree]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right50, [100, 100, thirtythree, 50]
gravity :bottom_right33, [100, 100, thirtythree, thirtythree]
  # Gimp
gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]
  # Scratchpad
gravity :scratch, [ 46, 85, 46, 20 ]
#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one key and can be used in
# various ways to trigger an action. In subtle there are two ways to define
# chains for grabs:
#
#   1. Default way*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Escape way*: Define an escape grab that needs to be pressed before
#      *any* other grab can be used like in screen/tmux.
#
#      *Example*: grab "C-y", :SubtleEscape
#                 grab "Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#
# === Link
#
# http://subforge.org/wiki/subtle/Grabs
#

# Escape grab
#  grab "C-y", :SubtleEscape

# Launcher
begin
   require "#{ENV["HOME"]}/subtle-contrib/ruby/launcher.rb" 
 
   # Set fonts
   Subtle::Contrib::Launcher.fonts = [
     "xft:Pragmata:pixelsize=50:antialias=true",
     "xft:Pragmata:pixelsize=25:antialias=true" 
   ]
 rescue LoadError => error
   puts error
end

grab "W-x" do
   Subtle::Contrib::Launcher.run
end

# Selector
begin
   require "#{ENV["HOME"]}/subtle-contrib/ruby/selector.rb"
   Subtle::Contrib::Selector.font = "xft:Pragmata:pixelsize=50:antialias=true"
 rescue LoadError => error
  puts error
end
 
grab "W-y" do
  Subtle::Contrib::Selector.run
end

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-S-5", :ViewJump5
grab "W-S-6", :ViewJump6
grab "W-S-7", :ViewJump7

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6
grab "W-7", :ViewSwitch7

# Select next and prev view */
grab "W-Right",  :ViewNext
grab "W-Left",   :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "A-f", :WindowFloat

# Toggle fullscreen mode of window
grab "A-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "A-s", :WindowStick

# Raise window
grab "A-r", :WindowRaise

# Lower window
grab "A-l", :WindowLower

# Select next windows
grab "C-Left",  :WindowLeft
grab "C-Down",  :WindowDown
grab "C-Up",    :WindowUp
grab "C-Right", :WindowRight

# Kill current window
grab "A-q", :WindowKill

# Cycle between given gravities
grab "W-KP_7", [ :top_left,     :top_left50,     :top_left33     ]
grab "W-KP_8", [ :top,          :top50,          :top33          ]
grab "W-KP_9", [ :top_right,    :top_right50,    :top_right33    ]
grab "W-KP_4", [ :left,         :left33,         :left50,      :lefth,      :leftw        ]
grab "W-KP_5", [ :center,       :center33,       :center66,       :center75 ]
grab "W-KP_6", [ :right,        :right33,        :right50,      :righth,    :rightw       ]
grab "W-KP_1", [ :bottom_left,  :bottom_left50,  :bottom_left33  ]
grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-KP_3", [ :bottom_right, :bottom_right50, :bottom_right33 ]

# Exec programs
grab "W-Return", "urxvtc"
grab "W-e", "gedit"
grab "W-c", "iron"
grab "W-h", "hotot"
grab "W-m", "mpd"
grab "W-n", "urxvtc -name ncmpcpp -e ncmpcpp"
grab "W-t", "urxvtc -name tmux -e tmux"
grab "W-a", "urxvtc -name tmux -e tmux a || tmux"
grab "W-f", "filezilla"
grab "W-p", "pcmanfm-mod"
grab "W-r", "urxvtc -name ranger -e ranger"
grab "W-v", "urxvtc -name vim -e vim"

# MPC grabs
grab "W-C-Right", "mpc next"
grab "W-C-Left", "mpc prev"
grab "W-C-Down", "mpc toggle"

# Scratchpad
grab "W-s" do
  if((c = Subtlext::Client["scratch"]))
    c.toggle_stick
    c.focus
  elsif((c = Subtlext::Subtle.spawn("urxvt -name scratch")))
    c.tags  = [] unless(c.nil?)
    c.flags = [ :stick ]
  end
end

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# [*string*]  With a WM_CLASS/WM_NAME
# [*hash*]    With a hash of properties
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# [*float*]   This property either sets the tagged client floating or prevents
#              it from being floating depending on the value.
#
#              Example: float true
#
# [*full*]    This property either sets the tagged client to fullscreen or
#              prevents it from being set to fullscreen depending on the value.
#
#              Example: full true
#
# [*gravity*] This property sets a certain to gravity to the tagged client,
#              but only on views that have this tag too.
#
#              Example: gravity :center
#
# [*match*]   This property adds matching patterns to a tag, a tag can have
#              more than one. Matching works either via plaintext, regex
#              (see man regex(7)) or window id. Per default tags will only
#              match the WM_NAME and the WM_CLASS portion of a client, this
#              can be changed with following possible values:
#
#              [*:name*]      Match the WM_NAME
#              [*:instance*]  Match the first (instance) part from WM_CLASS
#              [*:class*]     Match the second (class) part from WM_CLASS
#              [*:role*]      Match the window role
#
#              Example: match :instance => "urxvt"
#                       match [:role, :class] => "test"
#                       match "[xa]+term"
#
# [*exclude*] This property works exactly the same way as *match*, but it
#              excludes clients that match from this tag. That can be helpful
#              with catch-all tags e.g. for console apps.
#
#              Example: exclude :instance => "irssi"
#
# [*resize*]  This property either enables or disables honoring of client
#              resize hints and is independent of the global option.
#
#              Example: resize true
#
# [*size*]    This property sets a certain to size as well as floating to the
#              tagged client, but only on views that have this tag too. It
#              expects an array with x, y, width and height values.
#
#              Example: size [100, 100, 50, 50]
#
# [*stick*]   This property either sets the tagged client to stick or prevents
#              it from being set to stick depending on the value. Stick clients
#              are visible on every view.
#
#              Example: stick true
#
# [*type*]    This property sets the [[Tagging|tagged]] client to be treated
#              as a specific window type though as the window sets the type
#              itself. Following types are possible:
#
#              [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#              [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#              [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#              [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#              [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#
#              Example: type :desktop
#
# [*urgent*]  This property either sets the tagged client to be urgent or
#              prevents it from being urgent depending on the value. Urgent
#              clients will get keyboard and mouse focus automatically.
#
#              Example: urgent true
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

# Simple tags
tag "www", "uzbl|iron|opera|firefox|chromium|dwb"
tag "vec", "inkscape"
tag "vb", "virtualbox"

# Placement
tag "term" do
  match "xterm|[u]?rxvt"
  exclude "vim|scratch"
end

tag "vim" do
  match "vim"
  gravity :right
end

tag "scratchpad" do
  match :instance => "scratch"
  gravity :scratch
  urgent true
  stick true
end

tag "default" do
  gravity :center33
end

tag "fm" do
  match "pcmanfm-mod"
  gravity :right
end

tag "flash" do
  match "<unkown>|exe|operapluginwrapper" 
  stick true
end

tag "editor" do
  match  "gvim|gedit|texmaker|eclipse|geany"
  resize true
end

tag "view" do
  match "zathura|evince"
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim|gedit"
  resize true
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

tag "hotot" do
  match "hotot"
  gravity :left
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

tag "dialogs" do
  match :type => :dialog
  match :type => :splash
  stick true
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# === Link
#
# http://subforge.org/wiki/subtle/Tagging
#

view "term" do
  match "term|vim"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/terminal.xbm"
  icon_only true
end

view "www" do
  match "www"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/world.xbm"
  icon_only true
end

#view "media" do
#  match "mpd"
#  dynamic "false"
#  icon "#{ENV["HOME"]}/.local/share/subtle/icons/note1.xbm"
#  icon_only true
#end

view "design" do
  match "vec|gimp_.*"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/diagram.xbm"
  icon_only true
end

view "dev" do
  match "editor|view"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/notepad.xbm"
  icon_only true
end

view "bullshit" do
  match "default|hotot|fm"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/quote.xbm"
  icon_only true
end

view "vbox" do
  match "vb"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/pc.xbm"
  icon_only true
end

# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#    puts c.name
#   end
#
# === Link
#
# http://subforge.org/wiki/subtle/Hooks
#

# vim:ts=2:bs=2:sw=2:et:fdm=marker
