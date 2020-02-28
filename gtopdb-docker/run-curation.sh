#!/usr/bin/env bash
./wait_for_db.sh
./links/links --path=app/ --config=config app/main.links
