# Docker Project Wrapper

## Maintain the image / application

Build the image

```make build```

Run the app

```make run```

Stop the app

```make stop```

Test the app

```make test```

Push the image to a registry

```make push```

Remove the image locally

```make cleanup```

## CI/CD

* Continuous delivery made with GitLab-CI.
* In the file .gitlab-ci.yml are 3 stages configured:
build, test, push. 
* All stage jobs use make commands to do their tasks
(See the chapter "Maintain the image / application").
* Build and test run on every push to the repository.
Push runs only on push or merge to the master branch.
