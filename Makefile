# print help
help: ## list available targets (this page)
	 @awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## install deps
	pipenv sync --dev --three

test: ## run tests
	pipenv run py.test -rx --cov=.

test-cov: ## py.test with HTML coverage
	pipenv run py.test --capture=sys -s --cov=. --cov-report=html

test-watch: ## py.test watch
	pipenv run ptw

