#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure"
dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < "$ASSETS_DIR/terminal_gnome--config.dconf"
