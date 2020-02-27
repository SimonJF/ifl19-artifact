#!/usr/bin/env bash
if [ -z "$LINKS_PORT" ]
then
  LINKS_PORT=8080
fi
cd compose
docker-compose up
