.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

help: ## Print this help
	@echo "Usage: make [target] env=[dev/stg/prd] (module=[terraform module])"
	@echo
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

console: ## exec terraform console
	@ENV=${env} docker-compose run --rm terraform console

validate: ## exec terraform validate
	@ENV=${env} docker-compose run --rm terraform validate

fmt: ## exec terraform fmt --recursive
	@ENV=${env} docker-compose run --rm terraform fmt --recursive

init: ## exec terraform init
	@ENV=${env} docker-compose run --rm terraform init

state-list: fmt validate ## exec terraform state list
	@ENV=${env} docker-compose run --rm terraform state list

state-show: fmt validate ## exec terraform state show ${module}
	@ENV=${env} docker-compose run --rm terraform state show ${module}

plan-all: fmt validate ## exec terraform plan
	@ENV=${env} docker-compose run --rm terraform plan

plan-module: fmt validate ## exec terraform plan -target=module.${module_name}
	@ENV=${env} docker-compose run --rm terraform plan -target=module.${module}

apply-all: fmt validate ## exec terraform apply --auto-approve
	@ENV=${env} docker-compose run --rm terraform apply --auto-approve

apply-module: fmt validate ## exec terraform apply -target=module.${module_name} --auto-approve
	@ENV=${env} docker-compose run --rm terraform apply -target=module.${module} --auto-approve

destroy-all: fmt validate ## exec terraform destroy --auto-approve
	@ENV=${env} docker-compose run --rm terraform destroy --auto-approve

destroy.module: fmt validate ## exec terraform destroy -target=module.${module_name} --auto-approve
	@ENV=${env} docker-compose run --rm terraform destroy -target=module.${module} --auto-approve
