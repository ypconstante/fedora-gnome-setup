#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
sudo dnf config-manager addrepo --from-repofile=https://mise.jdx.dev/rpm/mise.repo --overwrite
my:dnf-install mise

my:step-begin "fish config"
mise activate fish > "$HOME/projects/personal/fish-local/conf.d/mise.fish"
