resource "aws_iam_policy" "image_uploader" {
  name        = "ArgoCDImageUploader"
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
