module "secret_default" {
  source = "../../"

  environment = "dev"
  team        = "ops"
  product     = "ops"
  application = "sample"
  bu          = "ops"

  secret_name           = "policy-secret-test-bp"
  secret_value_string   = "Example Secret"

  recovery_window_in_days = 7

  policy = file("./files/policy.json")


  custom_tags = {
    "description" : "teste"
  }
}
