resource "aws_s3_bucket" "main" {
  count = var.create ? 1 : 0

  bucket = var.name
  acl    = var.acl
  tags   = var.tags

  versioning {
    enabled = var.versioning_enabled
  }

  dynamic "cors_rule" {
    for_each = var.cors_rules
    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}