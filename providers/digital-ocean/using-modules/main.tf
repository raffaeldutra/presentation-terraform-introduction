module "droplet-web-1" {
  source  = "raffaeldutra/droplet/digitalocean"
  version = "1.0.4"

  name = "web"
  tags = [
    "environment:${terraform.workspace}",
    "project:${terraform.workspace}-web-app",
    "team-web-app"
  ]
}

module "project" {
  source = "raffaeldutra/project/digitalocean"

  name        = "project-${terraform.workspace}"
  description = "Tutorail demonstration"
  droplets    = [module.droplet-web-1.urn]
  purpose     = "Demonstration"
}