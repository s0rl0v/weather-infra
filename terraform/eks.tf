module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.24"

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  cluster_endpoint_private_access      = true

  enable_irsa = true

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type                              = "AL2_x86_64"
    disk_size                             = 50
    instance_types                        = ["t3.small"]
    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    general = {
      min_size      = 1
      max_size      = 1
      desired_size  = 1
      capacity_type = "ON_DEMAND"
      labels = {
        node-type = "general"
      }

      tags = {
        "k8s.io/cluster-autoscaler/general" = "owned"
        "k8s.io/cluster-autoscaler/enabled" = true
      }
    }
  }
}
