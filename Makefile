# General.
SHELL = /bin/bash
TOPDIR = $(shell git rev-parse --show-toplevel)
PROJECT_NAME = celery-flower

# Docker.
DOCKER_ORG = ryr
DOCKER_IMAGE=$(PROJECT_NAME)
TAG ?= $(shell git describe)

default: build-docker

help: # Display help
	@awk -F ':|##' \
		'/^[^\t].+?:.*?##/ {\
			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
		}' $(MAKEFILE_LIST) | sort

build-docker: ## Build the docker image
	docker build -t $(DOCKER_ORG)/$(DOCKER_IMAGE):$(TAG) .

clean: clean-project clean-docker

clean-code: ## Remove unwanted files in project (!DESTRUCTIVE!)
	cd $(TOPDIR) && git clean -ffdx && git reset --hard

clean-docker: ## Remove all docker images built for this project (!DESTRUCTIVE!)
	@docker image rm -f $$(docker image ls --filter reference=$(DOCKER_IMAGE) -q)

.PHONY: help build-docker clean clean-project clean-docker
