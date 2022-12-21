#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure grub"
sudo grubby --update-kernel=ALL --args="nowatchdog"
sudo grubby --update-kernel=ALL --args="nmi_watchdog=0"

my:step-begin "disable watchdog"
my:append-to-file-if-not-contains /etc/modprobe.d/watchdog-blacklist.conf 'blacklist iTCO_wdt'
my:append-to-file-if-not-contains /etc/modprobe.d/watchdog-blacklist.conf 'blacklist iTCO_vendor_support'
