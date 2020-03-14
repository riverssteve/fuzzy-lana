#!/usr/bin/env bash

set -euo pipefail

version="v0.2.0"
nord_dircolors="https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/${version}/src/dir_colors"
nord_theme="https://raw.githubusercontent.com/arcticicestudio/nord-iterm2/${version}/src/xml/Nord.itermcolors"

iterm_data_path="${HOME}/.config/iterm/data"


download() {
  local target=$1 path=$2 filename=$3
  if ! [[ -d ${path} ]] ; then
    echo "!! Error: Bad path for file download"
    exit 1
  fi
  if ! [[ -f "${path}/${filename}" ]] ; then
    echo "-- Downloading ${filename}"
    curl "${target}" >> "${path}/${filename}" 2>/dev/null
  fi
}

mkdir -p "${iterm_data_path}"
download "${nord_dircolors}" "${iterm_data_path}" "nord.dircolors"
download "${nord_theme}" "${iterm_data_path}" "Nord.itermcolors"

if ! [[ -f $HOME/.dircolors ]] ; then
  echo "-- Moving Nord dircolors"
  cp "${iterm_data_path}/nord.dircolors" "$HOME/.dircolors"
else
  echo "!! Refusing to overwrite exisiting dircolors file"
fi

if [[ -f "${iterm_data_path}/Nord.itermcolors" ]] ; then
  echo "-- Run the following to import the theme into iterm"
  echo "   $ open ${iterm_data_path}/Nord.itermcolors"
fi
