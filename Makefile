### TPUT Variables
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE := $(shell tput -Txterm setaf 7)
CYAN := $(shell tput -Txterm setaf 6)
RESET := $(shell tput -Txterm sgr0)

.PHONY: all local help

all: help

## Local:
local: ## Install the hooks for the local repo
	git config --local core.hooksPath $(shell pwd)/.hooks

## Help:
help: ## Show this help message
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<command>'
	@echo ''
	@awk 'BEGIN {FS = ":.*?## "} { \
		if (/^[a-zA-Z_-]+:.*?##.*$$/) {printf "    ${YELLOW}%-20s${GREEN}%s${RESET}\n", $$1, $$2} \
		else if (/^## .*$$/) {printf "  ${CYAN}%s${RESET}\n", substr($$1,4)} \
		}' $(MAKEFILE_LIST)
