init.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform init

plan.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform plan

apply.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform apply

destroy.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform destroy

fmt.dev:
	@ENV=dev docker-compose run --rm terraform fmt -recursive

check.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform fmt -check
	@ENV=dev docker-compose run --rm terraform validate

console.dev:
	@make fmt.dev
	@ENV=dev docker-compose run --rm terraform console

init.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform init

plan.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform plan

apply.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform apply

destroy.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform destroy

fmt.stg:
	@ENV=stg docker-compose run --rm terraform fmt -recursive

check.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform fmt -check
	@ENV=stg docker-compose run --rm terraform validate

console.stg:
	@make fmt.stg
	@ENV=stg docker-compose run --rm terraform console

init.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform init

plan.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform plan

apply.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform apply

destroy.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform destroy

fmt.prd:
	@ENV=prd docker-compose run --rm terraform fmt -recursive

check.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform fmt -check
	@ENV=prd docker-compose run --rm terraform validate

console.prd:
	@make fmt.prd
	@ENV=prd docker-compose run --rm terraform console
