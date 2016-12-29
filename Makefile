SERVER_CONTAINER ?= jenkins
DATA_CONTAINER ?= jenkins-data
SERVER_IMAGE ?= door2door/jenkins
DATA_IMAGE ?= door2door/jenkins-data


clean:
	docker rm -v $$(docker ps -a -q | grep -v "$$(docker ps -q | xargs | sed 's/ /\\\|/g') ") 2>/dev/null || echo Nothing to do
	docker rmi $$(docker images --no-trunc | grep none | awk '{print $$3 }') 2>/dev/null || echo Nothing to do

build:
	./scripts/build.sh

tag:
	docker tag jenkins_server:latest jenkins_server:$(shell date +%Y%m%d%H%M%S)

start:
	docker run --name $(DATA_CONTAINER) $(DATA_IMAGE)
	docker run -d \
		--name $(SERVER_CONTAINER) \
		-p 8080:8080 \
		-p 50000:50000 \
		--volumes-from=$(DATA_CONTAINER) \
		$(SERVER_IMAGE)

		# -v /var/jenkins_bkp:/var/jenkins_bkp \
		# -v /var/run/docker.sock:/var/run/docker.sock \
		# --restart always

stop:
	@echo 'Stopping $(SERVER_CONTAINER)'
	docker stop $(SERVER_CONTAINER)
	docker stop $(DATA_CONTAINER)

destroy:
	@echo 'Removing $(SERVER_CONTAINER)'
	docker rm -v $(SERVER_CONTAINER)

unlock:
	docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

rebuild: build tag stop clean start