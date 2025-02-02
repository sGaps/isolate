#!/usr/bin/env bash

set -e

RUNTIME_PATH=$(realpath docker-compose.yml)
SCRIPT_FOLDER=$HOME/.local/bin
RUNTIME_CONFIG="$HOME/.isolated-gcc/config-directory"

mkdir -p $HOME/.isolated-gcc
echo $RUNTIME_PATH > $RUNTIME_CONFIG
echo "INFO: Configuration saved in $RUNTIME_CONFIG"

if [ -L $SCRIPT_FOLDER/isolate ]; then
    echo "INFO: command 'isolate' is already present in your system." >&2
else
    echo "INFO: creating command 'isolate'."

    mkdir -p $SCRIPT_FOLDER
    ln -s $(realpath run-isolate.sh) $SCRIPT_FOLDER/isolate
fi

echo
echo "INFO: Isolated gcc has been installed successfully."
echo "      You can invoke the program by writing 'isolate' in your terminal."

