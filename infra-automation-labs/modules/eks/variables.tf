variable "cluster_name" {}
variable "cluster_version" { default = "1.29" }
variable "subnet_ids" { type = list(string) }
variable "cluster_role_arn" {}
variable "node_role_arn" {}

