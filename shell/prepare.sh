#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "remove unused packages"
my:dnf-remove \
    gnome-contacts \
    gnome-photos \
    gnome-tour \
    ibus-typing-booster \
    libreoffice* \
    rhythmbox \
    simple-scan \
    sane-airscan \
    w3m \
    yelp
sudo dnf autoremove -y -q
sudo flatpak uninstall -y --unused

FLATPAK_LATEST_NVIDIA=$(flatpak list | grep "GL.nvidia" | cut -f2 | cut -d '.' -f5)
flatpak list | \
    grep org.freedesktop.Platform.GL32.nvidia- | \
    cut -f2 | \
    grep -v "$FLATPAK_LATEST_NVIDIA" | \
    xargs --no-run-if-empty -o sudo flatpak uninstall -y

my:step-begin "create common folders"
mkdir -p "$HOME/.local/bin/"
mkdir -p "$XDG_DATA_HOME/applications"
mkdir -p "$XDG_DATA_HOME/systemd/user"
mkdir -p "$XDG_STATE_HOME"
