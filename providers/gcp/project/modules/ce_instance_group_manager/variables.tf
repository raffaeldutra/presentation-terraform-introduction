variable "target_pools" {
  type        = list
  description = "(Required) Target Pools"
  default = []
}

variable "target_size" {
  type        = number
  description = "(Required) Number"
  default     = 2
}

variable "zone" {
  type        = string
  description = "(Required) Number"
}

variable "instance_template" {
  type = string
}