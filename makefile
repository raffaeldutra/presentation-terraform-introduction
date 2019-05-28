# COLORS
RED    := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE   := $(shell tput -Txterm setaf 4)
PURPLE := $(shell tput -Txterm setaf 5)
CYAN   := $(shell tput -Txterm setaf 6)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

.PHONY : help
help :
	@echo "init    : Inicializa recursos."
	@echo "vpc     : Cria VPC, Subredes, Rotas e Internet Gateway"
	@echo "ssh     : Cria chaves SSH para conectar na EC2"
	@echo "ec2     : Cria máquina Virtual"
	@echo "destroy : ${RED}REMOVE toda infraestrutura.${RESET}"

# Caso OSX, o pwd não é o mesmo de Linux
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	pwd = ${PWD}
else
	pwd = $(shell pwd)
endif

init:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform init

vpc:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform plan -target=module.vpc

vpc_apply:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform apply -target=module.vpc -auto-approve

ssh:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform plan \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

ssh_apply:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	-v $(pwd)/ssh:/tmp/ssh \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform apply \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

ec2:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform plan -target=aws_instance.ec2_machine

ec2_apply:
	docker run --rm \
	-v $(pwd):/terraform \
	-v $(pwd)/modules:/terraform/modules \
	-v ${HOME}/.aws:/root/.aws \
	raffaeldutra/docker-terraform:v0.12.0 \
	terraform apply -target=aws_instance.ec2_machine -auto-approve