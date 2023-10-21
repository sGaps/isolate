#!/usr/bin/env bash

RUNTIME_CONFIG=$(realpath docker-compose.yml)

mkdir -p $HOME/.isolated-gcc
RUNTIME_POINTER="$HOME/.isolated-gcc/config-directory"
echo $RUNTIME_CONFIG > $RUNTIME_POINTER

echo "INFO: Configuration saved in $RUNTIME_POINTER"

if [ -L $HOME/.local/bin/isolate ]; then 
    echo "INFO: command 'isolate' is already present in your system." >&2
else
    echo "INFO: creating command 'isolate'."
    ln -s $(realpath run-isolate.sh) $HOME/.local/bin/isolate
fi

echo
echo "INFO: Isolated gcc has been installed successfully."
echo "      You can invoke the program by writing 'isolate' in your terminal."
