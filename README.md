# door2door Jenkins Docker image

Jenkins is a Continuous Integration and Delivery server.
[http://jenkins.io/](http://jenkins.io/).

<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>


---

(Makefile is coming)

## Build images

Jenkins container
$ docker build -t door2door/jenkins .

Data container
$ docker build -t door2door/jenkins-data -f Dockerfile-data .


## Build containers

$ docker run --name=jenkins-data jenkins-data
$ docker run -p 8080:8080 -p 50000:50000 --name=jenkins --volumes-from=door2door/jenkins-data -d door2door/jenkins

## Stop container
$ docker stop jenkins
$ docker rm -v jenkins (-v allows data volume to be removed)

TODO
* Makefile
* Seed initial custom theme
* Switch from `plugins.sh` to `install_plugins.sh`
* Removal of extra plugins
