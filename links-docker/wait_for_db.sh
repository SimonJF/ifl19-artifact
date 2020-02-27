#!/bin/bash

while [ 1 ]; do
	sleep 1
	PGPASSWORD="12345" psql gtopdb -h "db" -U opam << EOF
	SELECT * FROM ligand LIMIT 1
EOF
	if [ "$?" -eq "0" ]; then
		break;
	fi
done

echo "Database Online"


