#!/bin/bash

# To build the docker image
./build.sh

#docker login
docker login --username $DOCKERHUB_USERNAME --password dckr_pat_b1dJvrjmyy7YEzgsCyUmNDPh3-k

#push  
if [ "$GIT_BRANCH" == "origin/dev" ]; then
  docker tag mydockerimage:alpine $DOCKERHUB_USERNAME/dev
  docker push $DOCKERHUB_USERNAME/dev
elif [ "$GIT_BRANCH" == "origin/master" ]; then
  docker tag mydockerimage:alpine $DOCKERHUB_USERNAME/prod
  docker push $DOCKERHUB_USERNAME/prod
else
  echo "FAILED"
fi

docker-compose down || true 
docker-compose up -d 
