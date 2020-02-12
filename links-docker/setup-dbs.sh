#!/usr/bin/env bash
unzip gtopdb-dump.zip
createdb gtopdb
psql -d gtopdb < public_iuphardb_v2019.5.dmp
