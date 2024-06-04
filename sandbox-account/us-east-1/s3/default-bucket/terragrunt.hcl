locals {
  providers = read_terragrunt_config(find_in_parent_folders("providers.hcl"))
  application_tags = {
    environment     = "dev"
    team            = "my-awesome-team"
    application     = "some-sandbox-lambda"
  }
}

terraform {
  source = "git@github.com:luizandrends/terraform-aws-modules.git//modules/s3?ref=v1.2.0"
}

inputs = merge(local.application_tags, {
  name = "default"
})

include {
  path = find_in_parent_folders()
}

generate = local.providers.generate

