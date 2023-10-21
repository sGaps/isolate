#!/usr/bin/env bash

set -e

# TODO: Improve the command options later.

# Script's parameter resolution
target=$1
if [ -z $target ]; then
    echo "Usage:" >&2
    echo "    run-isolate [FILE]" >&2
    echo "Description:" >&2
    echo "    Command that lets you run gcc and gdb into an isolated environment with capped results" >&2
    exit 1
fi

target=$(realpath $target)
base=$(basename $target)


# Runtime information and environment
mkdir -p $HOME/.isolated-gcc
RUNTIME_POINTER="$HOME/.isolated-gcc/config-directory"
touch $RUNTIME_POINTER
RUNTIME_CONFIG=$(< $RUNTIME_POINTER)

if [ -z $RUNTIME_CONFIG ]; then
    echo "ERROR: runtime config not specified, please configure it by setting" >&2
    echo "       absolute path of isolated-gcc inside the file: \`$RUNTIME_POINTER\`" >&2
    exit 1
fi


# Real automated task
exec docker compose -f "$RUNTIME_CONFIG" run \
    -it \
    --volume $target:/mnt/external/$base \
    --name=isolated-gcc \
    --rm compiler
