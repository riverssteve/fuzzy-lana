#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

nvim_config="${HOME}/.config/nvim"

pinfo "Setting up neovim"
if [[ ! -d "${nvim_config}" ]] ; then
    mkdir -pv "${nvim_config}"
fi
ln -sfv "$PWD/neovim/init.vim" "$HOME/.config/nvim/init.vim"
