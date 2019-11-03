provider "digitalocean" {
  token = var.token
}

terraform {
  required_version = "0.12.6"
}