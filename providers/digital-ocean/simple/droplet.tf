variable "token" {
  description = "Variable to use against Digital Ocean"
}

provider "digitalocean" {
  token = "${var.token}"
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
}