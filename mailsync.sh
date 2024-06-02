#!/usr/bin/bash

# First argument should be an isync channel (account) name, defaults to all channels

eval "$(keychain --dir "$XDG_STATE_HOME/keychain" --quiet --eval --agents 'gpg' 'secretray')"

if [ -z "$(pgrep mbsync)" ] && [ -z "$(pgrep notmuch)" ]; then
	(
		eval "$(keychain --dir "$XDG_STATE_HOME/keychain" --quiet --noask --eval --agents 'gpg' 'secretray')"
		mbsync -c "$XDG_CONFIG_HOME/isync/mbsyncrc" "${1:---all}" --quiet >/dev/null 2>&1
		notmuch new >/dev/null 2>&1
		exit
	) &
fi

[[ -z "$(pgrep neomutt)" ]] && exec neomutt
