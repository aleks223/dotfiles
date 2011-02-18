# Author::  s__C

#
# == General options
#

# Border size in pixel of the windows
set :border, 2

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
set :padding,    [3, 3, 2, 2]

# Font string either take from e.g. xfontsel or use xft
set :font, "-misc-fixed-medium-r-*-*-12-*-*-*-*-*-iso10646-*"
#set :font, "xft:Pragmata-9"

# Space around windows
set :gap, 2

# Separator between sublets
set :separator, ""

# Outline border size in pixel of panel items
set :outline, 0

#
# == Screen
#

screen 1 do
  # Add stipple to panels
  stipple false

  # Content of the top panel
  top     [ :views, :title, :spacer, :mpd, :freq, :battery, :volume, :wifi, :gmail, :clock, :tray ]

  # Content of the bottom panel
  # bottom  [ :mail ]
end

#
# == Colors
#

# panel and separator
color :stipple,      "#eeeeee"
color :panel,        "#0066ff"
color :separator,    "#850000"

# title
color :title_fg,        "#eeeeee"
color :title_bg,        "#0066ff"
color :title_border,    "#0066ff"

# view button
color :views_fg,      "#555555"
color :views_bg,      "#eeeeee" 
color :views_border,  "#eeeeee"

# sublets
color :sublets_fg,    "#555555"
color :sublets_bg,    "#eeeeee"
color :sublets_border,"#eeeeee"
 
# focus window titles and active views
color :focus_fg,         "#eeeeee" 
color :focus_bg,         "#0066ff" 
color :focus_border,     "#0066ff"
 
# occupied
color :occupied_fg,      "#eeeeee" 
color :occupied_bg,      "#555555" 
color :occupied_border,  "#555555" 

# urgent window titles and views
color :urgent_fg,        "#eeeeee"
color :urgent_bg,        "#FFC400" 
color :urgent_border,    "#FFC400" 
 
# client
color :client_active,   "#0066ff" 
color :client_inactive, "#555555"

# panel
color :panel, "#0066ff"

#
# == Gravities
#

  # Gravities
gravity :top_left,      [0, 0, 50, 50]
gravity :top_left33,    [0, 0, 34, 34]
gravity :top_left50,    [0, 0, 34, 50]
gravity :top,           [50, 0, 100, 50]
gravity :partial_top,   [0,0, 100, 60]
gravity :top33,         [50, 0, 34, 34]
gravity :top50,         [50, 0, 34, 50]
gravity :top_right,     [100, 0, 50, 50]
gravity :top_right33,   [100, 0, 34, 34]
gravity :top_right50,   [100, 0, 34, 50]
gravity :left,          [0, 0, 50, 100]
gravity :left66,        [0, 50, 25, 100]
gravity :left50,        [0, 50, 50, 34]
gravity :left33,        [0, 50, 34, 34]
gravity :leftw,         [0, 50, 2*34, 100]
gravity :lefth,         [0, 50, 75, 100]
gravity :center,        [0, 0, 100, 100]
gravity :center66,      [0, 50, 100, 34]
gravity :center33,      [50, 50, 50, 34]
gravity :center75,      [50, 50, 50, 100]
gravity :right,         [100, 0, 50, 100]
gravity :right66,       [100, 50, 25, 100]
gravity :right50,       [100, 50, 50, 34]
gravity :right33,       [100, 50, 34, 34]
gravity :rightw,        [100, 0, 60, 100]
gravity :righth,        [100, 50, 2*34, 100]
gravity :bottom_left,   [0, 100, 50, 50]
gravity :bottom_left50, [0, 100, 34, 50]
gravity :bottom_left33, [0, 100, 34, 34]
gravity :bottom,        [0, 100, 100, 50]
gravity :partial_bottom,[0, 100, 100, 40]
gravity :bottom66,      [50, 100, 34, 50]
gravity :bottom33,      [50, 100, 34, 34]
gravity :bottom_right,  [100, 100, 50, 50]
gravity :bottom_right50, [100, 100, 34, 50]
gravity :bottom_right33, [100, 100, 34, 34]
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
     "/usr/bin","/home/alex/Matlab/bin"
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
grab "W-KP_0", [ :partial_top, :partial_bottom ]

# Exec programs
grab "W-Return", "urxvtc"
grab "W-e", "gedit"
grab "W-c", "iron"
grab "W-g", "gvim"
grab "W-h", "hotot"
grab "W-m", "urxvtc -name mutt -e mutt"
grab "W-C-m", "urxvtc -e matlab -nosplash -desktop"
grab "W-n", "mpd && urxvtc -name ncmpcpp -e ncmpcpp || urxvtc -name ncmpcpp -e ncmpcpp"
grab "W-t", "urxvtc -name tmux -e tmux"
grab "W-a", "urxvtc -name tmux -e tmux a || tmux"
grab "W-f", "filezilla"
grab "W-p", "thunar"
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
  gravity :partial_top
end

tag "mpd" do
  match "ncmpcpp"
  gravity :partial_bottom
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

view "term" do
  match "term|mpd|tmux"
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
  icon "#{ENV["HOME"]}/.local/share/subtle/icons/terminal.xbm"
  icon_only true
end

#
# Sublets
#

sublet :clock do
  foreground "#ce5c00"
  format_string "%d.%m.%y %H:%M"
end

sublet :volume do
  foreground "#93d44f"
end

sublet :wifi do
  foreground "#ffc123"
end

sublet :freq do
  interval 1
  foreground "#ff6565"
end

sublet :gmail do
  user "USER@gmail.com"
  password "PASS"
  foreground "#555753"
  urgent "#ffc400"
  normal "#eeeeee"
end

sublet :battery do
  foreground "#f57900"
end

sublet :mpd do
  foreground "#46a4ff"
  format_string "%note% %artist% - %album% - %title%"
end

sublet :fuzzytime do
  foreground "#ff6565"
  locale "fr"
end
