# !/bin/bash

docker build -t $1 .
docker run $1
docker ps
