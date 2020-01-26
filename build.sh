#!/bin/bash

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -h, --help            Show usage
  -t, --target string   Directory that contains files to build layer zip
EOF
}

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -h | --help)
        usage
        exit 0
        ;;
    -t | --target)
        shift
        TARGET=$1
        ;;
    *)
        usage
        exit 1
        ;;
    esac
    shift
done

if [ ! -f "$TARGET/Dockerfile" ]; then
    echo "No dockerfile found in directory $TARGET"
    exit 1
fi

set -e

DOCKER_IMAGE_TAG="amazonlinuxfonts:$(basename "$TARGET")"
LAYER_ZIP="layer.zip"

rm -f "$TARGET/$LAYER_ZIP" 1>/dev/null

docker build -t $DOCKER_IMAGE_TAG $TARGET
CONTAINER=$(docker run -d $DOCKER_IMAGE_TAG)
docker cp $CONTAINER:/$LAYER_ZIP "$TARGET/$LAYER_ZIP"
docker rm -f $CONTAINER
