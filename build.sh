#!/bin/bash

set -e

DOCKER_IMAGE_TAG="fonts:amazonlinux"
LAYER_ZIP="layer.zip"

rm -f $LAYER_ZIP 1>/dev/null

docker build -t $DOCKER_IMAGE_TAG .
CONTAINER=$(docker run -d $DOCKER_IMAGE_TAG)
docker cp $CONTAINER:/$LAYER_ZIP $LAYER_ZIP
docker rm -f $CONTAINER
