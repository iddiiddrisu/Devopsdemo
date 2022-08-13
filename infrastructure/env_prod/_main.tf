#Configure terraform backend
provider "aws" {
  region  = var.var_global_aws_region
  profile = var.var_global_aws_profile
}