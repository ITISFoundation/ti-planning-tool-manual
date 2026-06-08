.PHONY: install dev build preview public help sync

CURRENT_BRANCH:=$(shell git branch | grep \* | cut -d ' ' -f2)

install: ## install dependencies
	npm install

dev: ## serves website locally with hot-reload
	npx vitepress dev

build: ## builds static site
	npx vitepress build

preview: ## preview the built site locally
	npx vitepress preview

public: sync ## pushes to main repo and publishes website
	git push

sync: ## updates current repository with latest changes in github
	git pull

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help