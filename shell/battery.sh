#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/_base.sh"

my:step-begin "configure upower"
sudo sed -Ei 's/^(PercentageCritical)=.*$/\1=10/' /etc/UPower/UPower.conf
sudo sed -Ei 's/^(PercentageAction)=.*$/\1=5/' /etc/UPower/UPower.conf
