#!/usr/bin/env bash

DB_PATH="$(pwd)"

if [ ! "$(docker images ifl19_db | grep ifl19_db)" ]; then
	docker build -t ifl19_db db
	docker run -v "ifl19_db:/var/lib/postgresql/data" -v "$DB_PATH/db/data:/data:ro" -ti ifl19_db /docker-setup.sh postgres
fi
