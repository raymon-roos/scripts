#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

tags="$(cmus-remote -Q)"

artist="$(awk -F 'tag artist ' '/artist/ {printf $2}' <<<"$tags")"
title="$(awk -F 'tag title ' '/title/ {printf $2}' <<<"$tags")"

playing="$(awk -F 'status ' '/status/ {printf $2}' <<<"$tags")"
continue="$(awk -F 'set continue ' '/continue/ {print $2}' <<<"$tags")"

duration="$(awk -F 'duration ' '/duration/ {print $2}' <<<"$tags")"
position="$(awk -F 'position ' '/position/ {print $2}' <<<"$tags")"
remaining=$((duration - position + 5))

printf '\n%s\n\n' "$artist - $title"

file="$(fd -Fi --max-results 1 "$artist - $title" ~/files/music/lyrics/)"

if [[ -f "$file" && -r "$file" ]]; then
	echo 'local lyric file found'
	cat "$file"
else
	printf '%s\n' 'no local lyric file found - dowloading from genius.com'

	lyrics="$(php "$HOME/projects/personal/lyrical-php/src/index.php" --artist "$artist" --title "$title")"
	printf '%s\n' "$lyrics" | tee "$HOME/files/music/lyrics/$artist - $title.txt"
fi

if [[ "$playing" == "playing" && "$continue" == "true" ]]; then
	sleep "${remaining}s"
	exec lyrics_in_terminal.sh
fi
