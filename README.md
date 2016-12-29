# door2door Jenkins Docker image

Jenkins is a Continuous Integration and Delivery server.
[http://jenkins.io/](http://jenkins.io/).

<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>

---

# Prerequisites
Your preferred setup of `docker` is running and operational locally.
Most commonly done with a `docker-machine start` command.


# Get Started

**Create base images**  
`make build` (you should only have to do this one time)

**Start Jenkins**  
`make start` (Jenkins is at http://192.168.99.100:8080)

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
*TODO*
* `make start` should not start a fresh container, but restart the exited one instead
* Seed initial custom theme
* Switch from `plugins.sh` to `install_plugins.sh`
* Removal of extra plugins
* Remove old builds (job folder bloat)
