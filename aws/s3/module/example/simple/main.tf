provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source = "../../"

  name = "test-bucket-s3-simple"
  acl  = "private"

  tags = {
    "bu" = "tech_cross"
    "team" = "SPACEX"
  }
}