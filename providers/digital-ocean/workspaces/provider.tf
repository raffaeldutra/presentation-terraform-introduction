variable "token" {
  description = "Variable to use against Digital Ocean"
}

provider "digitalocean" {
  token = "${var.token}"
}
