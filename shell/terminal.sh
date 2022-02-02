#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

./terminal_starship.sh
find . -name "terminal_*.sh" -print0 | my:run-files
