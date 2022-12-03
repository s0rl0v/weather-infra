terraform {
  backend "s3" {
    bucket = "sorlov-terraform-state"
    key    = "eks.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.3.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
