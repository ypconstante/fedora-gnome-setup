#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install telegram"
my:flatpak-install org.telegram.desktop
