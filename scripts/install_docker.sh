#!/usr/bin/env bash

install_dependencies() {
  apt-get update
}

install_docker() {
  wget -qO- https://get.docker.com/ | sh
  usermod -aG docker $DOCKER_USER
}

install_dependencies
install_docker
