#!/bin/bash

echo "common-functinos.sh"

if [ -z "$DATA_APP_DIR" ]
then
    echo "YOU DON'T HAVE DATA_APP_DIR ENV VARIABLE SET UP. PLEASE RUN FOLLOWING"
    echo "export <path-to-your>/DATA-APP"
    echo "or add the above command to your .bashrc or .zshrc file"
    echo "exiting"
    exti 1
else
    echo "your DATA_APP_DIR IS SET TO: $DATA_APP_DIR" 
fi
source "$DATA_APP_DIR/bin/export-env-var.sh"

