
---

# DATA_APP 

Basic template for multi service app defined in a docker compose


# PREREQUISITE
- create env variable on your machine:
```export DATA_APP_DIR=<path-to-data-app>```

- On your machine you need to have:
-- installed docker and docker compose
-- make

----

# STRUCTURE
This repository is set of services communicating within the docker composer environment.

Each service contains README.md file with more details on the service.

docker-composer.yml
- contains definition of all the services and is used to run all services in one environment

Makefile
- contains a set of commands used to build, start and clean all the services

bin folder:
- .env file with env variables used in docker composer and supporting scripts
- contains set of scripts supporting the build, clean and start of all the services

data-app.drawio
- contains simplified (high level) architecture and connection between all the services

----

# HOW TO
d
## START and STOP all services with docker compose
being in the root directory of the DATA-APP run following command:

```make run``` 

    this command will trigger:

    - show-compose-yaml (print out the docker-compose.yml file with all the values from .env file) 
    - stop-all (stops all the services defined in docker-compose.yml) 
    - build-all (build all the images)
    - run-all (run all the containers)

```make run-clean```

    CAUTION: this command is DELETING ALL your services defined in docker compose AND all docker images on your system
    
    this command will trigger:

    - show-compose-yaml (print out the docker-compose.yml file with all the values from .env file) 
    - delete-all (look a the definition of make delete-all below; in short it removes all the dockers from your system)
    - build-all (build all the images)
    - run-all (run all the containers)

```make stop```

    this command will trigger:

    - show-compose-yaml (print out the docker-compose.yml file with all the values from .env file) 
    - stop-all (stops all the services defined in docker-compose.yml) 


```make delete-all```

    CAUTION: this command is DELETING ALL your services defined in docker compose AND all docker images on your system
    
    this command will trigger:

    - show-compose-yaml (print out the docker-compose.yml file with all the values from .env file) 
    - stop-all (stops all the services defined in docker-compose.yml) 
    - remove-compose-stack (remove all images that are stopped and with INUSE status; remove all containers that are stopped but hold with exited status; docker compose down with all volumes included)
    - removing and recreating data folder in db-<name> to clean all the data
    - remove-all (docker compose rm)
    - remove-docker-images(prunes all docker images)



---
# ISSUES
## DATABASE
### db not starting in logs: docker-entrypoint-initdb.d bad interpreter: Permission denied
make sure that init-db.sh file is executable
```chmod +x init-db.sh```

### not being able to connect to db from pgadmin: role not exists
clean up your data folder in the db-<name> in your project 
```rm -rf db-<db-name>/data```
```mkdir db-<db-name>/data```

---