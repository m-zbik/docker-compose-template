#!/bin/bash

echo "remove-docker-images.sh"

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

echo ""
echo "-----CAUTION-----"
echo ""
echo "PLEASE READ BELOW:"
echo ""
echo "This setp will remove all your docker images."
echo "If you are not sure about cleaning your dockers"
echo "then select ==> no <=== and choose different make command"
echo ""
read -p "Do you want to proceed? (yes/no): " answer
echo "--------------------"
echo ""

case ${answer:0:1} in
    y|Y )
        echo "You chose YES. Performing action..."
        # remove all unused docekr images
        docker image prune -a -f
        # remove all images that are stopped and with INUSE status
        if [ -z $(docker images -q) ]
        then
            echo "no docker containers with status exited"
        else
            docker rmi -f $(docker images -q)
        fi
        # remove all containers that are stopped but hold with exited stauts
        if [ -z $(docker ps --filter status=exited -q) ]
        then
            echo "no docker containers with status exited"
        else
            docker rm $(docker ps --filter status=exited -q)
        fi
    ;;
    n|N )
        echo "You chose NO. Exiting..."
        # Perform action for 'no' here, or just exit
        exit 0
    ;;
    * )
        echo "Invalid response. Exiting..."
        exit 1
    ;;
esac

echo ""
echo "-----CAUTION-----"
echo ""
echo "PLEASE READ BELOW:"
echo ""
echo "This setp will remove all data from db-<name>."
echo "If you are not sure about cleaning all data for the database"
echo "then select ==> no <=== and choose different make command"
echo ""
read -p "Do you want to proceed? (yes/no): " answer
echo "--------------------"
echo ""

case ${answer:0:1} in
    y|Y )
        echo "You chose YES. Performing action..."
        # cleaning data folder
        if [ -d "$DATA_APP_DIR/db-app/data" ]
        then
            echo "cleaning direcotry: '$DATA_APP_DIR/db-app/data'"
            rm -rf "$DATA_APP_DIR/db-app/data"
            mkdir "$DATA_APP_DIR/db-app/data" 
        else
            echo "directory does not exist: '$DATA_APP_DIR/db-app/data'"
            echo "creating: '$DATA_APP_DIR/db-app/data'"
            mkdir "$DATA_APP_DIR/db-app/data"
        fi
        if [ -d "$DATA_APP_DIR/db-data/data" ]
        then
            echo "cleaning direcotry: '$DATA_APP_DIR/db-data/data'"
            rm -rf "$DATA_APP_DIR/db-data/data" 
            mkdir "$DATA_APP_DIR/db-data/data" 
        else
            echo "directory does not exist: '$DATA_APP_DIR/db-data/data'"
            echo "creating: '$DATA_APP_DIR/db-data/data'"
            mkdir "$DATA_APP_DIR/db-data/data" 
        fi
    ;;
    n|N )
        echo "You chose NO. Exiting..."
        # Perform action for 'no' here, or just exit
        exit 0
    ;;
    * )
        echo "Invalid response. Exiting..."
        exit 1
    ;;
esac


echo ""
echo "-----CAUTION-----"
echo ""
echo "PLEASE READ BELOW:"
echo ""
echo "This setp will remove all your docker volumes."
echo "If you are not sure about cleaning your docker volumes"
echo "then select ==> no <=== and choose different make command"
echo ""
read -p "Do you want to proceed? (yes/no): " answer
echo "--------------------"
echo ""

case ${answer:0:1} in
    y|Y )
        echo "You chose YES. Performing action..."
        # remove all unused docekr volumes 
        docker volume ls -q | xargs docker volume rm
    ;;
    n|N )
        echo "You chose NO. Exiting..."
        # Perform action for 'no' here, or just exit
        exit 0
    ;;
    * )
        echo "Invalid response. Exiting..."
        exit 1
    ;;
esac