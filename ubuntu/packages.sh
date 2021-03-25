#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

# shellcheck disable=SC2086
cd "$(dirname ${0})"

pinfo "Installing packages"

apt_packages=(
    tmux
)

sudo snap install --beta nvim --classic

sudo apt-get update && sudo apt-get install "${apt_packages[@]}"
