#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install podman and docker-compose"
my:dnf-install \
    podman \
    podman-docker \
    podman-compose

my:step-begin "enable podman with docker-compose"
systemctl --user enable podman.socket

my:step-begin "fish config"
podman completion fish \
    -f "$HOME/projects/personal/fish-local/completions/docker-compose.fish"
