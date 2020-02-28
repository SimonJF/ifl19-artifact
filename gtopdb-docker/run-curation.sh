#!/usr/bin/env bash
./wait_for_db.sh
./links/links --path=examples/ --config=config examples/main.links
