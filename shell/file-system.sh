#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "close file managers"
nautilus --quit

./file-system_user.sh
./file-system_os.sh
