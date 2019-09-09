## Criando projetos

No exemplo abaixo será criado os seguintes recursos:

* Projetos. Projetos são utilizados para melhor organização de recursos que são criados dentro de sua conta

Arquivo [project.tf](/providers/digital-ocean/project.tf)

Executando o comando do Terraform para verificar o que será criado.

```
terraform plan -target=module.project-web-1
```

A saída será a seguinte:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.droplet-web-1.digitalocean_droplet.this: Refreshing state... [id=158144214]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.project-web-1.digitalocean_project.this will be created
  + resource "digitalocean_project" "this" {
      + created_at  = (known after apply)
      + description = "Project description"
      + environment = "Development"
      + id          = (known after apply)
      + name        = "dev"
      + owner_id    = (known after apply)
      + owner_uuid  = (known after apply)
      + purpose     = "Project purpose"
      + resources   = [
          + "do:droplet:158144214",
        ]
      + updated_at  = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Criando o projeto e inserindo o Droplet anteriomente criado a este projeto:

```
terraform apply -target=module.project-web-1 -auto-approve
```

A saída do comando será a seguinte:

```
module.droplet-web-1.digitalocean_droplet.this: Refreshing state... [id=158144214]
module.project-web-1.digitalocean_project.this: Creating...
module.project-web-1.digitalocean_project.this: Creation complete after 3s [id=eb05bbee-3ccc-4a82-94
1d-35bc3286f5fa]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

[Destruindo tudo](destroy.md)