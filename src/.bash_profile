#!/bin/bash

# if not root and .bashrc exists load
if [ ! $(id -u) -eq 0 ] && [ -f "$HOME/.bashrc" ] && tty -s &> /dev/null
then
    . "$HOME/.bashrc"
fi