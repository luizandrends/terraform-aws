# Tags
variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "team" {
  type        = string
  description = "Team name"
}

variable "product" {
  type        = string
  description = "Product"
}

variable "application" {
  type        = string
  description = "Application"
}

variable "bu" {
  type        = string
  description = "Bu"
} 

variable "custom_tags" {
  type        = map(any)
  default     = {}
  description = "Resource Tags"
}

variable "blueprint" {
  type        = string
  default     = "secretsmanager/default"
  description = "Blueprint name."
}

# Secret

variable "secret_name" {
  type        = string
  default     = null
  description = "Legacy Secret name."
}

variable "recovery_window_in_days" {
  type        = number
  default     = 30
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret."
}

variable "is_json_value" {
  type        = bool
  default     = true
  description = "Secret string"
}

variable "secret_value_string" {
  type        = string
  default     = "Override on AWS Console."
  description = "Secret string."
  sensitive   = true
}

variable "secret_value_map" {
  type        = map(string)
  default     = { key = "Override on AWS Console." }
  description = "Secret string json."
  sensitive   = true
}

# Policy

variable "policy" {
  type        = string
  default     = null
  description = "The JSON policy for the Secret."
}