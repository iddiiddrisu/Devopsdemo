#Configure terraform backend
provider "aws" {
  region  = var.var_global_aws_region
  profile = var.var_global_aws_profile
}

terraform {
  backend "s3" {
    bucket = "${var.var_global_product}.terraform-states"
    key    = "prod/terraform.tfstate"
    region = "eu-west-1"
  }
}