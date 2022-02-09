#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure NetworkManager"
my:copy-file "$ASSETS_DIR/network--NetworkManager.conf" /etc/NetworkManager/conf.d/98-fedora-setup.conf

my:step-begin "configure systemd-resolved"
my:copy-file "$ASSETS_DIR/network--systemd-resolved.conf" /etc/systemd/resolved.conf.d/98-fedora-setup.conf

my:step-begin "configure firewall"
sudo firewall-cmd --zone=public --permanent --remove-service ssh

my:step-begin "disable unnecessary services"
sudo systemctl disable ModemManager.service NetworkManager-wait-online.service
sudo systemctl mask remote-fs.target
