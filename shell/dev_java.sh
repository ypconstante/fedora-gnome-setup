#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install"
my:asdf-add-plugin java
my:asdf-install-and-set-global java latest:temurin-8

my:step-begin "install maven"
my:asdf-add-plugin maven
my:asdf-install-and-set-global maven latest

my:step-begin "fish config"
my:link-file "$ASDF_DATA_DIR/plugins/java/set-java-home.fish" "$HOME/projects/personal/fish-local/conf.d/asdf-java.fish"
