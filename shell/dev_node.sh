#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure node"
my:append-to-file-if-not-contains "$NPM_CONFIG_USERCONFIG" 'engine-strict = true'
corepack enable
