#!/bin/bash

echo "load-local-img.sh"

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
## save image to tar
#docker save apazga/docker-pgmodeler > pgmodeler-img-1-1-0-alpha.tar

## load image from tar

LOCAL_IMG_DIR=$DATA_APP_DIR/bin/local-images

if [ -d "$LOCAL_IMG_DIR" ]
then
    echo "loading image from local"
    for file in "$LOCAL_IMG_DIR"/*.tar; do
        echo $file
        docker load --input "$file" 
    done
else
    echo ""
    echo "YOU DON'T HAVE LOCAL_IMG_DIR SET UP."
    echo "this dir is added to .gitignore so you need to create it manually"
    echo "the assumption is to have local-image dir in order to to stora images as <image-name>.tar file" 
    echo "and load it from local dir instead of downloading every time from internet" 
    echo "skipping this step"
    echo ""
fi


