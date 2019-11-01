provider "aws" {
  region  = "${var.aws["region"]}"
  profile = "${var.aws["profile"]}"
}

locals {
  common_tags = {
    Name        = "tutorial-${terraform.workspace}"
    Region      = "${var.aws["region"]}"
    ClientName  = "tutorial"
    Environment = "${terraform.workspace}"
    AccountName = "tutorial-account"
    ProjectName = "tutorial-aws"
  }
}

terraform {
  required_version = "0.12.6"

  backend "s3" {
    bucket = "rd-tutorial-terraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
