#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# https://github.com/pyenv/pyenv/wiki/Common-build-problems
my:step-begin "install dependencies"
my:toolbox-dnf-install \
    bzip2-devel \
    openssl-devel \
    readline-devel \
    sqlite-devel

my:step-begin "install"
my:asdf-add-plugin python
my:asdf-install-and-set-global python latest:3.10

export PIP_REQUIRE_VIRTUALENV=false

my:step-begin "update pip"
pip install --upgrade pip

my:step-begin "install ipython"
pip install --user ipython

my:step-begin "install virtual envs"
pip install --user pipenv
pip install --user virtualenv
