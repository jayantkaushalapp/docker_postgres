#!/bin/bash


docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker-compose down -v
docker-compose up -d redis postgres
docker exec -it postgresql_postgres_1  psql -U superset -d superset -f /docker-entrypoint-initdb.d/1-sql_dump.sql
docker-compose up -d superset
docker-compose exec superset superset-demo

#login into postgres console -- postgresql_postgres_1 is the name of your postgres container
#$ postgresql_postgres_1
#docker exec -it postgresql_postgres_1 bash

#psql -U superset -d superset

