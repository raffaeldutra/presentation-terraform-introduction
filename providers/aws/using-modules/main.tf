provider "aws" {
  region  = "${var.aws["region"]}"
  profile = "${var.aws["profile"]}"
}

terraform {
  required_version = "0.12.6"

 // backend "s3" {
 //   bucket = "rd-tutorial-terraform"
 //   key    = "terraform.tfstate"
 //   region = "us-east-1"
 // }
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

// Module VPC. It contains all the infrastructure needed to deal with
// VPC, Subnets, Internet Gateway and Routing Tables
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "172.16.0.0/16"
  az_public = [
    {
        name = "public"
        az   = "us-east-1a"
        cidr = "172.16.1.0/24"
    },
    {
        name = "public"
        az   = "us-east-1b"
        cidr = "172.16.3.0/24"
    }
  ]

  tags = {
    values = "${local.common_tags}"
  }
}

// Module VPC. It contains all the infrastructure needed to deal with
// Virtual Machines, Security Groups and Load balancer structure
module "ec2" {
  source =  "./modules/ec2"

  tags = {
    values = "${local.common_tags}"
  }
}

module "ssh" {
  source =  "./modules/ssh"

  tags = {
    values = "${local.common_tags}"
  }
}
