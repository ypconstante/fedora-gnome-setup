#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure sound"
my:link-file "$ASSETS_DIR/sound--wireplumber.lua" "$XDG_CONFIG_HOME/wireplumber/main.lua.d/98-custom.lua"
