#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
sudo dnf copr enable -y atim/starship
my:dnf-install starship
my:link-file "$ASSETS_DIR/terminal_starship.toml" "$XDG_CONFIG_HOME/starship.toml"
