## Inicializando Terraform

O primeiro passo de todos é inicializar os módulos que estão sendo utilizados pelo seu projeto e é necessário que esteja dentro do diretório onde está seus recursos.

Executando com o binário.

```
terraform init
```

A saída será mais ou menos a seguinte:

```
Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "digitalocean" (terraform-providers/digitalocean) 1.7.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.digitalocean: version = "~> 1.7"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

[Criando Máquina Virtual](droplet.md)