module "sqs-main" {
  source = "../../"

  application = "example"
  product     = "ops"
  team        = "ops"
  environment = "dev"
  bu          = "tech-cross"

  create_dlq = true
  max_receive_count = 10
}