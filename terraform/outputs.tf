output iam_role_aws_lb_controller {
  value       = module.aws-lb-controller-irsa.iam_role_name
  description = "IAM Role name for AWS Load Balancer controller"
}
