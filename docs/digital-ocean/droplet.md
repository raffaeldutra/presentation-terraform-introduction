## Droplets (Máquinas virtuais)

No exemplo abaixo será criado os seguintes recursos:

* Máquina Virtual.

Arquivo [droplet.tf](/providers/digital-ocean/droplet.tf)

Antes é necessário criar o primeiro `Workspace` do projeto.

```
terraform workspace new dev
```
A saída do comando será a seguinte:

```
Created and switched to workspace "dev"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
```

Executando o comando do Terraform para verificar o que será criado.

```
terraform plan -target=module.droplet-web-1
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

  # module.droplet-web-1.digitalocean_droplet.this will be created
  + resource "digitalocean_droplet" "this" {
      + backups              = false
      + created_at           = (known after apply)
      + disk                 = (known after apply)
      + id                   = (known after apply)
      + image                = "ubuntu-18-04-x64"
      + ipv4_address         = (known after apply)
      + ipv4_address_private = (known after apply)
      + ipv6                 = false
      + ipv6_address         = (known after apply)
      + ipv6_address_private = (known after apply)
      + locked               = (known after apply)
      + memory               = (known after apply)
      + monitoring           = false
      + name                 = "web-dev"
      + price_hourly         = (known after apply)
      + price_monthly        = (known after apply)
      + private_networking   = false
      + region               = "nyc3"
      + resize_disk          = true
      + size                 = "512mb"
      + status               = (known after apply)
      + tags                 = [
          + "environment:dev",
          + "project:dev-web-app",
          + "team-web-app",
        ]
      + urn                  = (known after apply)
      + vcpus                = (known after apply)
      + volume_ids           = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Criando de fato o primeiro Droplet:

```
terraform apply -target=module.droplet-web-1 -auto-approve
```

A saída do comando será a seguinte:

```
module.droplet-web-1.digitalocean_droplet.this: Creating...
module.droplet-web-1.digitalocean_droplet.this: Still creating... [10s elapsed]
module.droplet-web-1.digitalocean_droplet.this: Creation complete after 18s [id=158144214]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

[Criando Projeto](project.md)