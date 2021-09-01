resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_secretsmanager_secret" "_" {
  name        = "test"
  description = "My IRC client credentials"
}

resource "aws_secretsmanager_secret_version" "_" {
  secret_id     = aws_secretsmanager_secret._.id
  secret_string = random_password.password.result
}
