#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:asdf-add-plugin nodejs
my:asdf-install-and-set-global nodejs latest:14
my:asdf-install-and-set-global nodejs latest:16

my:step-begin "install yarn"
my:asdf-add-plugin yarn
my:asdf-install-and-set-global yarn latest
