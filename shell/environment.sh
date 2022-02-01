#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure environment variables"
my:link-file "$ASSETS_DIR/base--env" "$HOME/.profile"
