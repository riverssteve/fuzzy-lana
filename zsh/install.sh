#!/usr/bin/env bash

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

if is_mac ; then
    if ! grep -q '/usr/local/bin/zsh' /etc/shells ; then
        pinfo "Adding zsh to /etc/shells"
        sudo sh -c 'echo "$(which zsh)" >> /etc/shells'
        sudo chsh -s "$(command -v zsh)" "$(whoami)"
    fi
fi

if [ ! -d "$HOME/.config/zsh/functions" ] ; then
    pinfo "Creating custom zsh functions directory"
    mkdir -p "$HOME/.config/zsh/functions"
fi

test -d "$HOME/.zplug" || {
    pinfo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

hash starship || {
    curl -fsSL https://starship.rs/install.sh | bash
}
