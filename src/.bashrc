# .bashrc for interactive shells post login

# Don't continue if not interactive
[ -z "$PS1" ] && return

# Set our editor
export EDITOR=vim

# Create a ~/bin directory if not exists & add to path (to front)
if [ -d "$HOME/bin" ]
then
    mkdir -p "$HOME/bin" &> /dev/null
fi
PATH="$HOME/bin:$PATH"

# If OS X add brew path in front
if [ $(uname) = "Darwin" ]
then
    PATH="/usr/local/bin:$PATH"
fi

# Shortened time format output
export TIMEFORMAT="r: %R, u: %U, s: %S"

# Set history file
export HISTFILE="$HOME/.bash_history"

# Append History (as opposed to replacing it per terminal opened)
shopt -s histappend

# Ignore lines in history that started with a space (allows you to hide sensative commands from history)
export HISTCONTROL=ignoreboth

# Watch for window resizing and adjust terminal accordingly
shopt -s checkwinsize

# Enable Bash Completion if it exists
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
fi

# Enable command-not-found bash script (list the packages that have the command)
if [ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]
then
    . "/usr/share/doc/pkgfile/command-not-found.bash"
fi

# If no autostart dir exists create it
if [ ! -d "~/.config/autostart" ];then
    mkdir -p "~/.config/autostart"
fi

# If guake exists add it to startup items
if which guake &> /dev/null && [ ! -f "$HOME/.config/autostart/guake.desktop" ] && [ -f "/usr/share/applications/guake.desktop" ]
then
    cp "/usr/share/applications/guake.desktop" "$HOME/.config/autostart/guake.desktop"
fi

# If sublime text is installed locally, makde sure a local subl exists
if [ ! -f "$HOME/bin/subl" ] && [ -f "$HOME/applications/sublime_text/sublime_text" ];then
    ln -s "$HOME/applications/sublime_text/sublime_text" "$HOME/bin/subl"
fi

# Colored terminal
if [ $(uname) = "Darwin" ]
then
    alias ls='ls -FGa'
else
    alias ls='ls -ahF --color=auto'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Explicitly set XDG DATA DIRS
if [ $(uname) != "Darwin" ]
then
    if [ -z "$XDG_DATA_DIRS" ]
    then
        XDG_DATA_DIRS="/usr/share:/usr/local/share"
    fi
    XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share"
fi

# TODO Configure Prompt Addons
# TODO Add Prompt Addons
