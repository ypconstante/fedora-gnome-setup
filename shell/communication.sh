#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

ZOOM_APP_NAME=us.zoom.Zoom

my:step-begin "install telegram"
my:flatpak-install org.telegram.desktop

my:step-begin "install zoom"
my:flatpak-install $ZOOM_APP_NAME

my:step-begin "configure zoom"
flatpak override --user $ZOOM_APP_NAME --reset
flatpak override --user $ZOOM_APP_NAME \
    --nofilesystem=~/.zoom \
    --persist=.zoom \
    --nofilesystem=~/Documents/Zoom \
    --persist=Documents
rm -rf "$HOME/.zoom" "$HOME/Documents/Zoom"

