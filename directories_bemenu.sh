#!/usr/bin/env bash

dir="$(
    cat <<EOF | bemenu -c -l 12
projects
projects/personal/scripts
.xdg/config
.xdg/config/nvim
.xdg/config/neomutt
.xdg/local
files
projects/bit-academy
files/finance/hledger
files/documents
files/downloads
scratch
files/zettelkasten
EOF
)"

if [[ -n "$dir" && -d "$HOME/$dir" ]]; then
    exec kitty -1 --hold --working-directory "$HOME/$dir" yazi
fi
