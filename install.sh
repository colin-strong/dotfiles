#!/bin/bash

FILES=*

for file in $FILES
do
    if [ "$file" == "${0##*/}" ] ; 
        then continue;
    fi
    rm ~/.$file
    ln -sv $PWD/$file ~/.$file
done

# Reload bash
exec "$BASH"
