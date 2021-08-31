data "aws_iam_policy_document" "pod_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "assume_cluster_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [module.eks.oidc_provider_arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
  }
}

resource "aws_iam_role" "_" {
  name               = "${terraform.workspace}-playground-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_cluster_role.json
}

resource "aws_iam_policy" "_" {
  policy = data.aws_iam_policy_document.pod_policy.json
}

resource "aws_iam_role_policy_attachment" "_" {
  policy_arn = aws_iam_policy._.arn
  role       = aws_iam_role._.name
}
