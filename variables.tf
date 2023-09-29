
variable "secrets" {
  type        = list(map(string))
  description = "List of the secrets"
  default     = []
}

variable "topics" {
  type        = list(string)
  description = "Topics that will be used for defined secrets"
  default     = []
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "rotation_period" {
  type = string
}

variable "key_ring_id" {
  type = string
}
