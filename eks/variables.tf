variable "vpc_remote_state_config" {
  default = {
    bucket  = "okeer-devops"
    key     = "terraform/vpc.tfstate"
    region  = "us-east-1"
    profile = "sorlov"
  }
}
