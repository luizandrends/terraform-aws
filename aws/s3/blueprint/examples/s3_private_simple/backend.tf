terraform {
  backend "s3" {
    bucket = "371565184611-tfstate"
    key    = "example/AWS/us-east-1/example-vpc/services/s3/s3_private_simple/terraform.tfstate"
    region = "us-east-1"
  }
}