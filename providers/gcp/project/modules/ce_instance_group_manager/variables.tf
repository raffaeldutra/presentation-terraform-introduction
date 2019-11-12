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

// variable "target_pools" {
//   type        = list
//   description = "(Required) Target Pools"
//   default     = []
// }

variable "zone" {
  type        = string
  description = "(Required) Number"
}

variable "instance_template" {
  type = string
  default = null
}

variable "name" {
  type        = string
  description = "(Required) Intance Group Name"
  default     = null
}
