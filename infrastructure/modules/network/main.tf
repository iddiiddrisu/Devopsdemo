######################################################################
###################### Network Section ###############################
#Creating AWS VPC
module "network" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = var.network_name
  cidr                 = var.network_cidr
  azs                  = var.network_availability_zones
  private_subnets      = var.network_private_subnets_cidrs
  public_subnets       = var.network_public_subnets_cidrs
  database_subnets     = var.network_private_database_subnets_cidrs
  enable_nat_gateway   = var.network_enable_nat_gateway
  single_nat_gateway   = var.network_enable_single_nat_gateway
  enable_dns_hostnames = var.network_enable_hostname
  create_database_subnet_group = var.network_create_database_subnet
  database_subnet_group_name = var.network_database_subnet_group_name

  tags = {
      Name = var.network_name
      Terraform = true
      Product = var.network_product_name
      ENV = var.network_global_environment
  }
  # Private subnet configuration
  private_subnet_tags = {
    Name = "${var.network_name}-private-subnet"
    Terraform = true
    Product = var.network_product_name
    ENV = var.network_global_environment
  }

  # Public subnet configurations
  public_subnet_tags = {
    Name = "${var.network_name}-public-subnet"
    Terraform = true
    Product = var.network_product_name
    ENV = var.network_global_environment
  }

  #Private DB subnet configurations
  database_subnet_tags = {
    Name = "${var.network_name}-database-subnet"
    Terraform = true
    Product = var.network_product_name
    ENV = var.network_global_environment
  }
}