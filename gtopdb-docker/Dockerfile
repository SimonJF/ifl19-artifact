FROM ifl19_links
WORKDIR /home/opam
ADD run-curation.sh run-curation.sh
ADD app app
ADD config config
USER opam
WORKDIR /home/opam/
EXPOSE 8080
CMD [ "bash" ]
