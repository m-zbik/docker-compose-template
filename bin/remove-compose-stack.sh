#!/bin/bash

echo "remove-compose-stack.sh"

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

"$APP_DIR/bin/common-functions.sh"

# remove all images that are stopped and with INUSE status
docker rmi -f $(docker images -q)

# remove all containers that are stopped but hold with exited stauts
docker rm $(docker ps --filter status=exited -q)

docker compose \
    --file "$APP_DIR/docker-compose.yml" \
    --env-file "$APP_DIR/bin/$ENV" \
    down --volumes

