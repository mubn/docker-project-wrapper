# Docker Project Wrapper

## Maintain the image / application

`make`

```
Variables:
TAG             - Docker image tag (default: latest)
REGISTRY        - Docker registry (default: index.docker.io)
PROJECT         - Project name (default: webproject)

Targets:
build           - Build the docker image
run             - Build the docker image and run the docker container
stop            - Stop and delete the docker container
test            - Run, test, stop and delete the docker container
logs            - Show logs of the running application
push            - Push the docker image
cleanup         - Remove the docker image from local storage.
```

## CI/CD

* Continuous delivery made with GitLab-CI.
* In the file .gitlab-ci.yml are 3 stages configured:
build, test, push. 
* All stage jobs use make commands to do their tasks
(See the chapter "Maintain the image / application").
* Build and test run on every push to the repository.
Push runs only on push or merge to the master branch.
