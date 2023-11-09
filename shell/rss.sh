#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install newsflash"
my:flatpak-install io.gitlab.news_flash.NewsFlash
