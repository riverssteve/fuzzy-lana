#!/usr/bin/env bash

set -euo pipefail

# Path to this script
dirpath="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
source "${dirpath}/../utils.sh"

extensions=(
    arcticicestudio.nord-visual-studio-code
    be5invis.toml
    cdonohue.quill-icons
    eamodio.gitlens
    EditorConfig.EditorConfig
    jolaleye.horizon-theme-vscode
    ms-azuretools.vscode-docker
    ms-python.python
    ms-vscode.Go
    timonwong.shellcheck
    tinkertrain.theme-panda
    vscodevim.vim
)

installed=()

if ! hash code ; then
    pfail "code executable missing: <ctrl-p> → shell command to install"
fi

while IFS=$'\n' read -r line ; do
    installed+=("$line")
done < <(code --list-extensions 2>/dev/null)

for ext in "${extensions[@]}"; do
    if grep -v -q "$ext" <<< "${installed[*]}" ; then
        pinfo "Installing extension $ext"
        code --install-extension "$ext"
    else
        pinfo "Extension $ext is already installed"
    fi
done

pinfo "Linking configuration"
ln -sfv "$PWD/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
