#!/bin/bash

docker-compose up -d redis postgres

docker-compose up -d superset

docker-compose exec superset superset-demo

docker exec -it postgresql_postgres_1 bash
