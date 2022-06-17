#!/bin/bash

bgMain=$(find /home/ray/files/pictures/wallpapers/1920x1080/ -type f | shuf -n 1)
bgLeft=$(find /home/ray/files/pictures/wallpapers/1280x1024/ -type f | shuf -n 1)
bgRight=$(find /home/ray/files/pictures/wallpapers/1280x1024/ -type f | shuf -n 1)

# set a random background with bgs
/usr/local/bin/bgs $bgLeft $bgMain $bgRight &
