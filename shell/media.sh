#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install spotify"
my:flatpak-install com.spotify.Client

my:step-begin "install vlc"
my:dnf-install vlc
