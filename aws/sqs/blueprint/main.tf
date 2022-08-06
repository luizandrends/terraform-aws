locals {
  name             = var.name == null ? null : var.name
  resources_name   = var.name == null ? var.fifo_queue ? "${module.tags.name}.fifo" : module.tags.name : var.name
  dlq_pattern_name = lower("${var.product}-${var.application}-dead-${var.environment}")
  dlq_name         = var.fifo_queue ? "${local.dlq_pattern_name}.fifo" : local.dlq_pattern_name
}


data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

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

module "sqs_dead_queue" {
  source = "../module"

  create = var.create_dlq

  name = local.dlq_name

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds

  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  tags = module.tags.tags
}

module "sqs" {
  source = "../module"

  name = local.resources_name

  name_prefix                = var.sqs_name_prefix
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds

  tags = module.tags.tags

  depends_on = [
    module.sqs_dead_queue
  ]
}