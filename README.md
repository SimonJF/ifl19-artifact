# Artifact for draft paper "Model-View-Update-Communicate: Session Types meet the Elm Architecture"

Rudi Horn, Simon Fowler, James Cheney
27th February 2020

## Introduction

This is the artifact for "Language-Integrated Updatable Views", accepted for
publication at IFL'19.

The artifact structure and packaging is based on the artifacts for:

  - "Exceptional Asynchronous Session Types: Session Types without Tiers" by
    Simon Fowler, Sam Lindley, J. Garrett Morris, and Sara Decova, POPL'19

  - "Incremental Relational Lenses" by Rudi Horn, Roly Perera, and James Cheney,
    ICFP'18.

The artifact contains the extended Links programming language, along with the
curation application.



An overview of the Links syntax can be found in `links/doc/quick-help.pod`.

## Structure

  * `links-docker` contains the files used for the Docker image
  * `db` contains the files used for the PostgreSQL Docker image
  * `links` contains the source code of the Links language
  * `custom-examples` is a folder shared between the host and container, useful
     if you wish to try your own examples
  * `prepare.sh` is a script to prepare the Docker image
  * `cleanup.sh` is a script to remove the image and containers after evaluation
  * `run-curation.sh` launches the chat server example
  * `run-interactive.sh` launches the Links REPL
  * `run-custom.sh` runs a custom example file
  * `run-shell.sh` runs a bash shell for the container

## Changing the port

By default, the Links server will listen on port 8080. If you wish to change
this port to a different value, set the `LINKS_PORT` environment variable:

  export LINKS_PORT=9001

In the remainder of the guide, we will assume the default port of 8080.

## Sample evaluation workflow

  1. Ensure you have `docker` and `docker-compose` installed.
     For Ubuntu 18.04, see: https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu/

  2. Ensure you have added yourself to the `docker` group: `sudo usermod -a -G
     docker <username>`. You will need to log back in to see the permissions take effect.

  3. Run `./prepare.sh` to install the image and prepare the docker containers
     (and you might wish to grab a coffee while this churns through)

  4. Run the curation interface by invoking `./run-ccuration.sh` and head to
     `http://localhost:8080`

  8. Remove any leftover containers and the image by running
     `./cleanup.sh`

You can also run your own examples by adding the file to the `custom_examples`
directory and running `./run-custom.sh <example file name>`.
For example, try running `./run-custom.sh helloworld.links`.

## Installing Links
We strongly recommend using the Docker image. If you do not wish to use Docker
however, you can install Links from source on an Ubuntu 18.04 install as
follows. From the `links` directory:

  1. Install the system dependencies using `sudo apt install m4 libssl-dev pkg-config`
  2. Install `opam`: https://opam.ocaml.org/doc/Install.html
  3. Run `opam init`
  4. Run `opam switch 4.08.0`
  5. Run ``` eval `opam config env` ``` (backticks around 'opam config env')
  6. Run `opam install dune`
  7. Run `opam pin add links .` to install Links and its dependencies
  8. Use links by invoking `linx`

## Relevant source files

The source can be found in the `links` directory. Relevant source files
you might wish to look at:

  * `links/lens` for the implementation of lenses
  * `links/core/typeSugar.ml` for the typechecker
  * `examples/editDiseases.links` for the lens-based implementation of the
    disease curation interface
