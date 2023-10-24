#!/bin/bash

echo "build-all-services.sh"

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

# before building make sure init-db.sh is executable
if [ -f "$DATA_APP_DIR/db-app/init/init-db.sh" ]
then
    echo "running chmod +x on : $DATA_APP_DIR/db-app/init/init-db.sh"
    chmod +x $DATA_APP_DIR/db-app/init/init-db.sh 
else
    echo "init-db.sh does not exist: $DATA_APP_DIR/db-app/init/init-db.sh"
fi
if [ -f "$DATA_APP_DIR/db-data/init/init-db.sh" ]
then
    echo "running chmod +x on : $DATA_APP_DIR/db-data/init/init-db.sh"
    chmod +x "$DATA_APP_DIR/db-data/init/init-db.sh"
else
    echo "init-db.sh does not exist: $DATA_APP_DIR/db-data/init/init-db.sh"
fi

docker compose \
    --file "$APP_DIR/docker-compose.yml" \
    --env-file "$APP_DIR/bin/$ENV" \
    build \
    --no-cache

