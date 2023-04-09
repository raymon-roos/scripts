#!/bin/bash

# Temporarily remember ssh key passphrase
eval "$(ssh-agent -s)" && ssh-add -t 2m

find . -name .git -execdir git fetch --all ';' &&
find . -name .git -execdir git branch -vva ';' ;

SSH_AGENT_PID="$(pidof ssh-agent)" ssh-agent -k
