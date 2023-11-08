#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

CONFIG_DIR=$XDG_CONFIG_HOME/git
GIT_IGNORE_FILE=$CONFIG_DIR/ignore

my:step-begin "install git and git tools"
my:dnf-install \
    git \
    git-delta \
    meld

my:step-begin "configure git"
my:create-file "$CONFIG_DIR/config"
my:create-file "$CONFIG_DIR/credentials"
git config --global include.path "$ASSETS_DIR/git--config"

my:step-begin "create gitignore"
curl -sS https://www.toptal.com/developers/gitignore/api/dotenv,git,linux,mac,jetbrains+all,sublimetext -o "$GIT_IGNORE_FILE"
echo -e "\n" >> "$GIT_IGNORE_FILE"
cat "$ASSETS_DIR/git--ignore" >> "$GIT_IGNORE_FILE"

my:step-begin "configure git tools"
dconf load /org/gnome/meld/ < "$ASSETS_DIR/git--meld.dconf"

my:step-begin "add known ssh hosts"
mkdir -p "$HOME/.ssh"
chmod 0755 "$HOME/.ssh"
my:link-file "$ASSETS_DIR/git--hosts" "$HOME/.ssh/known_hosts"
