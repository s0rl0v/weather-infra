terraform {
  backend "s3" {
    bucket  = "okeer-devops"
    region  = "us-east-1"
    profile = "sorlov"
    key     = "terraform/eks.tfstate"
  }

  required_version = "~> 1.0.0"
}
