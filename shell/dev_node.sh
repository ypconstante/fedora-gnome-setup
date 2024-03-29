#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:asdf-add-plugin nodejs
my:asdf-install-and-set-global nodejs latest:20

my:step-begin "configure node"
my:append-to-file-if-not-contains "$NPM_CONFIG_USERCONFIG" 'engine-strict = true'
corepack enable
