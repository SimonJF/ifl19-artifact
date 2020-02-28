FROM ocaml/opam2:alpine-3.10-ocaml-4.08
WORKDIR /home/opam
ADD links links
ADD opam-repository.zip opam-repository.zip
ADD wait_for_db.sh wait_for_db.sh
USER root
WORKDIR /root
RUN apk update && apk upgrade && \
	apk add coreutils && \
	apk add camlp4 m4 libressl-dev && \
  apk add python2 && \
  apk add python3 && \
  apk add postgresql-client postgresql-dev && \
	chown opam:nogroup -R /home/opam/links
USER opam
WORKDIR /home/opam/
RUN unzip opam-repository.zip
WORKDIR /home/opam/links
RUN \
  opam repository set-url default /home/opam/opam-repository && \
  opam update && \
  opam install -y dune
RUN	eval `opam config env` && \
	opam pin add links . -y && \
  opam pin add links-postgresql . -y && \
	make nc && \
	sudo ln -s /home/opam/links/linx /usr/local/bin/
WORKDIR /home/opam/
EXPOSE 8080
CMD [ "bash" ]
