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
	@echo "Comandos para Terraform local."
	@echo "Para cada chamada, utilize -apply para aplicar o código, por exemplo: ${YELLOW}aws-vpc-apply.${RESET}"
	@echo "Comandos para AWS"
	@echo "init               : Inicializa recursos."
	@echo "aws-vpc            : Plan para VPC, Subredes, Rotas e Internet Gateway"
	@echo "aws-vpc-apply      : Cria VPC, Subredes, Rotas e Internet Gateway"
	@echo "aws-ssh            : Plan para chaves SSH para conectar na EC2"
	@echo "aws-ssh-apply      : Cria chaves SSH para conectar na EC2"
	@echo "aws-ec2            : Plan para criar máquina Virtual"
	@echo "aws-ec2-apply      : Cria máquina Virtual"
	@echo "destroy            : ${RED}REMOVE toda infraestrutura.${RESET}"
	@echo 
	@echo "Comandos para AWS"
	@echo "do-droplet         : Plan para Máquina Virtual"
	@echo "do-droplet-apply"  : Criar Máquina Virtual"
	@echo "destroy            : ${RED}REMOVE toda infraestrutura.${RESET}"
	@echo 
	
	
# Caso OSX, o pwd não é o mesmo de Linux
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	pwd = ${PWD}
else
	pwd = $(shell pwd)
endif

init:
    terraform init

# Digital Ocean
do-droplet:
    terraform plan

do-droplet-apply:
    terraform apply -auto-approve

# AWS
aws-vpc:
	terraform plan -target=module.vpc

aws-vpc-apply:
	terraform apply -target=module.vpc -auto-approve

aws-ssh:
	terraform plan \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

aws-ssh-apply:
	terraform apply -auto-approve \
	-target=local_file.private_key_pem \
	-target=aws_key_pair.generated

aws-ec2:
	terraform plan \
	-target=aws_instance.ec2_machine

aws-ec2-apply:
	terraform apply -auto-approve \
	-target=aws_instance.ec2_machine

aws-destroy:
	terraform destroy -auto-approve
