variable "name" {
  type        = string
  description = "(Required) Backend Service name"
  default     = null
}

variable "load_balancing_scheme" {
  type        = string
  description = "(Required) Kind of Load Balancer"
  default     = "EXTERNAL"
}
