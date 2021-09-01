output "iam_role_arn" {
  value = aws_iam_role._.arn
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}
