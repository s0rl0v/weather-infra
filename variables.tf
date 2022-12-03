variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR for VPC"
}

variable "cluster_name" {
  type        = string
  default     = "sorlov-sandbox"
  description = "EKS cluster name"
}
