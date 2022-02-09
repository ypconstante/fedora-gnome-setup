#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure journald"
my:copy-file "$ASSETS_DIR/systemd--journald.conf" /etc/systemd/journald.conf.d/98-fedora-setup.conf
