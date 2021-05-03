#!make
-include .env

export $(shell sed 's/=.*//' .env)
export APP_NAME:=hcap
export COMMIT_SHA:=$(shell git rev-parse --short=7 HEAD)


# Git Tagging Aliases

tag-dev:
	@echo "Deploying $(APP_NAME):$(COMMIT_SHA) to dev env"
	@git tag -fa dev -m "Deploying $(APP_NAME):$(COMMIT_SHA) to dev env" $(COMMIT_SHA)
	@git push --force origin refs/tags/dev:refs/tags/dev

tag-test:
	@echo "Deploying $(APP_NAME):$(COMMIT_SHA) to test env"
	@git tag -fa test -m "Deploying $(APP_NAME):$(COMMIT_SHA) to test env" $(COMMIT_SHA)
	@git push --force origin refs/tags/test:refs/tags/test

tag-prod:
	@echo "Deploying $(APP_NAME):$(COMMIT_SHA) to prod env"
	@git tag -fa prod -m "Deploying $(APP_NAME):$(COMMIT_SHA) to prod env" $(COMMIT_SHA)
	@git push --force origin refs/tags/prod:refs/tags/prod
