#!/bin/bash -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

dotfiles="bash_aliases ctags gitconfig gitignore tmux.conf"

for f in ${dotfiles}; do
    rm -rf ~/.$f
    ln -s ${script_dir}/$f ~/.$f
done
