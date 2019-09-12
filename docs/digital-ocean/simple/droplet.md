# Criando máquina simples na Digital Ocean

Arquivo [droplet.tf](/providers/digitalocean/simple/droplet.tf)

Execute o comando plan do Terraform:

```
terraform plan
```

Com o seguinte resultado:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # digitalocean_droplet.web will be created
  + resource "digitalocean_droplet" "web" {
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
      + name                 = "web-1"
      + price_hourly         = (known after apply)
      + price_monthly        = (known after apply)
      + private_networking   = false
      + region               = "nyc2"
      + resize_disk          = true
      + size                 = "s-1vcpu-1gb"
      + status               = (known after apply)
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

Aplique com o comando apply:

```
terraform apply -auto-approve
```

Com o seguinte resultado:

```
digitalocean_droplet.web: Creating...
digitalocean_droplet.web: Still creating... [10s elapsed]
digitalocean_droplet.web: Still creating... [20s elapsed]
digitalocean_droplet.web: Still creating... [30s elapsed]
digitalocean_droplet.web: Creation complete after 35s [id=158560563]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

E depois destrua esta máquina virtual:

```
terraform  destroy -auto-approve
```

Com o seguinte resultado:

```
digitalocean_droplet.web: Refreshing state... [id=158560563]
digitalocean_droplet.web: Destroying... [id=158560563]
digitalocean_droplet.web: Still destroying... [id=158560563, 10s elapsed]
digitalocean_droplet.web: Still destroying... [id=158560563, 20s elapsed]
digitalocean_droplet.web: Destruction complete after 24s
```