######################################################################
###################### EC2 Section ###################################
# Creating EC2 assume policy document for EC2 Role
data "aws_iam_policy_document" "ec2_assume_document" {
  version = "2012-10-17"
  statement {
    sid = "1"
    effect = "Allow"
    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

# Creating role and attach the assume policy to it.
# This doesn't have any specific permission yet.
resource "aws_iam_role" "ec2_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_document.json
  name = var.iam_ec2_role_name
  path = "/"
  tags = {
    Terraform = true
    Name = var.iam_ec2_role_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

# Creating S3 specific document to be added to an
# actual policy
data "aws_iam_policy_document" "ec2_s3_bucket_document" {
  statement {
    sid = "2"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
  statement {
    sid = "1"

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutBucket",
    ]

    resources = var.iam_ec2_s3_bucket_arn_list
  }
}

#Creating an S3 policy based on the ec2_s3_bucket_document
#defined above. This policy is meant to regulate for EC2 access to S3 Buckets
resource "aws_iam_policy" "ec2_s3_bucket_policy" {
  policy = data.aws_iam_policy_document.ec2_s3_bucket_document.json
  name = var.iam_ec2_s3_policy_name
  tags = {
    Terraform = true
    Name = var.iam_ec2_s3_policy_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

#Creating ssm specific document to allow access to some system manager
# functionalities.
data "aws_iam_policy_document" "ec2_session_manager_ssm_document" {
  statement {
    sid = "2"
    actions = [
      "ssm:DescribeAssociation",
      "ssm:GetDeployablePatchSnapshotForInstance",
      "ssm:GetDocument",
      "ssm:DescribeDocument",
      "ssm:GetManifest",
      "ssm:GetParameters",
      "ssm:ListAssociations",
      "ssm:ListInstanceAssociations",
      "ssm:PutInventory",
      "ssm:PutComplianceItems",
      "ssm:PutConfigurePackageResult",
      "ssm:UpdateAssociationStatus",
      "ssm:UpdateInstanceAssociationStatus",
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = ["*"]
  }

}

# Creating policy based on the session manager document
# defined above. This is for EC2 as well
resource "aws_iam_policy" "ec2_session_manager_ssm_policy" {
  policy = data.aws_iam_policy_document.ec2_session_manager_ssm_document.json
  name = var.iam_ec2_ec2_session_manager_ssm_policy_name
  tags = {
    Terraform = true
    Name = var.iam_ec2_ec2_session_manager_ssm_policy_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

#Creating secrets manager specific document to allow creation of
#secrets at a particular path
data "aws_iam_policy_document" "ec2_secrets_manager_readwrite_document" {
  statement {
    sid = "2"
    actions = [
      "secretsmanager:*"
    ]
    resources = var.iam_ec2_secrets_manager_readwrite_resources
  }

}

## Creating policy based on the secret manager read write document created
## above
resource "aws_iam_policy" "ec2_secrets_manager_readwrite_policy" {
  policy = data.aws_iam_policy_document.ec2_secrets_manager_readwrite_document.json
  name =  var.iam_ec2_secret_manager_readwrite_resource_name

  tags = {
    Terraform = true
    Name = var.iam_ec2_secret_manager_readwrite_resource_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

# Attaching session manager policy to EC2 role
resource "aws_iam_role_policy_attachment" "ec2_iam_role_session_manager_policy_attachment" {
  policy_arn = aws_iam_policy.ec2_session_manager_ssm_policy.arn
  role = aws_iam_role.ec2_iam_role.name
}

# Attaching s3 bucket policy to the EC2 role
resource "aws_iam_role_policy_attachment" "ec2_iam_role_s3_bucket_policy_attachment" {
  policy_arn = aws_iam_policy.ec2_s3_bucket_policy.arn
  role       = aws_iam_role.ec2_iam_role.name
}

#Attaching secrets manager policy to the EC2 roles
 resource "aws_iam_role_policy_attachment" "ec2_iam_role_secretsmanager_policy_attachment" {
   policy_arn = aws_iam_policy.ec2_secrets_manager_readwrite_policy.arn
   role       = aws_iam_role.ec2_iam_role.name
 }


# Creating an EC2 prolie with the EC2 role
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.iam_ec2_profile_name
  role = aws_iam_role.ec2_iam_role.name
  tags = {
    Terraform = true
    Name = var.iam_ec2_profile_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

###########################################################################
###################### ECS Task Section ###################################

data "aws_iam_policy_document" "ecs_task_assume_document" {
    version ="2012-10-17"
    statement {
      sid = "1"
      effect = "Allow"
      principals {
        identifiers = ["ecs-tasks.amazonaws.com"]
        type = "Service"
    }
      actions = ["sts:AssumeRole"]
    }

}

# Creating role for ECS tasks and attach the assume policy to it.
# This doesn't have any specific permission yet.
resource "aws_iam_role" "ecs_task_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_document.json
  name = var.iam_ecs_task_role_name
  path = "/"
  tags = {
    Terraform = true
    Name = var.iam_ecs_task_role_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

#define iam policy object to allow ecs access to s3 resources and ssm
data "aws_iam_policy_document" "ecs_task_log-ssm-s3_document" {
 version=  "2012-10-17"
    statement {
       sid = "1"
        actions= [
                  "logs:CreateLogStream",
                  "logs:PutLogEvents"
        ]
        effect = "Allow"
        resources = var.iam_ecs_task_loggroup_resources_list
    }
  statement {
    sid = "2"
    actions = [
                "ssm:GetParametersByPath",
                "ssm:GetParameters",
                "ssm:GetParameter",
                "secretsmanager:GetSecretValue"
    ]
    effect = "Allow"
    resources = ["*"]
  }
 statement {
   sid = "3"
   actions = [
             "s3:PutObject",
             "s3:GetObject",
             "s3:GetObjectVersion",
             "s3:GetBucketAcl",
             "s3:GetBucketLocation"
   ]
   effect = "Allow"
   resources = var.iam_ecs_task_bucket_arn_list
 }
  statement {
    sid = "4"
    actions = [
      "ecs:ListClusters",
      "ecs:ListContainerInstances",
      "ecs:DescribeContainerInstances"
    ]
    effect = "Allow"
    resources = ["*"]
  }

}

#Create iam policy for ecs s3 and ssm
resource "aws_iam_policy" "ecs_task_log-ssm-s3_policy" {
  policy = data.aws_iam_policy_document.ecs_task_log-ssm-s3_document.json
  name = var.iam_ecs_task_policy_name

  tags = {
    Terraform = true
    Name = var.iam_ecs_task_policy_name
    Product = var.iam_product_name
    ENV = var.iam_environment
  }
}

#Attach iam role for ecs s3 and ssm policy above to ecs task role
resource "aws_iam_role_policy_attachment" "ecs_task_log-ssm-s3_policy_attachment" {
  policy_arn = aws_iam_policy.ecs_task_log-ssm-s3_policy.arn
  role       = aws_iam_role.ecs_task_iam_role.name
}
