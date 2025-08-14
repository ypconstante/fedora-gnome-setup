#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure firewall"
sudo firewall-cmd --zone=public --permanent --remove-service ssh

my:step-begin "disable unnecessary services"
sudo systemctl disable --now \
    ModemManager.service \
    NetworkManager-wait-online.service \
    systemd-networkd-wait-online.service
sudo systemctl mask remote-fs.target
