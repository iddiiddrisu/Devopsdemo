variable "rds_aurora_multiregion_identifier"{}
variable "rds_aurora_multiregion_engine"{}
variable "rds_aurora_multiregion_engine_version"{}
variable "rds_aurora_multiregion_first_instance_identifier" {}
variable "rds_aurora_multiregion_first_instance_class"{}
variable "rds_aurora_multiregion_first_publicly_assessible"{
  type = bool
}

variable "rds_aurora_multiregion_second_instance_identifier" {}
variable "rds_aurora_multiregion_second_instance_class"{}
variable "rds_aurora_multiregion_second_publicly_assessible"{
  type = bool
}
variable "rds_aurora_multiregion_vpc_id"{}
variable "rds_aurora_multiregion_subnet_group_name"{}
variable "rds_aurora_multiregion_create_db_subnet_group"{
  type = bool
}
variable "rds_aurora_multiregion_create_security_group"{
  type = bool
}
variable "rds_aurora_multiregion_iam_authentication_enable"{
  type = bool
}
variable "rds_aurora_multiregion_master_password"{}
variable "rds_aurora_multiregion_master_username"{}
variable "rds_aurora_multiregion_apply_immediately"{}
variable "rds_aurora_multiregion_skip_final_snapshot"{}
variable "rds_aurora_multiregion_cloudwatch_logs_exports"{
  type =list(string)
}
variable "rds_aurora_multiregion_vpc_security_group_ids_list" {
  type = list(string)
}
variable "rds_aurora_multiregion_db_port" {}
variable "rds_aurora_multiregion_param_gr_name" {}
variable "rds_aurora_multiregion_param_gr_family" {}

variable "rds_aurora_multiregion_product_name" {}
variable "rds_aurora_multiregion_caller_id" {}
variable "rds_aurora_multiregion_environment" {}
variable "rds_aurora_multiregion_cluster_param_gr_name" {}
variable "rds_aurora_multiregion_cluster_gr_family" {}
variable "rds_aurora_multiregion_database_name" {}
variable "rds_aurora_multiregion_parameter_max_con" {}