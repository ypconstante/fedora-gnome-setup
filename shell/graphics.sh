#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "install vulkan"
my:dnf-install \
    mesa-vulkan-drivers \
    mesa-vulkan-drivers.i686 \
    vulkan \
    vulkan-loader \
    vulkan-loader.i686 \
    vulkan-tools

my:step-begin "enable vaapi"
my:dnf-install \
    ffmpeg \
    gstreamer1-vaapi \
    libva \
    libva-vdpau-driver \
    libva-utils \
    vdpauinfo

sudo dnf swap -y -q mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap -y -q mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

my:step-begin "install gpu viewer"
my:flatpak-install io.github.arunsivaramanneo.GPUViewer

INTEL_GPUS=$(lspci | grep -i VGA | grep -i Intel)
if [ -n "$INTEL_GPUS" ]; then
    my:step-begin "install and configure intel"
    my:dnf-install intel-media-driver
fi

NVIDIA_GPUS=$(lspci | grep -i VGA | grep -i NVIDIA)
if [ -n "$NVIDIA_GPUS" ]; then
    my:step-begin "install and configure nvidia"
    # https://rpmfusion.org/Howto/NVIDIA#Installing_the_drivers
    my:dnf-install \
        akmod-nvidia \
        xorg-x11-drv-nvidia-cuda \
        xorg-x11-drv-nvidia-cuda-libs \
        xorg-x11-drv-nvidia-libs \
        xorg-x11-drv-nvidia-libs.i686 \
        xorg-x11-drv-nvidia-power \
        nv-codec-headers \
        nvidia-vaapi-driver
    sudo systemctl enable nvidia-hibernate
    sudo systemctl enable nvidia-resume
    sudo systemctl enable nvidia-suspend
    sudo systemctl enable nvidia-powerd
fi
