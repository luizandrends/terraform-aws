resource "aws_elasticache_cluster" "main" {
  count = var.create_elasticache_cluster ? 1 : 0

  cluster_id             = var.cluster_id
  engine                 = var.engine
  node_type              = var.node_type
  num_cache_nodes        = var.num_cache_nodes
  parameter_group_name   = var.parameter_group_name
  replication_group_id   = var.replication_group_id
  engine_version         = var.engine_version
  maintenance_window     = var.maintenance_window
  port                   = var.port
  subnet_group_name      = var.subnet_group_name
  security_group_names   = var.security_group_names
  security_group_ids     = var.security_group_ids
  apply_immediately      = var.apply_immediately
  snapshot_arns          = var.snapshot_arns
  snapshot_name          = var.snapshot_name
  notification_topic_arn = var.notification_topic_arn
  availability_zone      = var.availability_zone

  ## Just to Redis
  snapshot_window          = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit

  ## Just to Memcached
  az_mode                      = var.az_mode
  preferred_availability_zones = var.preferred_availability_zones

  tags = var.tags
}