module "project-web-1" {
  source  = "raffaeldutra/project/digitalocean"
  version = "1.0.4"

  name        = terraform.workspace
  description = "Project description"
  purpose     = "Project purpose"
  droplets    = [module.droplet-web-1.urn]
}
