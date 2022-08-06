provider "aws" {
  region = "us-east-1"
}

module "sqs" {
  source = "../../"

  name = "example-standard-queue"

  tags = {
    "bu"   = "tech_cross"
    "team" = "SPACEX"
  }
}