terraform {
  backend "s3" {
    bucket = "371565184611-tfstate"
    key    = "example/AWS/us-east-1/example-vpc/services/secretsmanager/default/terraform.tfstate"
    region = "us-east-1"
  }
}