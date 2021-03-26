#!/usr/bin/env zsh

is_mac() {
    if [[ $(uname) == "Darwin" ]]; then
        return 0  # true
    else
        return 1  # false
    fi
}

is_ubuntu() {
    if [[ $(uname) == "Linux" ]] && [[ -n $(command -v apt-get) ]]; then
        return 0  # true
    else
        return 1  # false
    fi
}

