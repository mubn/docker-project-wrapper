REGISTRY := registry.marekurban.de
TAG := latest
PROJECT := webproject

.PHONY: help
help:
	@echo ""
	@echo "Variables:"
	@echo "TAG      	- Docker image tag (default: latest)"
	@echo "REGISTRY 	- Docker registry (default: registry.marekurban.de)"
	@echo "PROJECT  	- Project name (default: webproject)"
	@echo ""
	@echo "Targets:"
	@echo "build    	- Build the docker image"
	@echo "run      	- Build the docker image and run the docker container"
	@echo "stop     	- Stop and delete the docker container"
	@echo "test     	- Run, test, stop and delete the docker container"
	@echo "logs     	- Show logs of the running application"
	@echo "push     	- Push the docker image"
	@echo "cleanup  	- Remove the docker image from local storage."
	
.PHONY: build
build: _build

.PHONY: run
run: _build _run

.PHONY: test
test: _stop _run _test

.PHONY: logs
logs:
	docker logs -f $(PROJECT)

.PHONY: stop
stop: _stop

.PHONY: push
push:
	docker push $(REGISTRY)/$(PROJECT):$(TAG)

.PHONY: cleanup
cleanup:
	docker rmi -f $(REGISTRY)/$(PROJECT):$(TAG)

### internal functions
.PHONY: _build
_build:
	docker build --label "org.label-schema.version=$(TAG)" -t $(REGISTRY)/$(PROJECT):$(TAG) .

.PHONY: _run
_run:
	docker run -d --name $(PROJECT) -p 8888:80 $(REGISTRY)/$(PROJECT):$(TAG)

.PHONY: _test
_test:
	bats test/kb.bats

.PHONY: _stop
_stop:
	docker rm -f $(PROJECT) || true
