#!/bin/sh

for volume in "${HOME}/go/" "${HOME}/.cache/"; do
    owner_user=`stat -c '%U' ${volume}`
    current_user=`whoami`

    if [ $owner_user != $current_user ]; then 
        echo "chown -R $(whoami) $volume"
        sudo chown -R $(whoami) $volume
    else
        echo "owner_user ($owner_user) == current_user ($current_user) in $volume"
    fi
done


go install github.com/hashicorp/terraform@v1.6.1 && \
go install github.com/go-task/task/v3/cmd/task@v3.31.0
