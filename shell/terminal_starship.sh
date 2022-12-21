#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
sudo dnf copr enable -y atim/starship
# gdouros-symbola-fonts is necessary to render symbols correctly
my:dnf-install starship gdouros-symbola-fonts
my:link-file "$ASSETS_DIR/terminal_starship.toml" "$XDG_CONFIG_HOME/starship.toml"

my:step-begin "add shell setup"
starship init bash --print-full-init > "$XDG_CONFIG_HOME/bashrc.d/starship.sh"
starship init fish --print-full-init > "$HOME/projects/personal/fish-local/conf.d/starship.fish"
