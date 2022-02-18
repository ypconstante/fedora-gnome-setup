#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure"=
dconf load / < "$ASSETS_DIR/file-manager--config.dconf"
