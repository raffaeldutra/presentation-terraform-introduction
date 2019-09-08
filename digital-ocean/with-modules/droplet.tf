variable "token" {
  description = "Variable to use against Digital Ocean"
}

provider "digitalocean" {
  token = "${var.token}"
}


module "project" {
  source  = "raffaeldutra/project/digitalocean"
  version = "1.0.4"

  name        = terraform.workspace
  description = "Project description"
  purpose     = "Project purpose"
  droplets    = [module.project-web.urn]
}

module "project-web" {
  source  = "raffaeldutra/droplet/digitalocean"
  version = "1.0.4"

  name = "web"
  tags = [
    "environment:${terraform.workspace}",
    "project:web-app",
    "team-web-app"
  ]
}