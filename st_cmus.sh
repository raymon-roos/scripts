#!/bin/bash

is_playing=$(cmus-remote -Q 2>&1 | head -1)

if [[ "$is_playing" == 'cmus-remote: cmus is not running' ]]; then
	exec st -c 'cmus' -e cmus
else
	exec cmus-remote -u
fi
