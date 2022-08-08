locals {
  secret_name = lower(trimspace(var.secret_name))
  environment = lower(trimspace(var.environment))
  team        = lower(trimspace(var.team))
  product     = lower(trimspace(var.product))
  application = lower(trimspace(var.application))
  bu          = lower(trimspace(var.bu))

  secret_value = var.is_json_value == true ? jsonencode(var.secret_value_map) : var.secret_value_string
}

module "tags" {
  source = "../../tags"

  environment = local.environment
  team        = local.team
  product     = local.product
  application = local.application
  bu          = local.bu
  custom_tags = var.custom_tags
}

module "secret" {
  source = "../module"

  name = local.secret_name

  secret_string = local.secret_value

  recovery_window_in_days = var.recovery_window_in_days

  policy = var.policy

  tags = module.tags.tags
}