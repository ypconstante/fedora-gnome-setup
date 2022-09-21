#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:asdf-add-plugin nodejs
my:asdf-install-and-set-global nodejs latest:16
my:asdf-install-and-set-global nodejs latest:18

my:step-begin "configure node"
my:append-to-file-if-not-contains "$NPM_CONFIG_USERCONFIG" 'engine-strict = true'
corepack enable

my:step-begin "install yarn"
my:asdf-add-plugin yarn
my:asdf-install-and-set-global yarn latest
