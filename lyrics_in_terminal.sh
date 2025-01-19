#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

tags="$(cmus-remote -Q)"

artist="$(awk -F 'tag artist ' '/artist/ {printf $2}' <<<"$tags")"
artist=${artist:-"$(awk -F 'tag albumartist ' '/albumartist/ {printf $2}' <<<"$tags")"}
title="$(awk -F 'tag title ' '/title/ {printf $2}' <<<"$tags")"
genre="$(awk -F 'tag genre  ' '/genre/ {printf tolower($2)}' <<<"$tags")"

if [[ "$genre" =~ instrumental|ambient ]]; then
    printf '%s\n' 'instrumental track'
    exit 0
fi

playing="$(awk -F 'status ' '/status/ {printf $2}' <<<"$tags")"
continue="$(awk -F 'set continue ' '/continue/ {print $2}' <<<"$tags")"

duration="$(awk -F 'duration ' '/duration/ {print $2}' <<<"$tags")"
position="$(awk -F 'position ' '/position/ {print $2}' <<<"$tags")"
remaining=$((duration - position + 3))

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
