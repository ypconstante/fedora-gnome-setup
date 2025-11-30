#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install gnome games"
my:dnf-install \
    aisleriot \
    gnome-mahjongg \
    gnome-mines
