#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

# https://rpmfusion.org/Howto/Multimedia
my:step-begin "install vulkan"
my:dnf-install \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers.i686 \
    vulkan \
    vulkan-loader \
    vulkan-loader.i686 \
    vulkan-tools

my:step-begin "enable vaapi"
sudo dnf swap --allowerasing -y -q ffmpeg-free ffmpeg
sudo dnf swap -y -q mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap -y -q mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

my:dnf-install \
    gstreamer1-vaapi \
    libva \
    libva-utils \
    vdpauinfo

sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y -q

my:step-begin "install gpu viewer"
my:flatpak-install io.github.arunsivaramanneo.GPUViewer

