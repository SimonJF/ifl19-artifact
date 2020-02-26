#!/bin/bash

DIR="/data"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER gtopdb PASSWORD 'gtopdb';
	CREATE DATABASE gtopdb;
	GRANT ALL PRIVILEGES ON DATABASE gtopdb TO gtopdb;
EOSQL

PGPASSWORD="gtopdb"
PSQL="psql gtopdb -U gtopdb"

$PSQL < $DIR/gtopdb.sql
