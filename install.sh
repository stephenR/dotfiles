#!/bin/bash

FILES="vimrc gdbinit zshrc tmux.conf"

for file in ${FILES}; do
  if [ -e ~/.${file} ]; then
    echo "ERROR: ~/.${file} already exists"
    exit 1
  fi
done

for file in ${FILES}; do
  ln -s ${file} ~/.${file}
done