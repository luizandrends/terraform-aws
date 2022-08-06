provider "aws" {
  region = "us-east-1"
}

module "sqs" {
  source = "../../"

  name       = "example-fifo-queue.fifo"
  fifo_queue = true

  tags = {
    "bu"   = "tech-cross"
    "team" = "SPACEX"
  }
}