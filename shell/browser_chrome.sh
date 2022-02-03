#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:dnf-install chromium

my:step-begin "add temporary chromium to applications"
MENU_FILE="$XDG_DATA_HOME/applications/chromium-temp.desktop"
my:link-file "$ASSETS_DIR/browser_chrome--temp-profile.desktop" "$MENU_FILE"
chmod +x "$MENU_FILE"
