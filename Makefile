.DEFAULT_GOAL := help
SHELL=/bin/bash -o pipefail

# Cite: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## Display this help page
	@grep -E '^[a-zA-Z/_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: gen
gen: ## Regenerates dart source-gen files
	dart run build_runner build lib --delete-conflicting-outputs --build-filter=**.sg.g.dart

.PHONY: init
init: install

.PHONY: clean
clean: ## Remove build assets
	$(RM) -r .packages
	$(RM) -r .dart_tool
	$(RM) - r pubspec.lock

.PHONY: install
install: ## Install the dependencies for your repositories
	dart pub get
	cd hello_world_test && dart pub get

.PHONY: serve
serve: ## Run the example application
	dart run dart_dev serve
	
