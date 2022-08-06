terraform {
  backend "s3" {
    bucket = "035267315123-tfstate"
    key    = "example/AWS/us-east-1/example-vpc/services/sqs/standard/terraform.tfstate"
    region = "us-east-1"
  }
}