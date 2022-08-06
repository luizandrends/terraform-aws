terraform {
  backend "s3" {
    bucket = "035267315123-tfstate"
    key    = "example/AWS/us-east-1/example-vpc/services/sqs/fifo-example/terraform.tfstate"
    region = "us-east-1"
  }
}