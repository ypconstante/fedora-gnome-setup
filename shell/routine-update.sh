#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "update current repo"
git pull

./prepare.sh
./dev_asdf.sh
./terminal_fish.sh
./toolbox_update.sh
