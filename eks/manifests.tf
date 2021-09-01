locals {
  template = <<EOF
- objectName: "${aws_secretsmanager_secret._.name}"
  objectType: "secretsmanager"
EOF
}

resource "kubernetes_manifest" "ascp_aws" {
  for_each = {
    for i, v in split("\n---\n", data.http.ascp_aws_manifest.body) : i => yamldecode(v)
  }

  manifest = each.value

  depends_on = [
    helm_release.ascp
  ]
}

resource "kubernetes_manifest" "sa" {
  manifest = {
    apiVersion = "v1"
    kind       = "ServiceAccount"

    metadata = {
      name      = "aws-cli-sa"
      namespace = "default"
      annotations = {
        "eks.amazonaws.com/role-arn" = aws_iam_role._.arn
      }
    }
  }

  depends_on = [
    module.eks.cluster_id
  ]
}

resource "kubernetes_manifest" "secret_provider_class" {
  manifest = {
    apiVersion = "secrets-store.csi.x-k8s.io/v1alpha1"
    kind       = "SecretProviderClass"

    metadata = {
      name      = "aws-secrets"
      namespace = "default"
    }

    spec = {
      provider = "aws"
      parameters = {
        objects = local.template
      }
    }
  }


  depends_on = [
    kubernetes_manifest.ascp_aws
  ]
}
