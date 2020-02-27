#!/usr/bin/env bash
if [ -z "$LINKS_PORT" ]
then
  LINKS_PORT=8080
fi
docker run -ti -p $LINKS_PORT:8080 -v `pwd`/custom-examples:/home/opam/custom-examples --rm ifl19_links ./links/links --config=config custom-examples/$@
