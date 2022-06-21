#!/bin/bash

# Select a random picture to use as wallpaper
wp=$(find "$HOME"/files/pictures/wallpapers/ -type f | shuf -n 1)

# Feed image to bgs
/usr/local/bin/bgs $wp &
