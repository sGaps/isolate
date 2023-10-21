#!/usr/bin/env bash

term=$1

if [ $term = "--copy-from-external" ]; then
    echo "INFO: Transfering unsafe files from /mnt/external to test environment /mnt/isolated" >&2
    cp -r /mnt/external/. /mnt/isolated/
    echo "INFO: Starting interactive session (workdir /mnt/isolated)" >&2
fi

exec zsh
