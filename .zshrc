#
# ~/.zshrc 02/02/2010 22:12
#

# {{{  Loaded modules.

#
# They are the modules built in zsh.
#
autoload -U url-quote-magic; zle -N self-insert url-quote-magic
autoload -U compinit        # Load the completion module.
compinit
autoload -U bashcompinit    # Load the bash(1) completion module.
autoload -U promptinit
promptinit
bashcompinit
autoload -U colors          # Load colors.
zmodload zsh/complist
colors
autoload edit-command-line  # Open $EDITOR to edit a command line.
zle -N edit-command-line

# }}}

# {{{ Aliases & Commands
alias ls="ls -l"
alias la="ls -auto"
alias -g pacman="pacman-color"
alias nano='nano -w -E -T 4'
alias mplayer='mplayer -msgcolor -msgmodule'
#
# Find the first editor listed in the 'editor' loop, then export the first
# found.
#
#for editor in vim nano vi; do # Editor.
#  which $editor > /dev/null 2>&1 && export EDITOR="$editor" && break
#done
export EDITOR="vim"
compdef mplayer-build="mplayer"
#
# General aliases, can run on any unix based systems.
#
#
# Commands are not the same on all systems, so make per os settings.

# {{{ Keys.

#
# Keybinds to built in zsh commands.
#

bindkey '^[[2~' overwrite-mode  # Overwrite mode on insert key.
bindkey '^[[3~' delete-char     # The backspace delete the last character.
bindkey '[[5~' history-search-backward # PgUp
bindkey '[[6~' history-search-forward  # PgDn
bindkey '^z' beginning-of-line
bindkey ";5D" backward-word
bindkey ";5C" forward-word

# {{{ General.

#
# Environment variables.
#
HISTFILE=~/.histfile     # The history file to use.
HISTSIZE=20000            # The max number of entries.
SAVEHIST=20000            # The number of entries to save.
PATH="$PATH:/bin:/usr/local/bin:/usr/bin:/home/alex/.scripts:/usr/share/perl5/vendor_perl/auto/share/dist/Cope"
export HISTFILE HISTSIZE SAVEHIST PATH

# }}}

# {{{ Settings.

# Auto cd(1) when writing directories names.
setopt autocd

# Don't save the command line if it begins with a space.
setopt hist_ignore_space

# Remove any useless spaces.
setopt hist_reduce_blanks

# Don't save the command line if it is same as the older one.
setopt hist_ignore_all_dups

# Immune commands.
setopt nohup

# Remove the right prompt if the line goes on it.
setopt transient_rprompt

# Append zsh sessions history instead of replacing it.
setopt append_history

# Do not kill jobs if terminal is closed.
setopt auto_continue

# }}}

# {{{ Prompt stuff.

# Clean prompt.
export PROMPT="%{$fg[black]$bold_color%}╸%b%{$fg[yellow]$bold_color%}%n%{$fg[black]$bold_color%}╺─╸%b%{$fg[green]$bold_color%}%~%{$fg[black]$bold_color%}╺%{$fg[green]%}%(1j:%j:) %{$reset_color%}"
# %{$fg[blue]$bold_color%}└─%{$fg[blue]%}╍ %{$reset_color%}"

# Gestion de la couleur pour les TTY
if [ "$TERM" = "linux" ]; then
  echo -en "\e]P01b1b1b" #black
  echo -en "\e]P8555753" #darkgrey
  echo -en "\e]P1ff6b6b" #darkred
  echo -en "\e]P9ff8d8d" #red
  echo -en "\e]P2a3d46e" #darkgreen
  echo -en "\e]PAc8e7a8" #green
  echo -en "\e]P3eaca75" #brown
  echo -en "\e]PBffd155" #yellow
  echo -en "\e]P4435e87" #darkblue
  echo -en "\e]PC587aa4" #blue
  echo -en "\e]P5cf8243" #darkmagenta
  echo -en "\e]PDf6a24f" #magenta
  echo -en "\e]P6789ec6" #darkcyan
  echo -en "\e]PE46a4ff" #cyan
  echo -en "\e]P7ababab" #lightgrey
  echo -en "\e]PFababab" #white
  clear #for background artifacting
fi
