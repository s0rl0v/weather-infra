provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Sandbox"
      Managed     = "Terraform"
      Owner       = "Sergey Orlov"
      Git         = "https://github.com/s0rl0v/infra-eks"
    }
  }
}
