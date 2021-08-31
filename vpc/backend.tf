terraform {
  backend "s3" {
    key = "terraform/vpc.tfstate"
  }

  required_version = "~> 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "sorlov"
  region  = "us-east-1"
}
