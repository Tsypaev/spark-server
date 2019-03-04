PROJECTNAME  := test-app
WORKDIR := /tmp

buildproject:
	@docker build --no-cache --build-arg WORKDIR=${WORKDIR} -t $(PROJECTNAME) .
	@docker run --name $(PROJECTNAME) -t -d $(PROJECTNAME)
	@docker cp $(PROJECTNAME):$(WORKDIR)/target .
	@docker stop $(PROJECTNAME) && docker rm $(PROJECTNAME)
.PHONY: buildproject
