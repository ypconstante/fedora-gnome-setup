#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "file system kernel parameters"
my:copy-file "$ASSETS_DIR/file-system--kernel-parameters.conf" /etc/sysctl.d/98-file-system.conf
sudo chmod 644 /etc/sysctl.d/98-file-system.conf

my:step-begin "disable swap"
sudo swapoff -a

my:step-begin "change mount options to optimize for ssd"
sudo sed -Ei '/ssd/!s|( subvol[^ ]*)|\1,ssd|' /etc/fstab
sudo sed -Ei '/noatime/!s|( subvol[^ ]*)|\1,noatime|' /etc/fstab

sudo systemctl daemon-reload
