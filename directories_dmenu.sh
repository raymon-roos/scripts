#!/bin/bash

dir="$(
	cat <<EOF | dmenu -c
projects
projects/scripts
projects/suckless
.xdg/config
.xdg/config/nvim
.xdg/config/neomutt
.xdg/local
files
files/bit-academy
files/documents
files/downloads
files/zettelkasten
EOF
)"

if [[ -n "$dir" && -d "$HOME/$dir" ]]; then
	exec st -e bash -ic "n $HOME/$dir; exec bash"
fi
