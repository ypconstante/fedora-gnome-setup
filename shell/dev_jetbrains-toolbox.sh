#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

install_dir=$XDG_DATA_HOME/JetBrains/Toolbox
installer_compressed_file=/tmp/jetbrains-toolbox.tar.gz
installer_dir=/tmp/jetbrains-toolbox

if [ -d "$install_dir" ]; then
    echo 'toolbox already installed, skipping'
    exit 0
fi

my:step-begin "download"
curl -L 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' -o "$installer_compressed_file"

my:step-begin "extract installer"
mkdir -p $installer_dir
tar -xzf $installer_compressed_file -C $installer_dir --strip-components=1

my:step-begin "configure"
my:copy-file "$ASSETS_DIR/dev_jetbrains-toolbox--settings.json" "$install_dir/.settings.json"

my:step-begin "install"
$installer_dir/jetbrains-toolbox

my:wait-file "$install_dir/bin/jetbrains-toolbox"
sleep 10

pkill jetbrains-toolb

my:step-begin "remove installer"
rm $installer_compressed_file
rm -r $installer_dir
