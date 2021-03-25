#!/usr/bin/env bash

set -euo pipefail

if ! command -v curl ; then
    if [[ $( uname ) == "Linux" ]] && [[ -n $( command -v apt-get ) ]] ; then
        sudo apt-get update && sudo apt-get install curl
    fi
fi

if ! command -v git ; then
    if [[ $( uname ) == "Linux" ]] && [[ -n $( command -v apt-get ) ]] ; then
        sudo apt-get update && sudo apt-get install git
    fi
fi

if [ ! -d "$HOME/.dotfiles" ] ; then
    echo "[Bootstrap] Cloning dotfiles"
    git clone --recursive https://github.com/riverssteve/dotfiles.git "$HOME/.dotfiles"
fi

# install homebrew
if ! command -v brew ; then
    echo "[Bootstrap] Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ ! -d $HOME/.config ]]; then
    echo "[Bootstrap] Creating $HOME/.config"
    mkdir -p "$HOME/.config"
fi

secrets="$HOME/.config/secrets"
if [[ ! -f "${secrets}" ]] ; then
    echo "[Bootstrap] Generating secrets directory and applying permissions"
    touch "${secrets}"
    chmod 600 "${secrets}"
fi

if [[ ! -d $HOME/.nvm ]] ; then
    echo "[Bootstrap] Downloading nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
fi

echo "[Bootstrap] Install a newer bash"
brew install bash


echo ""
printf "%s\n" "Remember to set up GPG keys for git usage"
printf "%s\n" "See https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data"
printf "%s\n" "Also remember that if installing Karibiner Elements that Jamf needs to be updated"
printf "%s\n" "to allow kernel extensions if this is a new device"

cd "$HOME/.dotfiles"
./install.sh
