---
title: Using go Dependencies from private repositories
date: 2021-06-22
tags:
  - "go"
  - "golang"
categories:
  - "Development"
  - "golang"
menu: main
---


## Building Docker images (using Gitlab CI)

There some tutorials out there how to retrieve prviate dependencies for use in docker files like this [Blog Post by Jeff Wenzbauer](https://jwenz723.medium.com/fetching-private-go-modules-during-docker-build-5b76aa690280).

But all those I have seen require additional credentials to be created, maintained and injected. This makes using them either insecure or very cumbersome.

It think there is a simpler way by preparing a `vendor` directory and copying that into the builder image. The benefits are a simpler setup and the extra size of the builder image gets thrown away at the last step of the multi-step build process.


First prepare a cache containing all dependencies by adding the following two jobs to your `.gitlab-ci.yml`

```
go-deps:
  image: golang:latest
  variables:
    GOPATH: $CI_PROJECT_DIR/.go
  before_script:
    - mkdir -p .go
    - export GOPRIVATE=${CI_SERVER_HOST}
    - git config --global url.https://gitlab-ci-token:${CI_JOB_TOKEN}@${CI_SERVER_HOST}.insteadOf https://${CI_SERVER_HOST}
    - make mod
    - go mod vendor
  cache:
    paths:
      - .go/pkg/mod/
	  - vendor

docker-imager:
  image: docker-dind
  stage: deliver
  script:
    - COMMIT=$(git rev-parse --short HEAD)
    - docker build --file build/package/Dockerfile --tag $VERSION --arg VERSION=$VERSION --arg GO_MODULE=$GO_MODULE --arg COMMIT=$COMMIT 2>error.log
  dependencies:
    - lint:golang
    - test
  cache:
    paths:
      - .go/pkg/mod/
      - vendor
  artifacts:
    paths:
      - error.log
    when: on_failure

```
