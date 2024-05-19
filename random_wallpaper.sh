#!/bin/bash

exec bgs -z $(fd -tf '.' "$HOME/files/pictures/wallpapers/" | shuf -n 3)
