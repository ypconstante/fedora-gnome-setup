#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

find . -name "utility_*.sh" -print0 | my:run-files
