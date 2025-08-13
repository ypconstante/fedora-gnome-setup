#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure"
dconf reset -f /org/gnome/Ptyxis/
dconf load /org/gnome/Ptyxis/ < "$ASSETS_DIR/terminal_ptyxis--config.dconf"
