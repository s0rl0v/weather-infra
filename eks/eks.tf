module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.4.0"

  cluster_name    = "${terraform.workspace}-playground"
  cluster_version = "1.21"
  subnets         = data.terraform_remote_state.vpc.outputs.private_subnets_ids
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id

  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  cluster_endpoint_private_access      = true

  enable_irsa = true

  node_groups = {
    my_nodes = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "t2.micro"
      subnets          = data.terraform_remote_state.vpc.outputs.private_subnets_ids
    }
  }
}
