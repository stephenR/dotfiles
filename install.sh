#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
FILES="vimrc gdbinit zshrc tmux.conf"

for file in ${FILES}; do
  if [ -e ~/.${file} ]; then
    echo "ERROR: ~/.${file} already exists"
    exit 1
  fi
done

for file in ${FILES}; do
  ln -s ${DIR}/${file} ~/.${file}
done
