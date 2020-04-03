#!/usr/bin/env bash

if ! [[ $(uname -a) != "darwin" ]] ; then
  exit
fi

defaults write com.apple.screencapture location ~/Downloads/
