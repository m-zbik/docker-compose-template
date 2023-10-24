FROM nginx:latest
COPY nginx.conf /etc/nginx/nginx.conf
COPY replace-str-in-file.sh /etc/nginx/replace-str-in-file.sh

ARG MS_AUTH_NAME_ARG
ARG DOCKER_EXPOSE_PORT_ARG
ARG UI_NAME_ARG
ARG UI_PORT_ARG
ARG PROXY_AUTH_UI_PORT_ARG

RUN /etc/nginx/replace-str-in-file.sh  "__MS_AUTH_NAME__"       $MS_AUTH_NAME_ARG           /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__DOCKER_EXPOSE_PORT__" $DOCKER_EXPOSE_PORT_ARG     /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__UI_NAME__"            $UI_NAME_ARG                /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__UI_PORT__"            $UI_PORT_ARG                /etc/nginx/nginx.conf 
RUN /etc/nginx/replace-str-in-file.sh  "__PROXY_AUTH_UI_PORT__" $PROXY_AUTH_UI_PORT_ARG     /etc/nginx/nginx.conf 
