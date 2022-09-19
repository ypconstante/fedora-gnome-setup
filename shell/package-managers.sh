#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "setup flatpak"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

my:step-begin "setup dnf"
my:append-to-file-if-not-contains /etc/dnf/dnf.conf 'max_parallel_downloads=10'

my:step-begin "add rpm fusion"
my:dnf-install \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${RELEASE_NUMBER}.noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${RELEASE_NUMBER}.noarch.rpm"
sudo dnf -y groupupdate core
