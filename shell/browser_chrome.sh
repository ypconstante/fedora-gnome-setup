#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install chromium"
my:flatpak-install io.github.ungoogled_software.ungoogled_chromium

my:step-begin "configure"
flatpak override --user io.github.ungoogled_software.ungoogled_chromium --reset
flatpak override --user io.github.ungoogled_software.ungoogled_chromium \
    --nofilesystem=home \
    --persist=xdg-config
