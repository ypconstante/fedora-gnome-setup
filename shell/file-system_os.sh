#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "disable network auto mount"
sudo sed -Ei 's/AutoMount=true/AutoMount=false/' /usr/share/gvfs/mounts/network.mount

my:step-begin "file system kernel parameters"
sudo cp "$ASSETS_DIR/file-system--kernel-parameters.conf" /etc/sysctl.d/98-file-system.conf
sudo chmod 644 /etc/sysctl.d/98-file-system.conf

my:step-begin "change mount options to optimize for ssd"
sudo sed -Ei '/ssd/!s|( subvol[^ ]*)|\1,ssd|' /etc/fstab
sudo sed -Ei '/noatime/!s|( subvol[^ ]*)|\1,noatime|' /etc/fstab

sudo systemctl daemon-reload
