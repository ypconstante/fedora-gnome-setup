#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install celluloid"
my:dnf-install celluloid --setopt=install_weak_deps=False

my:step-begin "remove gnome videos"
my:dnf-remove totem
