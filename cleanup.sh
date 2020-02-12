#!/usr/bin/env bash
docker ps -a | awk '{ print $1,$2 }' | grep links_ifl19 | awk '{print $1 }' | xargs -I {} docker rm {}
docker rmi links_ifl19
