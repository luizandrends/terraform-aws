locals {
  name        = var.name == null ? null : var.name
  environment = lower(trimspace(var.environment))
  team        = lower(trimspace(var.team))
  product     = lower(trimspace(var.product))
  application = lower(trimspace(var.application))

  resources_name = var.name != null ? module.tags.name : format(module.tags.name)

  acl_map = {
    "private"                   = "private"
    "public-read"               = "public-read"
    "public-read-write"         = "public-read-write"
    "aws-exec-read"             = "aws-exec-read"
    "authenticated-read"        = "authenticated-read"
    "bucket-owner-read"         = "bucket-owner-read"
    "bucket-owner-full-control" = "bucket-owner-full-control"
    "log-delivery-write"        = "log-delivery-write"
  }

  acl = local.acl_map[lower(var.acl)]
}

module "tags" {
  source = "../../tags"

  name = local.name

  product     = var.product
  application = var.application
  environment = var.environment
  team        = var.team
  bu          = var.bu
  custom_tags = var.custom_tags
}

module "s3" {
  source = "../module"

  create = var.create

  name = local.resources_name
  acl  = local.acl

  versioning_enabled = var.versioning_enabled


  cors_rules = [
    for rule in var.cors_rules :
    {
      allowed_headers = try(rule.allowed_headers, null) # Optional
      allowed_methods = rule.allowed_methods            #Required
      allowed_origins = rule.allowed_origins            #Required
      expose_headers  = try(rule.expose_headers, null)  # Optional
      max_age_seconds = try(rule.max_age_seconds, null) # Optional
    }
  ]

  tags = module.tags.tags
}