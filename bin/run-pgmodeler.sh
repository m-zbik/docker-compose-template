#!/bin/bash


## more info can be found here:
# https://gist.github.com/yuryalencar/a6c65a1a0a01cbb90e98e66d13072efc
# https://yuryalencar.medium.com/pgmodeler-docker-1e78a1cd1350
# https://hub.docker.com/r/apazga/docker-pgmodeler
# https://github.com/apazga/docker-pgmodeler/tree/master
##



# run following to have: access control disabled, clients can connect from any host
xhost +
# load docker from local if exists
#if [ -f $DATA_APP_DIR/db-app/init/init-db.sh ]
#then
#    ./load-pgmodeler-img.sh
#fi

# start xquartx
# open -a XQuartz

# run docker 
docker run -tid -e DISPLAY=$(ipconfig getifaddr en0):0 -v "$DATA_APP_DIR/pgmodeler/data":/data --name pgmodeler apazga/docker-pgmodeler

