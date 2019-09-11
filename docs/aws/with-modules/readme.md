# AWS

Documentação de como executar a Infraestrutura de forma incremental.

## Pré requisitos

Sempre será demonstrado como executar os passos de forma tradicional.

* Para este projeto, foi utilizada versão `0.12.0` do `Terraform`.
* É necessário configurar suas credenciais da AWS, para isso olhe esta documentação neste [link aqui](https://www.terraform.io/docs/providers/aws/index.html).

Neste exemplo será utilizado o seguinte "formato" que fica localizado em `$HOME/.aws/credentials`.

``` 
[example-company]
aws_access_key_id = XXXXXXXXX
aws_secret_access_key = YYYYYY
```

## Objetivo

Objetivo principal desta documentação é criar infraestrutura de forma incremental, da mesma forma como naturalmente sua infra iria crescer de maneira tradicional, mas sem utilizar Infraestrutura como códifo (Infrastructure as Code / IaC).

## Sumário

[Inicializando Terraform](init.md)