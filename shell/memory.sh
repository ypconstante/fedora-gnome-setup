#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "memory kernel parameters"
sudo cp "$ASSETS_DIR/memory--kernel-parameters.conf" /etc/sysctl.d/98-memory.conf
sudo chmod 644 /etc/sysctl.d/98-memory.conf
