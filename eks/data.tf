data "terraform_remote_state" "vpc" {
  backend   = "s3"
  config    = var.vpc_remote_state_config
  workspace = terraform.workspace
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "http" "ascp_aws_manifest" {
  url = "https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml"
}
