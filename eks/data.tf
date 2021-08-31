data "terraform_remote_state" "vpc" {
  backend   = "s3"
  config    = var.vpc_remote_state_config
  workspace = terraform.workspace
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
