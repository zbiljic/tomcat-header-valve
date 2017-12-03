SHELL = bash

default: help

.PHONY: package
package: ## Package Java project
	@mvn package

.PHONY: verify
verify: ## Verify Java project
	@mvn verify

.PHONY: pack
pack: package ## Build Docker image
	@docker build -t zbiljic/tomcat-thv .

.PHONY: run
run: ## Run Docker image
	@docker run --rm -p 8888:8080 zbiljic/tomcat-thv

.PHONY: clean
clean: ## Remove build artifacts
	@echo "==> Cleaning build artifacts..."
	@mvn clean
	@docker rmi zbiljic/tomcat-thv

HELP_FORMAT="    \033[36m%-15s\033[0m %s\n"
.PHONY: help
help: ## Display this usage information
	@echo "Valid targets:"
	@grep -E '^[^ ]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; \
			{printf $(HELP_FORMAT), $$1, $$2}'
	@echo

FORCE:
