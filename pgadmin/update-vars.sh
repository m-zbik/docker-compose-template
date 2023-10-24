#!/bin/bash

/pgadmin4/replace-str-in-file.sh "__DB_APP_NAME__" "$DB_APP_NAME_ARG"  /pgadmin4/servers.json
/pgadmin4/replace-str-in-file.sh "__DB_APP_PASS__" "$DB_APP_PASS_ARG"  /pgadmin4/servers.json
/pgadmin4/replace-str-in-file.sh "__DB_DATA_NAME__" "$DB_DATA_NAME_ARG"  /pgadmin4/servers.json
/pgadmin4/replace-str-in-file.sh "__DB_DATA_PASS__" "$DB_DATA_PASS_ARG"  /pgadmin4/servers.json