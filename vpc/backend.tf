terraform {
  backend "s3" {
    bucket  = "okeer-devops"
    key     = "terraform/vpc.tfstate"
    region  = "us-east-1"
    profile = "sorlov"
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
