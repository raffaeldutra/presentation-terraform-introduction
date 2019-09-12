# SSH chaves

No exemplo abaixo será criado os seguintes recursos:

* Chave privada.
* Chave para ser consumida pela máquina virtual EC2.

## Chave privada

Arquivo [ssh.tf](/providers/aws/with-modules/ssh.tf)

Executando em binário.

```
terraform plan -target=local_file.private_key_pem
```

A saída será a seguinte:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.private_key_pem[0] will be created
  + resource "local_file" "private_key_pem" {
      + content  = (known after apply)
      + filename = "/tmp/ssh/tls_key.pem"
      + id       = (known after apply)
    }

  # tls_private_key.generated will be created
  + resource "tls_private_key" "generated" {
      + algorithm                  = "RSA"
      + ecdsa_curve                = "P224"
      + id                         = (known after apply)
      + private_key_pem            = (known after apply)
      + public_key_fingerprint_md5 = (known after apply)
      + public_key_openssh         = (known after apply)
      + public_key_pem             = (known after apply)
      + rsa_bits                   = 4096
    }

Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Após verificar a saída, aplique os recursos.

Em caso de utilizar binário

```
terraform apply -target=local_file.private_key_pem -auto-approve
```

A saída será a seguinte:

```
tls_private_key.generated: Creating...
tls_private_key.generated: Creation complete after 6s [id=d466a34c3c6ef5ad0c8caae149620e804d6bb551]
local_file.private_key_pem[0]: Creating...
local_file.private_key_pem[0]: Creation complete after 0s [id=be2e61650c5ca6b77912f6ffe39e675c7c50fbab]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

private_key_filepath = /tmp/ssh/tls_key.pem
```

## Chave para ser consumida pela máquina virtual EC2.

Executando em binário.

```
terraform plan -target=aws_key_pair.generated
```

A saída será a seguinte:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

tls_private_key.generated: Refreshing state... [id=d466a34c3c6ef5ad0c8caae149620e804d6bb551]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_key_pair.generated will be created
  + resource "aws_key_pair" "generated" {
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "example-company"
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAADXt8/mGNRmIKJnaA3LflmQPC7ZVRqPvjYnd8CumDCMZYWp2iImgIT5hMbmb5+N5g5eIobgjtC4ppj8XfCmYn7tBHf17Bfmd9tI+P5s49nimGFWhqF3u6dQEUi7yp2SFyqnRE1uXHUTBxF9p4ZaX7bApUMuV6r2xuMUwLVdHSJU0N3/lclfsCrXqN8Ir3HwNP+gCUvlITe9GovDa4KNtmpwAiQziLaDaY5pMnq92LIuqFYzrBD3dlxKKC6QD7MhssS1yyoXeteIFXP6wJDnRFgoxHMa+rXfZlopb7Vm6QXOVHxcgA0cnJcDrM5TFy+xIKNjL8PvcNDQFBRRb0Xfd0a2a59zfdQlqBa+buxKFmYqs7w837hUeaGGPuuuS/jquwt+03pSwZ8Z8iU6FnnfaKlk0XCV/8zIF9Zg2kAiLNdPKt4MDdrT7ej/+fZd4BIvH/FHWTAEt6CN8OaE8OISbpzCp0oSUgeSEskkfTfFYGtyg4uqUxffqbgiTs9p5ml89rK4qXI8jFENBMJcMbDU2OPyCDmiOLu/BjBU/qAVPZcQ+zMYWZ3NIIqId4MgjYsWcmPTenzjiBTEC3Z0HkiwppeSLUzrtxf4jR7pz3rhfBqBauVVBLHcSviUoT1WZSP+9IAevqgjM/Xz2rUgdCOWPPRHqGbhq6AtZDcvLEN++aw=="
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Após verificar a saída, aplique os recursos.

Em caso de utilizar binário

```
terraform apply -target=aws_key_pair.generated -auto-approve
```

[Criando máquinas EC2](ec2.md)