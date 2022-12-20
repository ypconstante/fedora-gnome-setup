#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure sound"
sudo cp -a /usr/share/wireplumber/main.lua.d/50-alsa-config.lua /etc/wireplumber/main.lua.d/50-alsa-config.lua

# disable sound suspending, it causes clicking sounds
sudo sed -Ei 's/^(.*session.suspend-timeout-seconds[^=]+=)[ 0-9]+(.*)$/\1 0\2/' /etc/wireplumber/main.lua.d/50-alsa-config.lua
