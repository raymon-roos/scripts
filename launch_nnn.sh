#!/bin/bash

if [ -f "$XDG_CONFIG_HOME/nnn/nnn_config" ]; then
    source "$XDG_CONFIG_HOME/nnn/nnn_config"
fi

# Call the quitcd bash function 
n
