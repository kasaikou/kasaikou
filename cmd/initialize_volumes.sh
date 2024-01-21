#!/bin/sh

for volume in "${HOME}/go/" "${HOME}/.cache/" "${HOME}/.config/pypoetry/"; do
    owner_user=`stat -c '%U' ${volume}`
    current_user=`whoami`

    if [ "$owner_user" != "$current_user" ]; then 
        echo "chown -R $(whoami) $volume"
        sudo chown -R $(whoami) $volume
    else
        echo "owner_user ($owner_user) == current_user ($current_user) in $volume"
    fi
done
