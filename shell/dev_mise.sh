#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
sudo dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo --overwrite
my:dnf-install mise

my:step-begin "update plugins"
mise plugins update

my:step-begin "install erlang dependencies"
my:dnf-install \
    autoconf \
    automake \
    ncurses-devel

my:step-begin "config"
my:link-file "$ASSETS_DIR/dev_mise.toml" "$XDG_CONFIG_HOME/mise.toml"
mise trust "$XDG_CONFIG_HOME/mise.toml"

my:step-begin "fish config"
mise activate fish > "$HOME/projects/personal/fish-local/conf.d/mise.fish"

my:step-begin "install tools"
mise install
