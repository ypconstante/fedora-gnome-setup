#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

# https://idroot.us/install-mesa-drivers-fedora-42/
my:step-begin "install vulkan"
my:dnf-install \
    mesa-libGL \
    mesa-libGL.i686 \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers.i686 \
    vulkan-loader \
    vulkan-loader.i686 \
    vulkan-tools

# https://rpmfusion.org/Howto/Multimedia
my:step-begin "rpmfusion multimedia setup"
sudo dnf swap --allowerasing -y -q ffmpeg-free ffmpeg
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y -q
my:dnf-install \
    mesa-va-drivers \
    mesa-va-drivers.i686 \
    mesa-vdpau-drivers \
    mesa-vdpau-drivers.i686

my:step-begin "install gpu viewer"
my:flatpak-install io.github.arunsivaramanneo.GPUViewer

my:step-begin "enable vaapi"
# https://fedoraproject.org/wiki/Firefox_Hardware_acceleration
my:dnf-install \
    libavcodec-freeworld \
    libva-utils

my:dnf-install gstreamer1-vaapi
