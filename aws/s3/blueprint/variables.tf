variable "create" {
  type    = bool
  default = true
}

variable "application" {
  type        = string
  description = ""
}

variable "environment" {
  type        = string
  description = ""
}

variable "team" {
  type        = string
  description = ""
}

variable "product" {
  type        = string
  description = ""
}

variable "bu" {
  type        = string
  description = ""
}

### OPTIONALS

variable "acl" {
  type        = string
  default     = "private"
  description = "ACL of bucket"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "Enable Version"
}

variable "name" {
  type        = string
  default     = null
  description = ""
}

variable "custom_tags" {
  type        = map(any)
  default     = {}
  description = ""
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = ""
}

variable "lifecycle_rule_enabled" {
  type        = bool
  default     = false
  description = "Enable lifecycle rules on bucket s3"
}

variable "lifecycle_rules_custom" {
  type        = list(any)
  default     = []
  description = "Lifecycle rules custom."
}

variable "lifecycle_rule_transitions" {
  type        = any
  default     = []
  description = "List of maps of transitions with date (optional), days (optional) and storage_class (required)"
}

variable "lifecycle_rule_expiration_days" {
  type        = number
  default     = null
  description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
}

variable "lifecycle_rule_expiration_date" {
  type        = string
  default     = null
  description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
}

variable "lifecycle_rule_version_expiration" {
  type        = number
  default     = null
  description = "(Required) Specifies the number of days noncurrent object versions expire."
}

variable "lifecycle_rule_expiration_expired_object_delete_marker" {
  type        = string
  default     = null
  description = "(Optional) On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers. This cannot be specified with Days or Date in a Lifecycle Expiration Policy."
}

variable "cors_rules" {
  type        = list(any)
  default     = []
  description = "List of maps with cors rules containing allowed_headers, allowed_methods (Required), allowed_origins (Required), expose_headers or max_age_seconds."
}

variable "lifecycle_rule_version_transition_days" {
  type        = number
  default     = null
  description = "(Required) Specifies the number of days noncurrent object versions transition."
}

variable "lifecycle_rule_abort_incomplete_multipart_upload_days" {
  type        = number
  default     = null
  description = "Abor incomplete multipart upload days."
}

variable "lifecycle_rule_version_transition_storage_class" {
  type        = string
  default     = null
  description = "(Required) Specifies the storage class noncurrent object versions transition."
}
