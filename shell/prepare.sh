#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "remove unused packages"
my:dnf-remove \
    gnome-tour \
    libreoffice* \
    rhythmbox \
    simple-scan \
    sane-airscan
sudo dnf autoremove -y -q
sudo flatpak uninstall -y --unused

my:step-begin "update firmwares"
sudo fwupdmgr refresh --force -y
sudo fwupdmgr get-devices -y
sudo fwupdmgr update -y

my:step-begin "create common folders"
mkdir -p "$HOME/.local/bin/"
mkdir -p "$XDG_DATA_HOME/applications"
mkdir -p "$XDG_DATA_HOME/systemd/user"
mkdir -p "$XDG_STATE_HOME"
