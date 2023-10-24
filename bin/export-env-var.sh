#!/bin/bash

echo "export-env-var.sh"

if [ -z "$DATA_APP_DIR" ]
then
    echo ""
    echo "YOU DON'T HAVE DATA_APP_DIR ENV VARIABLE SET UP. PLEASE RUN FOLLOWING"
    echo "export <path-to-your>/DATA-APP"
    echo "or add the above command to your .bashrc or .zshrc file"
    echo "exiting"
    exti 1
else
    echo ""
    echo "your DATA_APP_DIR IS SET TO: $DATA_APP_DIR" 
fi

export APP_DIR="$DATA_APP_DIR"
export DEV_ENV=.env

if [ -z "$DATA_APP_ENV" ]
then
    echo ""
    echo "YOU DON'T HAVE DATA_APP_ENV ENV VARIABLE SET UP."
    echo "By default DEV ENV will be set up to: $DEV_ENV"
    export ENV=$DEV_ENV
else
    echo ""
    echo "your DATA_APP_ENV IS SET TO: $DATA_APP_ENV" 
    export ENV=$DATA_APP_ENV
fi
