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
	@echo "Comandos para Terraform em container."
	@echo "Para cada chamada, utilize -apply para aplicar o código, por exemplo: ${YELLOW}c-vpc-apply.${RESET}"
	@echo "c-init    : Inicializa recursos."
	@echo "c-vpc     : Cria VPC, Subredes, Rotas e Internet Gateway"
	@echo "c-ssh     : Cria chaves SSH para conectar na EC2"
	@echo "c-ec2     : Cria máquina Virtual"
	@echo "c-destroy : ${RED}REMOVE toda infraestrutura.${RESET}"
	@echo 
	@echo "Comandos para Terraform local."
	@echo "Para cada chamada, utilize -apply para aplicar o código, por exemplo: ${YELLOW}vpc-apply.${RESET}"
	@echo "init    : Inicializa recursos."
	@echo "vpc     : Cria VPC, Subredes, Rotas e Internet Gateway"
	@echo "ssh     : Cria chaves SSH para conectar na EC2"
	@echo "ec2     : Cria máquina Virtual"
	@echo "destroy : ${RED}REMOVE toda infraestrutura.${RESET}"
	@echo 
	
# Caso OSX, o pwd não é o mesmo de Linux
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	pwd = ${PWD}
else
	pwd = $(shell pwd)
endif

tag=v0.12.0


# Chamadas para binário
init:
	terraform init

vpc:
	terraform plan -target=module.vpc

vpc-apply:
	terraform apply -target=module.vpc -auto-approve

ssh:
	terraform plan \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

ssh-apply:
	terraform apply -auto-approve \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

ec2:
	terraform plan \
	-target=aws_instance.ec2_machine

ec2-apply:
	terraform apply -auto-approve \
	-target=aws_instance.ec2_machine

destroy:
	terraform destroy -auto-approve