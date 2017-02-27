#!/usr/bin/env bash

set -e

DATA_CONTAINER=$1
DATA_IMAGE=$2
SERVER_CONTAINER=$3
SERVER_IMAGE=$4

if [ "$(docker ps -aq -f status=created -f name=$DATA_CONTAINER)" ]; then
	echo "Found running data volume"
else
	docker create -v /var/jenkins_home --name $DATA_CONTAINER $SERVER_IMAGE
fi

if [ "$(docker ps -aq -f status=exited -f name=$SERVER_CONTAINER)" ]; then
	echo "Restarting exited container"
	docker start $SERVER_CONTAINER
else
	echo "Starting new container"
	docker run -d \
		--name $SERVER_CONTAINER \
		-p 80:80 \
		-p 50000:50000 \
		--volumes-from=$DATA_CONTAINER \
		$SERVER_IMAGE
fi

docker exec -u root $SERVER_CONTAINER nginx
