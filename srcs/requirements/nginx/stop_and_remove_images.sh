# !/bin/bash

for var in "$@"
do
	docker stop "$var"
	docker rmi -f "$var"
done

docker images