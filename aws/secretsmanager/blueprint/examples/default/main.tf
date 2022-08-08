module "secret_default" {
  source = "../../"

  environment = "dev"
  team        = "ops"
  product     = "ops"
  application = "sample"
  bu          = "ops"

  secret_name           = "default-secret-test-bp"
  secret_value_string   = "Example Secret 1"

  recovery_window_in_days = 7

  custom_tags = {
    "description" : "teste"
  }
}
