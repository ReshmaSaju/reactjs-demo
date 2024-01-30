#!/bin/bash

# Setting the name of docker image

IMAGE_NAME="mydockerimage"

# Setting the tag for the docker image

IMAGE_TAG="alpine"

# Building docker image

docker build -t "$IMAGE_NAME:$IMAGE_TAG" .
