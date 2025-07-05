#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

./dev_mise.sh
find . -name "dev_*.sh" -print0 | my:run-files
