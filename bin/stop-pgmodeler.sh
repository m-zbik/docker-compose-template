#!/bin/bash

# run docker 
docker stop pgmodeler
docker container rm pgmodeler

killall -9 XQuartz

