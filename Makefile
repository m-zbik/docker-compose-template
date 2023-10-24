default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

run: show-compose-yaml stop-all load-local-docker-images build-all run-all # first stops all services and the build and run all services 
	
run-clean: show-compose-yaml delete-all build-all load-local-docker-images run-all # delete all and then build and run 

stop: show-compose-yaml stop-all # stops all the services
	
delete-all: show-compose-yaml stop-all remove-compose-stack remove-all remove-docker-images # stops all services and then remove compose staks and removes all services and images

show-compose-yaml: # shows the compose.yaml with all variables 
	./bin/show-compose-yaml.sh	

build-all: # build all the services
	./bin/build-all-services.sh	

run-all: # run all the sercices
	./bin/run-all-services.sh	

stop-all: # stops all the services
	./bin/stop-all-services.sh	

remove-all: # removes all the services
	./bin/remove-all-services.sh	

remove-compose-stack: # removes all the services from the composer stack
	./bin/remove-compose-stack.sh	

remove-docker-images: # removes all the dockr images
	./bin/remove-docker-images.sh	

pgmodeler-run: # run / start pg modleler
	./bin/run-pgmodeler.sh	

pgmodeler-stop: # stops pg modeler
	./bin/stop-pgmodeler.sh	

load-local-docker-images: # load images from local dir if exists
	./bin/load-local-img.sh