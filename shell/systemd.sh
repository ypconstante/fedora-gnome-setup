#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure journald"
sudo mkdir -p /etc/systemd/journald.conf.d
sudo cp "$ASSETS_DIR/systemd--journald.conf" /etc/systemd/journald.conf.d/98-fedora-setup.conf
