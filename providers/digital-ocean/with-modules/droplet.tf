module "droplet-web-1" {
  source  = "raffaeldutra/droplet/digitalocean"
  version = "1.0.4"

  name = "web"
  tags = [
    "environment:dev",
    "project:dev-web-app",
    "team-web-app"
  ]
}