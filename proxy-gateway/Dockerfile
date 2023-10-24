FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY replace-str-in-file.sh /etc/nginx/replace-str-in-file.sh

ARG MS_AUTH_NAME_ARG
ARG DOCKER_EXPOSE_PORT_ARG
ARG PROXY_GATEWAY_PORT_ARG

RUN /etc/nginx/replace-str-in-file.sh  "__MS_AUTH_NAME__"           $MS_AUTH_NAME_ARG           /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__DOCKER_EXPOSE_PORT__"     $DOCKER_EXPOSE_PORT_ARG     /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__PROXY_GATEWAY_PORT__"     $PROXY_GATEWAY_PORT_ARG     /etc/nginx/nginx.conf 

WORKDIR /src/main

