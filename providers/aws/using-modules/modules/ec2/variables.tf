variable "aws" {
  type        = map
  description = ""
  default = {
    region  = "us-east-1"
    profile = "tutorial"
  }
}

variable "instance_type" {
  default = {
    default = "t2.micro"
    dev     = "t2.micro"
    prd     = "t2.micro"
  }
}

variable "ssh_key" {
  type    = string
  default = "tutorial"
}

variable "tags" {
  type        = map
  description = "Tags for the resource"
  default     = {}
}
