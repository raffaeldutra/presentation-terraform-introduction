variable "aws" {
  type        = map
  description = ""
  default = {
    region  = "us-east-1"
    profile = "tutorial"
  }
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block of the VPC"
  default     = "172.16.0.0/16"
}

variable "az_public" {
  type        = list
  description = ""
  default = [
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
}

variable "tags" {
  type        = map
  description = "Tags for the resource"
  default     = {}
}
