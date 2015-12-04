# .bashrc for interactive shells post login

# don't continue if not interactive
[ -z "$PS1" ] && return

# set our editor
export EDITOR=vim

# set history file
export HISTFILE="$HOME/.bash_history"

# append history (as opposed to replacing it per terminal opened)
shopt -s histappend

# ignore lines in history that started with a space (allows you to hide sensative commands from history)
export HISTCONTROL=ignoreboth

# watch for window resizing and adjust terminal accordingly
shopt -s checkwinsize

# look for, and enable, command-not-found
[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

# set env vars for prompt addons
export ENHANCED_PROMPT=true
export GIT_PROMPT_ON=true
export GIT_PROMPT_DETAILED=true

# load prompt addons
[ -f ~/.git-completion ] && . ~/.git-completion
[ -f ~/.promptrc ] && . ~/.promptrc

# enable bash-completion if it exists
if [ -f /etc/bash_completion ]
then
	. /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]
then
	. /usr/share/bash-completion/bash_completion
elif which brew &>/dev/null && [ -f $(brew --prefix)/etc/bash_completion ]
then
	. $(brew --prefix)/etc/bash_completion
fi

# load grunt global bash-completion
which grunt &>/dev/null && eval "$(grunt --completion=bash)"

# load aws bash-completion
which aws &>/dev/null && complete -C aws_completer aws

# explicitly set XDG DATA DIRS
[ -z "$XDG_DATA_DIRS" ] && export XDG_DATA_DIRS="/usr/share:/usr/local/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/.local/share"

# aliases, color, and optimizations
if [ $(uname) = "Darwin" ]
then
	alias ls='ls -FGA'
	chflags nohidden "$HOME/Library"
else
	alias ls='ls -vhFA --color=auto'
	alias lue='find . -type f | perl -ne "print \$1 if m/\.([^.\/]+)$/" | sort -u'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -l'
alias ..='cd ..'
alias sshfs='sshfs -o cache=yes,compression=yes,large_read,kernel_cache'

# load ssh keys on first-run (will prompt for passwords)
export SSH_AUTH_SOCK=~/.ssh/socket
ssh-add -l &>/dev/null
sshout=$?
if [ $sshout -eq 2 ]
then
	rm ~/.ssh/socket
	eval $(ssh-agent -a $SSH_AUTH_SOCK 2>/dev/null) &>/dev/null
	ssh-add 2>/dev/null
elif [ $sshout -eq 1 ]
then
	ssh-add2>/dev/null
fi

