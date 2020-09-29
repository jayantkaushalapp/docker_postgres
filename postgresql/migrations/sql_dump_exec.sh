#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE yantram_db_custom;
    GRANT ALL PRIVILEGES ON DATABASE yantram_db_custom TO docker;
    CREATE DATABASE yantram_db_custom_test;
    GRANT ALL PRIVILEGES ON DATABASE yantram_db_custom_test TO docker;
EOSQL