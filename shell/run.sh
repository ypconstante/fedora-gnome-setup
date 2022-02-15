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
./boot.sh
./browser.sh
./communication.sh
./desktop.sh
./dev.sh
./file-system.sh
./graphics.sh
./media.sh
./memory.sh
./network.sh
./systemd.sh
./utility.sh
