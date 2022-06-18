#!/bin/bash

lsblk 

read -p "usb device: (the part after /dev/ in /dev/sdxy) " USBDevice

sudo mount -o gid=users,fmask=113,dmask=002 /dev/$USBDevice /mnt/usb/

# For easily mounting usb, allowing writing by regular users
