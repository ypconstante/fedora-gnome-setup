#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install steam"
my:flatpak-install com.valvesoftware.Steam
my:dnf-install steam-devices
