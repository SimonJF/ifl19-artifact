#!/bin/bash
if [ ! "$(docker images links_ifl19 | grep links_ifl19)" ]; then
	docker build -t links_ifl19 links-docker
fi
