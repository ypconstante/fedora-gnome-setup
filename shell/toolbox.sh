#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install toolbox"
my:dnf-install toolbox

TOOLBOX_CONTAINER="fedora-toolbox-$RELEASE_NUMBER"

if ! podman container exists "$TOOLBOX_CONTAINER"; then
    my:step-begin 'create container'
    toolbox create -y
fi

./toolbox_update.sh

my:step-begin "install toolbox container dependencies"
my:toolbox-dnf-install \
    glibc-langpack-en \
    '@Development Tools' \
    '@C Development Tools and Libraries'
