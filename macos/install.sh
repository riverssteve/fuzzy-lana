#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

# shellcheck disable=SC2086
cd "$(dirname ${0})"

if ! is_mac ; then
    exit
fi

defaults write com.apple.screencapture location ~/Downloads/
