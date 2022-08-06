#### REQUIRED 
variable "create_elasticache_cluster" {
  type        = bool
  default     = true
  description = "create elasticache cluster"
}

variable "cluster_id" {
  type        = string
  description = "Group identifier. ElastiCache converts this name to lowercase"
}

variable "engine" {
  type        = string
  description = "(Required unless replication_group_id is provided) Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis"
}

variable "node_type" {
  type        = string
  description = "(Required unless replication_group_id is provided) The compute and memory capacity of the nodes. See Available Cache Node Types for supported node types"
}

variable "num_cache_nodes" {
  type        = number
  description = "(Required unless replication_group_id is provided) The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20. If this number is reduced on subsequent runs, the highest numbered nodes will be removed."
}

variable "parameter_group_name" {
  type        = string
  description = "(Required unless replication_group_id is provided) Name of the parameter group to associate with this cache cluster"
}

### OPTIONALS
variable "replication_group_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the replication group to which this cluster should belong. If this parameter is specified, the cluster is added to the specified replication group as a read replica; otherwise, the cluster is a standalone primary that is not part of any replication group."
}

variable "engine_version" {
  type        = string
  default     = null
  description = "(Optional) Version number of the cache engine to be used. See Describe Cache Engine Versions in the AWS Documentation center for supported versions"
}

variable "maintenance_window" {
  type        = string
  default     = null
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd =hh24 =mi-ddd =hh24 =mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example = sun =05 =00-sun =09 =00"
}

variable "port" {
  type        = number
  default     = null
  description = "(Optional) The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. Cannot be provided with replication_group_id."
}

variable "subnet_group_name" {
  type        = string
  default     = null
  description = "(Optional, VPC only) Name of the subnet group to be used for the cache cluster."
}

variable "security_group_names" {
  type        = list(string)
  default     = null
  description = "(Optional, EC2 Classic only) List of security group names to associate with this cache cluster"
}

variable "security_group_ids" {
  type        = list(string)
  default     = null
  description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster"
}

variable "apply_immediately" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon ElastiCache Documentation for more information. (Available since v0.6.0)"
}

variable "snapshot_arns" {
  type        = list(string)
  default     = null
  description = "(Optional) A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example = arn =aws =s3 = = =my_bucket/snapshot1.rdb"
}

variable "snapshot_name" {
  type        = string
  default     = null
  description = "(Optional) The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
}

variable "notification_topic_arn" {
  type        = string
  default     = null
  description = "(Optional) An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example = arn =aws =sns =us-east-1 =012345678999 =my_sns_topic"
}

variable "availability_zone" {
  type        = string
  default     = null
  description = "(Optional) The Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred_availability_zones instead. Default = System chosen Availability Zone."
}

variable "tags" {
  type        = map
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}

## Just to Redis
variable "snapshot_window" {
  type        = string
  default     = null
  description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example = 05 =00-09 =00"
}

variable "snapshot_retention_limit" {
  type        = number
  default     = null
  description = "(Optional, Redis only) The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro or cache.t2.* cache nodes"
}

### Just to memcached
variable "az_mode" {
  type        = string
  default     = null
  description = "(Optional, Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1"
}

variable "preferred_availability_zones" {
  type        = list(string)
  default     = null
  description = "(Optional, Memcached only) A list of the Availability Zones in which cache nodes are created. If you are creating your cluster in an Amazon VPC you can only locate nodes in Availability Zones that are associated with the subnets in the selected subnet group. The number of Availability Zones listed must equal the value of num_cache_nodes. If you want all the nodes in the same Availability Zone, use availability_zone instead, or repeat the Availability Zone multiple times in the list. Default: System chosen Availability Zones. Detecting drift of existing node availability zone is not currently supported. Updating this argument by itself to migrate existing node availability zones is not currently supported and will show a perpetual difference."
}
