MAVENIMAGENAME  := maven
JAVAIMAGENAME  := java
FINALIMAGENAME := tsypaev/test-app

WORKDIR := /tmp

BUILDERDOKERFILENAME := builder.Dockerfile
LAUNCHERERDOKERFILENAME := launcher.Dockerfile

buildproject:
	@docker build --no-cache --build-arg WORKDIR=${WORKDIR} -t $(MAVENIMAGENAME) -f $(BUILDERDOKERFILENAME) .
	@docker run --name $(MAVENIMAGENAME) -t -d $(MAVENIMAGENAME)
	@docker cp $(MAVENIMAGENAME):$(WORKDIR)/target .
	@docker stop $(MAVENIMAGENAME) && docker rm $(MAVENIMAGENAME)
.PHONY: buildproject

pushimage:
	@docker build --no-cache --build-arg WORKDIR=${WORKDIR} -t $(JAVAIMAGENAME) -f $(LAUNCHERERDOKERFILENAME) .
	@docker tag java ${FINALIMAGENAME}
	@docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	@docker push ${FINALIMAGENAME}
.PHONY: pushimage
