module "s3" {
  name        = "private-simple-bucket"
  source      = "../../"
  application = "private-simple-bucket"
  product     = "ops"
  team        = "ops"
  environment = "dev"
  bu          = "tech_cross"

  versioning_enabled = true
}