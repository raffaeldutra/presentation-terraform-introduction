## Destruindo todos recursos

Lembre-se que executando o passo abaixo, TUDO será excluído.

Para destruir todos os recursos simplemente faça:

```
terraform destroy -auto-approve
```

Com a seguitne saída:

```
module.droplet-web-1.digitalocean_droplet.this: Refreshing state... [id=158144214]
module.project-web-1.digitalocean_project.this: Refreshing state... [id=eb05bbee-3ccc-4a82-941d-35bc3286f5fa]
module.project-web-1.digitalocean_project.this: Destroying... [id=eb05bbee-3ccc-4a82-941d-35bc3286f5fa]
module.project-web-1.digitalocean_project.this: Destruction complete after 2s
module.droplet-web-1.digitalocean_droplet.this: Destroying... [id=158144214]
module.droplet-web-1.digitalocean_droplet.this: Still destroying... [id=158144214, 10s elapsed]
module.droplet-web-1.digitalocean_droplet.this: Still destroying... [id=158144214, 20s elapsed]
module.droplet-web-1.digitalocean_droplet.this: Destruction complete after 23s

Destroy complete! Resources: 2 destroyed.
```