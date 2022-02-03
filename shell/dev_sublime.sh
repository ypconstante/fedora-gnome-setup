#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

sublime_config_dir=$XDG_CONFIG_HOME/sublime-text-3
preferences_file="$sublime_config_dir/Packages/User/Preferences.sublime-settings"
package_control_file="$sublime_config_dir/Installed Packages/Package Control.sublime-package"
package_control_config_file="$sublime_config_dir/Packages/User/Package Control.sublime-settings"
sublime_linter_config_file="$sublime_config_dir/Packages/User/SublimeLinter.sublime-settings"

my:step-begin "add repository"
my:dnf-add-key https://download.sublimetext.com/sublimehq-rpm-pub.gpg
my:dnf-add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

my:step-begin "install sublime text"
my:dnf-install sublime-text
my:link-file "$ASSETS_DIR/dev_sublime--preferences.sublime-settings" "$preferences_file"

my:step-begin "install package control"
mkdir -p "$(dirname "$package_control_file")"
curl -sSL "https://packagecontrol.io/Package%20Control.sublime-package" -o "$package_control_file"

mkdir -p "$(dirname "$package_control_config_file")"
my:link-file "$ASSETS_DIR/dev_sublime--package-control.sublime-settings" "$package_control_config_file"

my:step-begin "configure packages"
my:link-file "$ASSETS_DIR/dev_sublime--sublimelinter.sublime-settings" "$sublime_linter_config_file"

my:step-begin "install sublime merge"
my:dnf-install sublime-merge
