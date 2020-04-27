#!/bin/bash

# builds PyANSYS single user image and pushes it to azure
VERSION=v0.1.2
IMAGE=cad_query_dev:$VERSION
docker build -t $IMAGE .
# docker push mapdlhelm.azurecr.io/jupyterhub_mapdl_dev:$VERSION

# WORKDIR=/tmp/jupyter
# mkdir -p $WORKDIR
# docker run -it --rm -v $WORKDIR:/data/workdir -p 8888:8888 $IMAGE


# docker run -it --rm -v /tmp/jupyter:/data/workdir -p 8888:8888 cad_query_dev:v0.1.1
