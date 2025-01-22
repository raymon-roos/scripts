#!/bin/bash

monitor="$(xrandr | awk '/(\<connected\>)/ && !/eDP1/ {print $1}')"

if [[ "$(wc -l <<<"$monitor")" -eq 1 ]]; then
    exec xrandr --auto
fi

monitor="$(dmenu -c -g 1 <<<"$monitor")"

direction="$(cat <<EOF |
same-as
left-of
right-of
above
below
EOF
    dmenu -c -g 1)"

if [[ "$monitor" && "$direction" ]]; then
    xrandr --output 'eDP1' --primary --auto --output "$monitor" --auto "--$direction" 'eDP1'
fi
