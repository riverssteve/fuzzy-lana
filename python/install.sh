#!/usr/bin/env bash

pyenv_root="$HOME/.pyenv"

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
# shellcheck source=../utils.sh
source "${dirpath}/../utils.sh"

if [ ! -d "${pyenv_root}" ] ; then
    pinfo "Cloning pyenv into ${pyenv_root}"
    git clone https://github.com/pyenv/pyenv.git "${pyenv_root}"
fi
