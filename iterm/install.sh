#!/usr/bin/env bash

set -euo pipefail

version="v0.2.0"
nord_dircolors="https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/${version}/src/dir_colors"
nord_theme="https://raw.githubusercontent.com/arcticicestudio/nord-iterm2/${version}/src/xml/Nord.itermcolors"

iterm_data_path="${HOME}/.config/iterm/data"

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

download() {
  local target=$1 path=$2 filename=$3
  if ! [[ -d ${path} ]] ; then
    fail "Bad path for file download"
    exit 1
  fi
  if ! [[ -f "${path}/${filename}" ]] ; then
    pinfo "Downloading ${filename}"
    curl "${target}" >> "${path}/${filename}" 2>/dev/null
  fi
}

mkdir -p "${iterm_data_path}"
download "${nord_dircolors}" "${iterm_data_path}" "nord.dircolors"
download "${nord_theme}" "${iterm_data_path}" "Nord.itermcolors"

if ! [[ -f $HOME/.dircolors ]] ; then
  pinfo "Linking Nord dircolors"
  ln -sfv "${iterm_data_path}/nord.dircolors" "$HOME/.dircolors"
else
  pwarn "Refusing to overwrite exisiting dircolors file"
fi

if [[ -f "${iterm_data_path}/Nord.itermcolors" ]] ; then
  pinfo "Run the following to import the theme into iterm: \"open ${iterm_data_path}/Nord.itermcolors\""
fi
