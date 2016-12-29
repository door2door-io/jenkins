#!/usr/bin/env bash

set -e

DATA_CONTAINER=$1
DATA_IMAGE=$2
SERVER_CONTAINER=$3
SERVER_IMAGE=$4

if [ "$(docker ps -aq -f status=created -f name=$DATA_CONTAINER)" ]; then
	echo "Found running data volume"
else
	docker create -v /var/jenkins_home --name $DATA_CONTAINER $DATA_IMAGE
fi

docker run -d \
	--name $SERVER_CONTAINER \
	-p 8080:8080 \
	-p 50000:50000 \
	--volumes-from=$DATA_CONTAINER \
	$SERVER_IMAGE

# Later: Backups, Restarts and optionally restart exited container
# -v /var/jenkins_bkp:/var/jenkins_bkp \
# -v /var/run/docker.sock:/var/run/docker.sock \
# --restart always
