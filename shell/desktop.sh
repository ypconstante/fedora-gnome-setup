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

my:step-begin "install custom extension"
TMP_DIR=$(mktemp -d)
gnome-extensions pack "$ASSETS_DIR/desktop--extension" -o "$TMP_DIR"
gnome-extensions install "$TMP_DIR/setup@ypconstante.github.com.shell-extension.zip"
gnome-extensions enable setup@ypconstante.github.com

my:step-begin "install extensions"
install-extension "AlphabeticalAppGrid@stuarthayhurst"
install-extension "blur-my-shell@aunetx"
install-extension "dash-to-dock@micxgx.gmail.com"
install-extension "hidetopbar@mathieu.bidon.ca"
install-extension "just-perfection-desktop@just-perfection"
install-extension "sound-output-device-chooser@kgshank.net"

my:step-begin "disable default extensions"
gnome-extensions disable background-logo@fedorahosted.org

my:step-begin "load config"
dconf load / < "$ASSETS_DIR/desktop--config.dconf"

