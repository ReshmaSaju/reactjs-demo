#!/bin/bash

# To build the docker image
./build.sh

#docker login
docker login --username reshma1215 --password dckr_pat_b1dJvrjmyy7YEzgsCyUmNDPh3-k

#push  
if [ "$GIT_BRANCH" == "origin/dev" ]; then
  docker tag mydockerimage:alpine reshma1215/dev
  docker push reshma1215/dev
elif [ "$GIT_BRANCH" == "origin/master" ]; then
  docker tag mydockerimage:alpine reshma1215/prod
  docker push reshma1215/prod
else
  echo "FAILED"
fi

docker-compose down || true 
docker-compose up -d 
