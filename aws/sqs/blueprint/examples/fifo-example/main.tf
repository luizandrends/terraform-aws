module "sqs-main" {
  source = "../../"

  application = "teste"
  product     = "ops"
  team        = "ops"
  environment = "dev"
  bu          = "ops"

  create_dlq  = true
  fifo_queue  = true

  max_receive_count = 10
}