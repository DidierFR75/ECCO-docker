#!/bin/bash
mkdir -p ecco-input ecco-output
cp src/main/resources/css/*.css ecco-output
docker build -t brainzai/ecco:latest -f ecco/Dockerfile ecco
docker push brainzai/ecco:latest

# run example
docker run -v `pwd`/ecco-input:/ecco-input -v `pwd`/ecco-output:/ecco/ecco-output -it brainzai/ecco -ont1 ecco-input/onto1.ttl -ont2 ecco-input/onto2.ttl
