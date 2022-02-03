#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "create new folders"
mkdir -p \
    "$HOME/media" \
    "$HOME/projects/personal" \
    "$HOME/projects/sandbox"

my:step-begin "change home folder structure"
xdg-user-dirs-update --set DESKTOP "$HOME"
rm -rf "$HOME/Desktop"

mv "$HOME/Documents" "$HOME/documents"
xdg-user-dirs-update --set DOCUMENTS "$HOME/documents"

mv "$HOME/Downloads" "$HOME/downloads"
xdg-user-dirs-update --set DOWNLOAD "$HOME/downloads"

xdg-user-dirs-update --set MUSIC "$HOME/media"
rm -rf "$HOME/Music"

xdg-user-dirs-update --set PICTURES "$HOME/media"
rm -rf "$HOME/Pictures"

xdg-user-dirs-update --set PUBLICSHARE "$HOME/downloads"
rm -rf "$HOME/Public"

mv "$HOME/Templates" "$HOME/.local/template-files"
xdg-user-dirs-update --set TEMPLATES "$HOME/.local/template-files"

xdg-user-dirs-update --set VIDEOS "$HOME/media"
rm -rf "$HOME/Videos"

my:step-begin "create bookmark"
{
    echo "file://$HOME/documents Documents"
    echo "file://$HOME/downloads Downloads"
    echo "file://$HOME/media Media"
    echo "file://$HOME/projects Projects"
} > "$XDG_CONFIG_HOME/gtk-3.0/bookmarks"

my:step-begin "fix gnupg permissions"
mkdir -p "$HOME/.gnupg"
find "$HOME/.gnupg" -type d -exec chmod 700 {} \;
find "$HOME/.gnupg" -type f -exec chmod 600 {} \;
