locals {
  ciders = cidrsubnets(var.vpc_cidr, 8, 8, 8, 8)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.cluster_name
  cidr = var.vpc_cidr

  azs             = ["${data.aws_region.this.name}a", "${data.aws_region.this.name}b"]
  private_subnets = [local.ciders[0], local.ciders[1]]
  public_subnets  = [local.ciders[2], local.ciders[3]]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
