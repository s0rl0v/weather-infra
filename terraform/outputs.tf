output iam_role_aws_lb_controller {
  value       = module.aws-lb-controller-irsa.iam_role_name
  description = "IAM Role name for AWS Load Balancer controller"
}

output iam_role_eks_autoscaler {
  value       = module.aws-eks-autoscaler-irsa.iam_role_name
  description = "IAM Role name for AWS Autoscaler controller"
}
output iam_role_aws_eks_image_updater_irsa {
  value       = module.aws-eks-image-updater-irsa.iam_role_name
  description = "IAM Role name for ArgoCD image updater"
}

output iam_role_aws_eks_external_secrets_irsa {
  value       = module.aws-eks-external-secrets-irsa.iam_role_name
  description = "IAM Role name for External Secrets"
}
