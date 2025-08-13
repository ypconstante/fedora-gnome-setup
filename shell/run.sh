#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

./package-managers.sh
./prepare.sh
./environment.sh
./git.sh

./terminal.sh
./backup.sh
./boot.sh
./browser.sh
./communication.sh
./desktop.sh
./dev.sh
./file-manager.sh
./file-system.sh
./graphics.sh
./media.sh
./memory.sh
./network.sh
./rss.sh
./sound.sh
./system-monitor.sh
./systemd.sh
./utility.sh
./virtualization.sh
