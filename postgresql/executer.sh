#!/bin/bash


docker-compose up -d redis postgres

docker-compose up -d superset

docker-compose exec superset superset-demo

#import the db dump exported during postgres run. use environment variables instead of superset.

docker exec -it postgresql_postgres_1  psql -U superset -d superset -f /docker-entrypoint-initdb.d/sql_dump.sql

#login into postgres console -- postgresql_postgres_1 is the name of your postgres container
#docker exec -it postgresql_postgres_1 bash

#psql -U superset -d superset

