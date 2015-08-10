#!/bin/bash

# if not root and .bashrc exists load
if [ -f "$HOME/.bashrc" ] && test -t 0
then
	. "$HOME/.bashrc"
fi
