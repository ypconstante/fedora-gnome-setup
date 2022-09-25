#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "create common folders"
mkdir -p "$XDG_CONFIG_HOME/bashrc.d"
mkdir -p "$HOME/projects/personal/fish-local/conf.d"
mkdir -p "$HOME/projects/personal/fish-local/completions"
mkdir -p "$HOME/projects/personal/fish-local/functions"

find . -name "terminal_*.sh"  -not -name 'terminal_fish.sh' -print0 | my:run-files
./terminal_fish.sh
