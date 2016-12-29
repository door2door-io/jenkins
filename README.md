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

**Start container**  
`make start`

**Stop container**  
`make stop`

**Get Jenkins unlock password**  
`make unlock`

**Destroy container**  
`make destroy`  
Note: This will detach the data volume container, but not remove it. That is a manual process left to your discretion.

**Clean up orphan/empty containers and images**  
`make clean` (Dev only. Use wisely since it destroys the data volume too.)

---
*TODO*
* Seed initial custom theme
* Switch from `plugins.sh` to `install_plugins.sh`
* Removal of extra plugins
* Remove old builds (job folder bloat)
