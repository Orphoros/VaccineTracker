serve: assets-clean assets-precompile ## Start the Rails server
	bin/rails server
dep: ## Install project dependencies
	bundle install
console: ## Open a Rails console
	bin/rails console


assets-clean: ## Clean precompiled assets
	bin/rails assets:clobber
assets-precompile: ## Precompile assets for production
	bin/rails assets:precompile


db-reset: ## Reset the database (drop, create, migrate, seed)
	rake db:reset db:migrate
db-seed: ## Seed the database with initial data
	rake db:reset


help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <command> \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
