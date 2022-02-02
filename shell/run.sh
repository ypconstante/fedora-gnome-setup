#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

./package-managers.sh
./prepare.sh
./environment.sh
./git.sh
./toolbox.sh

./terminal.sh
./backup.sh
./battery.sh
