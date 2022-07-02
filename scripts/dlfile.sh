#!/bin/sh
# Provides the ability to download a file by dropping it into a window

url=$(dragon-drop -t -x)

if [ -n "$url" ]; then
    printf "File Name: "
    name=""
    while [ -z $name ] || [ -e $name ]
    do
        read -r name
        if [ -e "$name" ]; then
            printf "File already exists, overwrite (y|n): "
            read -r ans

            if [ "$ans" = "y" ]; then
                break
            else
                printf "File Name: "
            fi
        fi
    done

    # Download the file with curl
    [ -n "$name" ] && curl -o "$name" "$url" || exit 1
else
    exit 1
fi
