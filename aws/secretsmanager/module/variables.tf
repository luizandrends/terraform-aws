variable "name" {
  type        = string
  default     = null
  description = "Secret name."
}

variable "recovery_window_in_days" {
  type        = number
  default     = 30
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Resource tags."
}

variable "policy" {
  type        = string
  default     = null
  description = "The JSON policy for the Secret."
}

variable "automatically_after_days" {
  type        = number
  default     = null
  description = "number of days between automatic scheduled rotations of the secret."
}

variable "secret_string" {
  type        = string
  default     = null
  description = "Simple string to store on Secret."
}
