#!/usr/bin/env bash

set -euo pipefail

if ! hash brew 2>/dev/null ; then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! hash antibody 2>/dev/null ; then
  echo "Installing antibody..."
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
fi

if [[ ! -d $HOME/.config ]]; then
  echo "Creating $HOME/.config"
  mkdir -p "$HOME/.config"
fi

secrets="$HOME/.config/secrets"
if [[ ! -f "${secrets}" ]] ; then
  echo "Generating secrets directory and applying permissions"
  touch $secrets
  chmod 600 "${secrets}"
fi

if [[ ! -d $HOME/.nvm ]] ; then
  echo "Downloading nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
fi

brew install vim bash zsh git pyenv tree ag fzf prettyping gnupg pinentry-mac jq tidy-html5

echo ""
printf "%s\n" "Remember to set up GPG keys for git usage"
printf "%s\n" "See https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data"
printf "%s\n" "Also remember that if installing Karibiner Elements that Jamf needs to be updated"
printf "%s\n" "to allow kernel extensions if this is a new device"
