#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install dependencies"
my:toolbox-dnf-install \
    ncurses-devel \
    openssl-devel \
    wxGTK3-devel

my:dnf-install \
    wxGTK3 \
    wxGTK3-gl \
    wxGTK3-webview

my:step-begin "install erlang"
my:asdf-add-plugin erlang
my:asdf-install-and-set-global erlang latest:24

my:step-begin "install elixir"
my:asdf-add-plugin elixir
my:asdf-install-and-set-global elixir "$(asdf list-all elixir 1.12 | grep otp-24 | grep -v rc | tail -1)"
