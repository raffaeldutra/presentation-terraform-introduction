# Digital Ocean

Documentação de como executar a Infraestrutura de forma incremental na Digital Ocean.

## Pré requisitos

Sempre será demonstrado como executar os passos de forma tradicional.

* Para este projeto, foi utilizada versão `0.12.0` do `Terraform`.
* É necessário configurar suas credenciais da Digital Ocean.

Neste exemplo será utilizado variável de ambiente export `TF_VAR_token`.

Esta variável é consumida internamente pelo Terraform conforme visto [aqui na documentação oficial](https://www.terraform.io/docs/commands/environment-variables.html).

Para encontrar o token, vá até a página para geração de token, encontrada em [https://cloud.digitalocean.com/account/api/tokens](https://cloud.digitalocean.com/account/api/tokens)

Exemplo de utlização da variável:

``` 
export TF_VAR_token=XXXXYYYYYBBBBB
```

## Objetivo

Objetivo principal desta documentação é criar infraestrutura de forma incremental utilizando Digital Ocean como Cloud Provider, da mesma forma como naturalmente sua infra iria crescer de maneira tradicional, mas sem utilizar Infraestrutura como códifo (Infrastructure as Code / IaC).

## Sumário

[Inicializando Terraform](init.md)