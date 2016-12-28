#!/usr/bin/env bash
set -e

echo 'Building jenkins image from Dockerfile'
docker build -t door2door/jenkins .