#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:dnf-install direnv

my:step-begin "add shell setup"
direnv hook bash > "$XDG_CONFIG_HOME/bashrc.d/direnv.sh"
direnv hook fish > "$HOME/projects/personal/fish-local/conf.d/direnv.fish"
