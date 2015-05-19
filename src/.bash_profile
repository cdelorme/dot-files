#!/bin/bash

# if not root and .bashrc exists load
if [ -f "$HOME/.bashrc" ] && test -t 0
then
    . "$HOME/.bashrc"
fi

# create local bin and add to path
[ ! -d ~/.bin ] && mkdir -p ~/.bin
export PATH="$HOME/.bin:$PATH"
