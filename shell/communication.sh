#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

SLACK_APP_NAME=com.slack.Slack
ZOOM_APP_NAME=us.zoom.Zoom

my:step-begin "install telegram"
my:flatpak-install org.telegram.desktop

my:step-begin "install slack"
my:flatpak-install $SLACK_APP_NAME

my:step-begin "configure slack"
flatpak override --user $SLACK_APP_NAME --reset
flatpak override --user $SLACK_APP_NAME \
    --nofilesystem=xdg-documents \
    --nofilesystem=xdg-music \
    --nofilesystem=xdg-pictures \
    --nofilesystem=xdg-videos

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

