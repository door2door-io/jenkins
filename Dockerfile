FROM jenkins

COPY ./scripts/setup.sh /tmp/setup.sh
USER root
RUN DOCKER_USER=jenkins /tmp/setup.sh

USER jenkins

COPY ./config/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

ENV JAVA_OPTS "${JAVA_OPTS} -Dfile.encoding=UTF-8"