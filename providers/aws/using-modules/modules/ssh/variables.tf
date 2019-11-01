variable "aws" {
  type        = map
  description = ""
  default = {
    region  = "us-east-1"
    profile = "tutorial"
  }
}

variable "tls_name" {
  description = "Name use to generate private key"
  type        = string
  default     = "tls_key"
}

variable "tls_path" {
  description = "Path to a directory where the public and private key will be stored"
  type        = string
  default     = "/tmp/ssh"
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
