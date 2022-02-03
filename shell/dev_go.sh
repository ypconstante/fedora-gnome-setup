#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:asdf-add-plugin golang
my:asdf-install-and-set-global golang latest
