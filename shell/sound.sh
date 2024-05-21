#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure sound"
my:link-file "$ASSETS_DIR/sound--wireplumber.conf" "$XDG_CONFIG_HOME/wireplumber/wireplumber.conf.d/98-custom.conf"
my:link-file "$ASSETS_DIR/sound--pipewire-client.conf" "$XDG_CONFIG_HOME/pipewire/client.conf.d/98-custom.conf"
my:link-file "$ASSETS_DIR/sound--pipewire-pulse.conf" "$XDG_CONFIG_HOME/pipewire/pipewire-pulse.conf.d/98-custom.conf"

systemctl --user restart pipewire.service pipewire-pulse.socket
