#!/usr/bin/env bash

DIR="data"
echo "DB SETUP START"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER opam PASSWORD '12345';
	CREATE DATABASE gtopdb;
	GRANT ALL PRIVILEGES ON DATABASE gtopdb TO opam;
EOSQL

PGPASSWORD="12345"
PSQL="psql gtopdb -U opam"

$PSQL < $DIR/gtopdb.sql
echo "DB SETUP DONE"
