FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY replace-str-in-file.sh /etc/nginx/replace-str-in-file.sh

ARG MS_UI_NAME_ARG
ARG DOCKER_EXPOSE_PORT_ARG
ARG UI_PORT_ARG

RUN /etc/nginx/replace-str-in-file.sh  "__MS_UI_NAME__"         $MS_UI_NAME_ARG             /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__DOCKER_EXPOSE_PORT__" $DOCKER_EXPOSE_PORT_ARG     /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__UI_PORT__"            $UI_PORT_ARG                /etc/nginx/nginx.conf 

WORKDIR /src/main

