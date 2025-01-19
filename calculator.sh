#!/usr/bin/env bash

set -o errexit
set -o pipefail

# Use bemenu as a text input by piping in empty list.
input="$(echo '' | bemenu --list 1)"
# Calc outputs results with leading whitespace.
# Piping into xargs trims surounding whitespace.
calc "$input" | xargs | bemenu | wl-copy
# Display result back in bemenu.
# Selecting the result copies to system clipboard.
