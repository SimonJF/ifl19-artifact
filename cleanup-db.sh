#!/usr/bin/env bash
docker ps -a | awk '{ print $1,$2 }' | grep ifl19_db    | awk '{print $1 }' | xargs -I {} docker rm {}
docker rmi ifl19_db