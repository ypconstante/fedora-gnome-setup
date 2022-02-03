#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:git-clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR"
asdf update

my:step-begin "config"
my:link-file "$ASSETS_DIR/dev_asdf--rc" "$ASDF_CONFIG_FILE"

my:step-begin "update plugins"
mkdir -p "$ASDF_DIR/plugins"
asdf plugin-update --all

my:step-begin "fish config"
my:link-file "$ASDF_DIR/completions/asdf.fish" "$HOME/projects/personal/fish-local/completions/asdf.fish"
sed -E "s| asdf | asdf-toolbox |" "$ASDF_DIR/completions/asdf.fish" \
    > "$HOME/projects/personal/fish-local/completions/asdf-toolbox.fish"
