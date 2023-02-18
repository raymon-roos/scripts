#!/bin/bash

is_playing=$(cmus-remote -Q 2>&1 | head -1)

if [[ "$is_playing" == 'cmus-remote: cmus is not running' ]]; then
    /usr/local/bin/st -c 'cmus' -e cmus
else
    cmus-remote -u
fi
