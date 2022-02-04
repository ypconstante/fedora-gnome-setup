#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:dnf-install dconf-editor

my:step-begin "configure"
dconf write /ca/desrt/dconf-editor/show-warning false
