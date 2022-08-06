variable "create" {
  type    = bool
  default = true
}

variable "name" {
  type        = string
  description = "Bucket Name"
}

variable "acl" {
  type        = string
  description = "ACL of bucket"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable Version"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = ""
}

variable "lifecycle_rule" {
  type        = any
  default     = []
  description = "List of configurations about lifecycle rules"
}

variable "cors_rules" {
  type        = any
  default     = []
  description = "List of rules of Cross-Origin Resource Sharing"
}
