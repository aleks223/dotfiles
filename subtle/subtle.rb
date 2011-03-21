# Author::  s__C

#
# == General options
#

# Border size in pixel of the windows
set :border, 3

# Window move/resize steps in pixel per keypress
set :step, 2

# Window screen border snapping
set :snap, 3

# Default starting gravity for windows (0 = gravity of last client)
set :gravity, :center

# Make transient windows urgent
set :urgent, true

# Enable respecting of size hints globally
set :resize, false

# Screen size padding (left, right, top, bottom)
set :padding,    [2, 2, 1, 1]

# Font string either take from e.g. xfontsel or use xft
#set :font, "-misc-fixed-medium-r-*-*-12-*-*-*-*-*-iso10646-*"
set :font, "xft:Envy Code R-8"

# Space around windows
set :gap, 4

# Separator between sublets
set :separator, ""

# Outline border size in pixel of panel items
set :outline, 2

#
# == Screen
#

screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the top panel
  top     [ :title, :spacer, :clock, :spacer, :mpd, :freq, :battery, :volume, :gmail, :wifi, :tray, :views ]

  # Content of the bottom panel
  # bottom  [ :mail ]
end

#
# == Colors
#

# panel and separator
color :stipple,      "#eeeeee"
color :panel,        "#181818"
color :separator,    "#850000"

# title
color :title_fg,        "#888888"
color :title_bg,        "#181818"
color :title_border,    "#181818"

# view button
color :views_fg,      "#555555"
color :views_bg,      "#181818"
color :views_border,  "#333333"

# sublets
color :sublets_fg,    "#0066ff"
color :sublets_bg,    "#181818"
color :sublets_border,"#181818"

# focus window titles and active views
color :focus_fg,         "#8fea26"
color :focus_bg,         "#181818"
color :focus_border,     "#333333"

# occupied
color :occupied_fg,      "#888888"
color :occupied_bg,      "#181818"
color :occupied_border,  "#333333"

# urgent window titles and views
color :urgent_fg,        "#ffc400"
color :urgent_bg,        "#555555"
color :urgent_border,    "#333333"

# client
color :client_active,   "#181818"
color :client_inactive, "#333333"

#
# == Gravities
#

  # Gravities
gravity :top_left,      [0, 0, 50, 50]
#gravity :top_left33,    [0, 0, 34, 34]
gravity :top_left50,    [0, 0, 34, 50]
gravity :top_left75,	[0, 0, 50, 75]
gravity :top,           [50, 0, 100, 50]
#gravity :top33,         [50, 0, 34, 34]
gravity :top50,         [50, 0, 34, 50]
gravity :top75,		[0, 0, 100, 75]
gravity :top_right,     [100, 0, 50, 50]
#gravity :top_right33,   [100, 0, 34, 34]
gravity :top_right50,   [100, 0, 34, 50]
gravity :top_right75,	[100, 0, 50, 75]
gravity :left,          [0, 0, 50, 100]
#gravity :left66,        [0, 50, 25, 100]
gravity :left50,        [0, 50, 50, 34]
#gravity :left33,        [0, 50, 34, 34]
#gravity :leftw,         [0, 50, 66, 100]
#gravity :lefth,         [0, 50, 75, 100]
gravity :center,        [0, 0, 100, 100]
#gravity :center66,      [0, 50, 100, 34]
gravity :center33,      [50, 50, 50, 34]
#gravity :center75,      [50, 50, 50, 100]
gravity :right,         [100, 0, 50, 100]
#gravity :right66,       [100, 50, 25, 100]
gravity :right50,       [100, 50, 50, 34]
#gravity :right33,       [100, 50, 34, 34]
#gravity :rightw,        [100, 0, 60, 100]
#gravity :righth,        [100, 50, 66, 100]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left50, [0, 100, 34, 50]
#gravity :bottom_left33, [0, 100, 34, 34]
gravity :bottom_left25, [0, 100, 50, 25]
gravity :bottom,        [0, 100, 100, 50]
#gravity :bottom66,      [50, 100, 34, 50]
#gravity :bottom33,      [50, 100, 34, 34]
gravity :bottom25,	[0, 100, 100, 25]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right50, [100, 100, 34, 50]
#gravity :bottom_right33, [100, 100, 34, 34]
gravity :bottom_right25, [100, 100, 50, 25]
  # Gimp
