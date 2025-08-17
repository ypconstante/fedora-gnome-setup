#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:dnf-add-repo https://mise.jdx.dev/rpm/mise.repo
my:dnf-install mise

my:step-begin "update plugins"
mise plugins update

my:step-begin "install erlang dependencies"
my:dnf-install \
    autoconf \
    automake \
    gcc \
    ncurses-devel \
    openssl-devel

my:step-begin "config"
my:link-file "$ASSETS_DIR/dev_mise.toml" "$XDG_CONFIG_HOME/mise/config.toml"
mise trust "$XDG_CONFIG_HOME/mise.toml"

my:step-begin "fish config"
mise activate fish > "$HOME/projects/personal/fish-local/conf.d/mise.fish"
mise completion fish > "$HOME/projects/personal/fish-local/completions/mise.fish"

my:step-begin "install tools"
mise install
