# .bashrc for interactive shells post login

# don't continue if not interactive
[ -z "$PS1" ] && return

# don't run if already loaded
[ -n "${ENHANCED_PROMPT+x}" ] && return

# set our editor
export EDITOR=vim

# Check for OS X
if [ $(uname) = "Darwin" ]
then

    # Append brew path first
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

    # Set library visibility
    chflags nohidden "$HOME/Library"
fi

# create a $HOME/.bin directory if not exists & add to path (to front)
if [ ! -d "$HOME/.bin" ]
then
    mkdir -p "$HOME/.bin" &> /dev/null
fi
export PATH="$HOME/.bin:$PATH"

# shortened time format output
export TIMEFORMAT="r: %R, u: %U, s: %S"

# set history file
export HISTFILE="$HOME/.bash_history"

# append history (as opposed to replacing it per terminal opened)
shopt -s histappend

# ignore lines in history that started with a space (allows you to hide sensative commands from history)
export HISTCONTROL=ignoreboth

# watch for window resizing and adjust terminal accordingly
shopt -s checkwinsize

# enable bash-completion if it exists
if [ -f /etc/bash_completion ]
then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]
then
    . /usr/share/bash-completion/bash_completion
elif which brew &> /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]
then
    . $(brew --prefix)/etc/bash_completion
fi

# enable command-not-found bash script (list the packages that have the command)
if [ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]
then
    . "/usr/share/doc/pkgfile/command-not-found.bash"
fi

# colored terminal
if [ $(uname) = "Darwin" ]
then
    alias ls='ls -FGa'
else
    alias ls='ls -ahF --color=auto'
fi
if [[ $(uname) != MINGW* ]]
then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll="ls -l"

# explicitly set XDG DATA DIRS
if [ $(uname) != "Darwin" ] && [[ $(uname) != MINGW* ]]
then
    if [ -z "$XDG_DATA_DIRS" ]
    then
        XDG_DATA_DIRS="/usr/share:/usr/local/share"
    fi
    XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share"
fi

# if sublime text is installed locally, makde sure a local subl exists
if [ $(uname) != "Darwin" ] && [ ! -f "$HOME/.bin/subl" ] && [ -f "$HOME/applications/sublime_text/sublime_text" ];then
    ln -s "$HOME/applications/sublime_text/sublime_text" "$HOME/.bin/subl"
fi

# check for go to add GOPATH
if which go &> /dev/null
then
    if [ ! -d "${HOME}/.go" ]
    then
        mkdir -p "${HOME}/.go/"{src,pkg} &> /dev/null
    fi
    export GOPATH="${HOME}/.go"
    ln -sf "${HOME}/.bin" "${GOPATH}/bin"
fi

# load prompt addons
if [ -f "$HOME/.git-completion" ]
then
    . "$HOME/.git-completion"
fi
if [ -f "$HOME/.promptrc" ]
then
    . "$HOME/.promptrc"
fi

# configure $HOME/.prompt addons
export ENHANCED_PROMPT=true
export GIT_PROMPT_ON=true
export GIT_PROMPT_DETAILED=true

# load ssh keys on first-run (will prompt for passwords)
ssh-add -l &> /dev/null
sshout=$?
if [ $sshout -eq 2 ]
then
    eval $(ssh-agent) &> /dev/null
    ssh-add
elif [ $sshout -eq 1 ]
then
    ssh-add
fi
