#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure grub"
sudo grub2-editenv /boot/efi/EFI/fedora/grubenv create
my:copy-file "$ASSETS_DIR/boot--grub-config.sh" /etc/grub.d/98-fedora-setup
sudo chmod +x /etc/grub.d/98-fedora-setup
my:append-to-file-if-not-contains /etc/default/grub 'GRUB_CMDLINE_LINUX_DEFAULT="fbcon=nodefer nowatchdog nmi_watchdog=0"'
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

my:step-begin "disable watchdog"
my:append-to-file-if-not-contains /etc/modprobe.d/watchdog-blacklist.conf 'blacklist iTCO_wdt'
my:append-to-file-if-not-contains /etc/modprobe.d/watchdog-blacklist.conf 'blacklist iTCO_vendor_support'

my:step-begin "change plymouth theme"
my:dnf-install plymouth-theme-spinner
sudo plymouth-set-default-theme spinner -R
