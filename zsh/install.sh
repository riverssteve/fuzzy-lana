#!/usr/bin/env bash

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

if ! grep -q '/usr/local/bin/zsh' /etc/shells ; then
    pinfo "Adding zsh to /etc/shells"
    sudo sh -c 'echo "$(which zsh)" >> /etc/shells'
    sudo chsh -s "$(command -v zsh)" "$(whoami)"
fi


pinfo "Adding antibody bundles"
antibody bundle <"$DOTFILES/zsh/bundles.txt" >~/.zsh_plugins.sh
antibody update
