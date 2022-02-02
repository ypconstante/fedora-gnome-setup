#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install backup tools"
sudo dnf copr enable -y luminoso/vorta
my:dnf-install borgbackup vorta
