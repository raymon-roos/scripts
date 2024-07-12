#!/bin/bash

dir="$(
	cat <<EOF | dmenu -c
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
	exec st -e bash -ic "n $HOME/$dir; exec bash"
fi
