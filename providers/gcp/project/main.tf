variable "project" {
  type        = string
  description = "(Required) Used to inform a project. Use the Project ID and not the name itself"
  default     = "gdg-1-257603"
}

variable "zones" {
  type    = list
  default = ["us-central1-a", "us-central1-b"]
}

locals {
  projectName = "gdg"
}

provider "google" {
  // You can pass an another way to use credentials
  // See here: https://www.terraform.io/docs/providers/google/getting_started.html
  // By default we're using: export GOOGLE_CLOUD_KEYFILE_JSON=path
  project = var.project
  region  = var.gcp["region"]
}

module "compute_engine" {
  source = "./modules/ce_instance_template"

  name                 = local.projectName
  instance_description = "Google Developers Group"
  project              = var.project

  tags = ["gdg", "gdg-${terraform.workspace}", "http-server"]

  labels = {
    environment = terraform.workspace
    purpose     = "Google Developers Group"
  }
}

module "instance_group_manager" {
  source = "./modules/ce_instance_group_manager"

  name              = local.projectName
  zone              = element(var.zones, 1)
  instance_template = module.compute_engine.self_link
}

module "backend" {
  source = "./modules/ce_backend"

  name = local.projectName
  group = module.instance_group_manager.instance_group
}
