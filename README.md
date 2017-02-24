# door2door Jenkins Docker image

Jenkins is a Continuous Integration and Delivery server.
[http://jenkins.io/](http://jenkins.io/).

<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>

Built on the stock Jenkins docker image, this repo provides:
* Plugins pre-loaded in container
* Optional install of docker to run containerized Jenkins jobs
* Easy setup and teardown via simple `make` calls
* Styled with [Material theme](http://afonsof.com/blog/jenkins-material-theme/)

---

# Prerequisites
Your preferred setup of `docker` is running and operational.
Most commonly done with a `docker-machine start` command.

# Quick Start

`make setup`

Jenkins is now running at http://192.168.99.100:8080 with 2 containers:

* `jenkins`
* `jenkins-data` (shareable data volume)

Run `make unlock` to retrieve initial unlock code

---

# Commands

**Create base images**  
`make build` (you should only have to do this one time)

**Start Jenkins**  
`make start`

**Get Jenkins unlock password**  
`make unlock`

**Stop Jenkins**  
`make stop`

**Destroy container**  
`make destroy`  
Note: This will detach the data volume container, but not remove it. That is a manual process left to your discretion.

**Clean up orphan/exited containers and images**  
`make clean`

---

# Plugins
Add plugins to install [here](config/plugins.txt)

---

MIT License

Copyright (c) 2017 Door2Door GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
