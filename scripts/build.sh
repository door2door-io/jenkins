#!/usr/bin/env bash
set -e

echo 'Building jenkins image from Dockerfile'
docker build -t door2door/jenkins .

echo 'Building jenkins data store image from Dockerfile'
docker create -v /var/jenkins_home --name jenkins-data door2door/jenkins