gravity :gimp_image,     [  50,  50,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [ 100,   0,  10, 100 ]
  # Scratchpad
gravity :scratch, [ 46, 85, 46, 20 ]

#
# == Grabs
#

# Launcher
begin
   require "#{ENV["HOME"]}/subtle-contrib/ruby/launcher.rb"

   # Set fonts
   Subtle::Contrib::Launcher.fonts = [
     "xft:Pragmata:pixelsize=50:antialias=true",
     "xft:Pragmata:pixelsize=25:antialias=true"
   ]
   Subtle::Contrib::Launcher.paths = [
     "/usr/bin"
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
grab "W-KP_7", [ :top_left,     :top_left50,     :top_left75	]
grab "W-KP_8", [ :top,          :top50,          :top75		]
grab "W-KP_9", [ :top_right,    :top_right50,    :top_right75    ]
grab "W-KP_4", [ :left,         :left50        ]
grab "W-KP_5", [ :center,       :center33      ]
grab "W-KP_6", [ :right,        :right50       ]
grab "W-KP_1", [ :bottom_left,  :bottom_left50,  :bottom_left25  ]
grab "W-KP_2", [ :bottom,       :bottom25       ]
grab "W-KP_3", [ :bottom_right, :bottom_right50, :bottom_right25 ]

# Exec programs
grab "W-Return", "urxvtc"
grab "W-c", "chromium"
grab "W-g", "gvim"
grab "W-h", "hotot"
grab "W-m", "urxvtc -name mutt -e mutt"
grab "W-n", "mpd && urxvtc -name ncmpcpp -e ncmpcpp || urxvtc -name ncmpcpp -e ncmpcpp"
grab "W-t", "urxvtc -name screen -e screen"
grab "W-a", "urxvtc -name screen -e screen -r"
grab "W-f", "firefox"
grab "W-C-f", "filezilla"
grab "W-p", "thunar"
grab "W-r", "urxvtc -name ranger -e mc"
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

# Simple tags
tag "www", "uzbl|iron|opera|firefox|chromium|dwb"
tag "vec", "inkscape"
tag "vb", "virtualbox"

# Placement
tag "term" do
  match "xterm|[u]?rxvt"
  exclude "vim|scratch|mutt|tmux|ncmpcpp|screen"
end

tag "vim" do
  match "vim"
  gravity :right
end

tag "tmux" do
  match "tmux|screen"
  gravity :top75
end

tag "mpd" do
  match "ncmpcpp"
  gravity :bottom25
end

tag "mail" do
  match "mutt"
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
  match "thunar"
  gravity :right
end

tag "matlab" do
  match :class => ".*mat(lab|hworks).*"
end

tag "flash" do
  match "<unkown>|exe|operapluginwrapper"
  stick true
end

tag "editor" do
  match  "gvim|gedit|texmaker|eclipse|geany"
  resize false
end

tag "view" do
  match "zathura|evince"
  float true
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
  match "mplayer|ranger"
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

view "term" do
  match "term|mpd|tmux"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/terminal.xbm"
  icon_only true
end

view "www" do
  match "www"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/cannon.xbm"
  icon_only true
end

view "mail" do
  match "mail"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/mail.xbm"
  icon_only true
end

view "design" do
  match "vec|gimp_.*"
  dynamic false
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/diagram.xbm"
  icon_only true
end

view "dev" do
  match "editor|vim"
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

view "prog" do
  match "matlab"
  dynamic true
end

#
# Sublets
#

sublet :clock do
  foreground "#89b6e2"
  format_string "%d.%m.%y %H:%M"
end

sublet :volume do
  foreground "#8fea26"
end

sublet :wifi do
  foreground "#eab93d"
end

sublet :freq do
  interval 1
  foreground "#ce5c00"
end

sublet :gmail do
  user "THE_LEGEND@gmail.com"
  password "SUPER_PASS"
  foreground "#93d44f"
  urgent "#ffc400"
  normal "#333333"
end

sublet :battery do
  foreground "#f57900"
end

sublet :mpd do
  foreground "#cccccc"
  format_string "%note% %artist% - %album% - %title%"
end

sublet :fuzzytime do
  foreground "#ff6565"
  locale "fr"
end
