#!/usr/bin/env bash

set -e

DATA_CONTAINER=$1
DATA_IMAGE=$2
SERVER_CONTAINER=$3
SERVER_IMAGE=$4

theme=0
if [ "$(docker ps -aq -f status=created -f name=$DATA_CONTAINER)" ]; then
	echo "Found running data volume"
else
	docker create -v /var/jenkins_home --name $DATA_CONTAINER $SERVER_IMAGE
	theme=1
fi

docker run -d \
	--name $SERVER_CONTAINER \
	-p 8080:8080 \
	-p 50000:50000 \
	--volumes-from=$DATA_CONTAINER \
	$SERVER_IMAGE

if ((theme)); then
	echo 'Seeding data volume with theme'
	docker cp ./config/theme.xml $SERVER_CONTAINER:/var/jenkins_home/org.codefirst.SimpleThemeDecorator.xml
	docker exec -u root -it $SERVER_CONTAINER chown jenkins:jenkins /var/jenkins_home/org.codefirst.SimpleThemeDecorator.xml
fi

# Later: Backups, Restarts and optionally restart exited container
# -v /var/jenkins_bkp:/var/jenkins_bkp \
# -v /var/run/docker.sock:/var/run/docker.sock \
# --restart always
