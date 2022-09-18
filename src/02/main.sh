#!/bin/bash

./help.sh

read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY]|[yY])
        ./help.sh > $(date +"%d_%m_%y_%H_%M_%S.status")
        ;;
    *)
        exit
        ;;
esac

