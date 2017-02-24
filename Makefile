SERVER_CONTAINER ?= jenkins
DATA_CONTAINER ?= jenkins-data
SERVER_IMAGE ?= door2door/jenkins
DATA_IMAGE ?= door2door/jenkins-data

build:
	./scripts/build.sh

tag:
	docker tag $(SERVER_IMAGE):latest $(SERVER_IMAGE):$(shell date +%Y%m%d%H%M%S)

start:
	./scripts/start.sh $(DATA_CONTAINER) $(DATA_IMAGE) $(SERVER_CONTAINER) $(SERVER_IMAGE)

stop:
	@echo 'Stopping $(SERVER_CONTAINER)'
	docker stop $(SERVER_CONTAINER)
	docker stop $(DATA_CONTAINER)

destroy:
	@echo 'Removing $(SERVER_CONTAINER)'
	docker rm -v $(SERVER_CONTAINER)

destroy-data:
	@echo 'Removing $(DATA_CONTAINER)'
	docker rm -v $(DATA_CONTAINER)

clean:
	@echo 'Removing exited containers'
	docker rm -v $$(docker ps -a -q -f status=exited) 2>/dev/null || echo Nothing to do
	@echo 'Removing untagged images'
	docker rmi $$(docker images -a | grep "^<none>" | awk '{print $3}') 2>/dev/null || echo Nothing to do

theme:
	@echo 'Seeding data volume with theme'
	docker cp ./config/theme.xml $(SERVER_CONTAINER):/var/jenkins_home/org.codefirst.SimpleThemeDecorator.xml
	docker exec -u root $(SERVER_CONTAINER) chown jenkins:jenkins /var/jenkins_home/org.codefirst.SimpleThemeDecorator.xml

unlock:
	docker exec $(SERVER_CONTAINER) cat /var/jenkins_home/secrets/initialAdminPassword

rebuild: build tag stop clean start theme

setup: build start theme
