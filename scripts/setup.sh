#!/usr/bin/env bash

install_dependencies() {
  apt-get update
  apt-get clean
  rm -rf /var/lib/apt/lists/*
}

install_docker() {
  wget -qO- https://get.docker.com/ | sh
  usermod -aG docker $DOCKER_USER
}

install_dependencies
# install_docker
