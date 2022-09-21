#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

install-extension() {
    local EXTENSION_ID="$1"
    gdbus call \
        --session \
        --dest org.gnome.Shell.Extensions \
        --object-path /org/gnome/Shell/Extensions \
        --method org.gnome.Shell.Extensions.InstallRemoteExtension \
        "$EXTENSION_ID"
    sleep 2
}

my:step-begin "install extension manager"
my:flatpak-install com.mattjakeman.ExtensionManager
