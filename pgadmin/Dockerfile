FROM alpine:latest 

RUN mkdir /pgadmin4

COPY ./replace-str-in-file.sh /pgadmin4/replace-str-in-file.sh
COPY ./servers.json /pgadmin4/servers.json
COPY ./update-vars.sh /pgadmin4/update-vars.sh

ARG DB_APP_NAME_ARG     
ARG DB_APP_PASS_ARG
ARG DB_APP_USER_ARG
ARG DB_APP_DB_ARG
ARG DB_DATA_NAME_ARG     
ARG DB_DATA_PASS_ARG
ARG DB_DATA_USER_ARG
ARG DB_DATA_DB_ARG
ARG DOCKER_POSTGRES_EXPOSE_PORT_ARG

RUN sh /pgadmin4/replace-str-in-file.sh "__DB_APP_NAME__" "$DB_APP_NAME_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_APP_USER__" "$DB_APP_USER_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_APP_DB__" "$DB_APP_DB_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_APP_PASS__" "$DB_APP_PASS_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_DATA_NAME__" "$DB_DATA_NAME_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_DATA_USER__" "$DB_DATA_USER_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_DATA_DB__" "$DB_DATA_DB_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DB_DATA_PASS__" "$DB_DATA_PASS_ARG"  /pgadmin4/servers.json
RUN sh /pgadmin4/replace-str-in-file.sh "__DOCKER_POSTGRES_EXPOSE_PORT__" "$DOCKER_POSTGRES_EXPOSE_PORT_ARG"  /pgadmin4/servers.json


FROM dpage/pgadmin4:latest
COPY --from=0 /pgadmin4/servers.json /pgadmin4/servers.json
