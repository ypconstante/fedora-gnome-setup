#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

APP_NAME=org.x.Warpinator
my:step-begin "install"
my:flatpak-install $APP_NAME

my:step-begin "configure"
flatpak override --user $APP_NAME --reset
flatpak override --user $APP_NAME \
    --nofilesystem=home \
    --persist=Warpinator \
    --filesystem=xdg-download
rm -rf "$HOME/Warpinator"

CONFIG_FILE="$HOME/.var/app/$APP_NAME/config/glib-2.0/settings/keyfile"
my:append-to-file-if-not-contains $CONFIG_FILE "[org/x/warpinator/preferences]"
my:append-to-file-if-not-contains $CONFIG_FILE "receiving-folder='file://$HOME/downloads'"

