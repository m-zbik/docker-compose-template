#!/bin/bash

replace(){
    ORG=$(makeSlashRegexReady "$1")
    REPLACEMENT=$(makeSlashRegexReady "$2")
    FILE=$3
    sed -i s/$ORG/$REPLACEMENT/ $FILE
}

makeSlashRegexReady(){
    echo "$1" | sed -r 's/\//\\\//g'
}

replace "$1" "$2" "$3"
