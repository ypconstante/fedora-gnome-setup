#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure system monitor"
dconf write /org/gnome/gnome-system-monitor/show-whose-processes "'all'"
dconf write /org/gnome/gnome-system-monitor/proctree/sort-col 15
