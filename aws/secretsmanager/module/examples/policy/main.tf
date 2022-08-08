provider "aws" {
  region = "us-east-1"
}

module "secret" {
  source = "../../"

  name          = "policy-secret-test"
  secret_string = "Example Secret"

  recovery_window_in_days = 7

  policy = file("./files/policy.json")

  tags = {
    "description" : "teste"
  }
}
