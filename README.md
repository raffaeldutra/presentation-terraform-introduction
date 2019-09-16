# Introdução ao Terraform

## Pré requisitos
Ter `Terraform` instalado na máquina [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html). Aqui estamos utilizando a versão `0.12`.

Se preferir, é possível utilizar diretamente de um container:
* Hub [https://hub.docker.com/r/raffaeldutra/docker-terraform](https://hub.docker.com/r/raffaeldutra/docker-terraform).
* Código fonte da imagem Docker [https://github.com/raffaeldutra/docker-terraform](https://github.com/raffaeldutra/docker-terraform).

## Objetivo da apresentação

* Entender como funciona Terraform.
* O que são recursos e módulos.
* O que é e como funciona o arquivo `terraform.tfstate`.
* Utilizar infraestrura como código em controle de versão como Git.
* Manter, criar e deletar recursos de forma "fácil".


## Demonstração

Para demonstração foi escolhido AWS (Amazon Web Services) e Digital Ocean e todo o código fonte e documentação pode ser encontrado aqui neste reposítório.

* [AWS com Recurso Simples](docs/aws/simple/readme.md)
* [AWS com utilização de módulos](docs/aws/with-modules/readme.md)
* [Digital Ocean com Recurso Simples](docs/digital-ocean/simple/readme.md)
* [Digital Ocean com utilização de módulos](docs/digital-ocean/with-modules/readme.md)