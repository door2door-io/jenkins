FROM jenkins:2.19.4

COPY ./scripts/install_docker.sh /tmp/install_docker.sh
USER root
RUN DOCKER_USER=jenkins /tmp/install_docker.sh \
    && apt-get clean \
    && rm -fr /var/lib/apt/lists/*

USER jenkins

COPY ./config/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ENV JAVA_OPTS "${JAVA_OPTS} -Dfile.encoding=UTF-8"