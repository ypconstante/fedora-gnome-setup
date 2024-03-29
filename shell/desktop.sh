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

my:step-begin "install gnome tweaks"
my:dnf-install gnome-tweaks

my:step-begin "install extensions"
install-extension "PrivacyMenu@stuarthayhurst"
install-extension "quick-settings-tweaks@qwreey"

my:step-begin "disable default extensions"
gnome-extensions disable background-logo@fedorahosted.org

my:step-begin "load config"
dconf load / < "$ASSETS_DIR/desktop--config.dconf"

