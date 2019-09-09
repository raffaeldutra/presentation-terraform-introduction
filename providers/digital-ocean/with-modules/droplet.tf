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
