provider "aws" {
  region = "us-east-1"
}

module "most_simple_redis" {
  source = "../../"

  cluster_id           = "ops-redis-test-dev"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
}