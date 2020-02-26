FROM postgres:10.4-alpine
VOLUME /data
COPY initdb.d /docker-entrypoint-initdb.d/
COPY /docker-setup.sh /docker-setup.sh
