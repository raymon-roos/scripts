#!/bin/bash

# Select some random pictures to use as wallpapers
bgMain=$(find "$HOME"/files/pictures/wallpapers/1920x1080/ -type f | shuf -n 1)
bgLeft=$(find "$HOME"/files/pictures/wallpapers/1280x1024/ -type f | shuf -n 1)
bgRight=$(find "$HOME"/files/pictures/wallpapers/1280x1024/ -type f | shuf -n 1)

# Feed images to bgs
/usr/local/bin/bgs "$bgLeft" "$bgMain" "$bgRight" &
