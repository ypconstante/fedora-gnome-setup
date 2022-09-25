#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "move history file"
my:create-file "$HISTFILE"

my:step-begin "remove old files"
rm -f \
    "$HOME/.bash_history" \
    "$HOME/.bash_logout" \
    "$HOME/.bash_profile"

my:step-begin "move bashrc.d folder"
sed -Ei "s|~/.bashrc.d|$XDG_CONFIG_HOME/bashrc.d|" "$HOME/.bashrc"

my:step-begin "source .profile"
echo "source $HOME/.profile" > "$XDG_CONFIG_HOME/bashrc.d/profile.sh"
