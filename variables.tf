
variable "secrets" {
  type        = list(map(string))
  description = "List of the secrets"
  default     = []
  sensitive   = true

  validation {
    condition     = alltrue([for s in var.secrets : length(keys(s)) > 0])
    error_message = "each element of var.secrets must be a non-empty map of string attributes"
  }
}

variable "topics" {
  type        = list(string)
  description = "Topics that will be used for defined secrets"
  default     = []

  validation {
    condition     = alltrue([for t in var.topics : length(t) > 0])
    error_message = "each topic in var.topics must be a non-empty string"
  }
}


variable "rotation_period" {
  type        = string
  description = "Rotation period for secrets, in RFC3339 duration format"

  validation {
    condition     = length(trimspace(var.rotation_period)) > 0
    error_message = "var.rotation_period must be a non-empty string"
  }
}

variable "next_rotation_time" {
  type        = string
  description = "RFC3339 timestamp for the first rotation notification; required for Secret Manager to publish rotation events"

  validation {
    condition     = can(regex("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z$", var.next_rotation_time))
    error_message = "next_rotation_time must be an RFC3339 UTC timestamp in the format YYYY-MM-DDTHH:MM:SSZ"
  }
}

variable "key_ring_id" {
  type        = string
  description = "ID of the KMS key ring used for secret encryption"

  validation {
    condition     = length(trimspace(var.key_ring_id)) > 0
    error_message = "var.key_ring_id must be a non-empty string"
  }
}
