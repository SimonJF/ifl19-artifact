#!/usr/bin/env bash

if [ ! "$(docker images ifl19_links | grep ifl19_links )" ]; then
	docker build -t ifl19_links links-docker
fi

if [ ! "$(docker images ifl19_links_gtopdb | grep ifl19_links_gtopdb )" ]; then
	docker build -t ifl19_links_gtopdb gtopdb-docker
fi
