#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

pinfo "Installing spacevim"
curl -sLf https://spacevim.org/install.sh | bash

pinfo "Linking SpaceVim init.toml"
if [ -d ~/.SpaceVim.d ] ; then
    ln -sfv "$PWD/neovim/init.toml" "$HOME/.SpaceVim.d/init.toml"
fi


