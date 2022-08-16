######################################################################
######### GLOBAL VARIABLES AND RESOURCES ###########

data "aws_availability_zones" "azs" {}
data "aws_caller_identity" "current" {}

locals {
  global_prefix = "${var.var_global_aws_environment}-${var.var_global_product}"
}

data "aws_iam_policy_document" "rds" {
  statement {
    sid       = "Enable IAM User Permissions"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
        data.aws_caller_identity.current.arn,
      ]
    }
  }

  statement {
    sid = "Allow use of the key"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type = "Service"
      identifiers = [
        "monitoring.rds.amazonaws.com",
        "rds.amazonaws.com",
      ]
    }
  }
}

data "aws_ami" "ec2_instance_type" {
  owners      = var.var_global_ec2instance_aws_ami_owner_list
  most_recent = true
  filter {
    name   = "name"
    values = var.var_global_ec2instance_filter_full_ref_list
  }
  filter {
    name   = "virtualization-type"
    values = var.var_global_ec2instance_filter_virtualiazation_type_list
  }
  filter {
    name   = "image-id"
    values = ["ami-0a2616929f1e63d91"]
  }
}