#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/utils.sh"

cd "$(dirname ${0})"

export DOTFILES=$(pwd)
export ICLOUD_CONFIG=~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Config

shopt -s globstar nullglob
# echo -e "\\n› Creating symlinks"
# printf "\n%s\n" "- Creating symlinks"
pinfo "Creating symlinks"
for file in "${DOTFILES}"/**/*.symlink
do
    # %.* removes all characters including and after the dot
    ln -sfv "${file}" "$HOME/.$(basename "${file%.*}")"
done

# echo -e "\\n> Installing Bundle"
# brew bundle install

find "${DOTFILES}" -name 'install.sh' -mindepth 2 -print0 | while read -d $'\0' file; do
  pinfo "Running installer ${file}"
  bash -eu -o pipefail "${file}"
done