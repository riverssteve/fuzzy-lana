#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/utils.sh"

cd "$(dirname ${0})"

export DOTFILES=$(pwd)
export ICLOUD_CONFIG=~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Config

shopt -s globstar nullglob
pinfo "Creating symlinks"
for file in "${DOTFILES}"/**/*.symlink
do
    # %.* removes all characters including and after the dot
    ln -sfv "${file}" "$HOME/.$(basename "${file%.*}")"
done

if [[ $( is_mac ) ]] ; then
    pinfo "Installing homebrew bundle"
    brew bundle install
fi

find "${DOTFILES}" -name 'install.sh' -mindepth 2 -print0 | while read -d $'\0' file; do
    pinfo "Running installer ${file}"
    bash -eu -o pipefail "${file}"
done
