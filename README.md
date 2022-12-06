# Overview

This repo consists of Terraform code that provisions the following resources to AWS:
* EKS cluster with managed nodes;
* ECR repo for the demo application;
* IRSA modules to enable eks workloads to access AWS resources.

Further configuration and boostrapping could be done [with ArgoCD](/https://github.com/s0rl0v/weather-k8s-deployments).

# Installation

1. Navigate to terraform/ directory;
2. Configure AWS providers and remote backends in `providers.tf` and `variables.tf`;
3. Execute:
```
# tf init
# tf apply
```
