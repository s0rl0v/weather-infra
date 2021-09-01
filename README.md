# Overview

This repo consists of Terraform code that deploys an EKS cluster (`eks` folder) (whatever latest version is currently available) into an existing VPC (`vpc` folder)

1. `vpc` - provisions initial VPC for EKS cluster;
2. `eks` - provisions EKS cluster, example secrets, IAM mesh and AWS Secrets Manager and Config Provider for Secret Store CSI Driver.

# Installation

1. Configure AWS providers and remote backends in `providers.tf` and `variables.tf`;
2. Navigate to `vpc` and `eks` folders and execute:
```
# tf init
# tf apply
```
3. Deploy your code:
```
# kubectl apply -f example.yml
# kubectl logs aws-cli
```

# Usage

It's possible to provide your own AWS IAM role to the pod. For this, one needs to create a new ServiceAccount resource and change IAM role arn in annotation:

`example.yml`:
```
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: aws-cli-sa
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::828162785311:role/ default-playground-cluster-role <-- THIS
```

# Secret Management alternatives

Proposed solution - the one recommended by AWS in [Using AWS Secrets Manager secrets with Kubernetes](https://docs.aws.amazon.com/eks/latest/userguide/manage-secrets.html).

Pros - easy to install and manage, supports secret rotation and most importantly there are no copies of encrypted/unencrypted secrent in EKS itself.

The only downside - no support for KMS encrypted SSM as for now, so if one want maximum security - have to pay 0.4$/m per secret (Secret Manager).

Alternatives are:

1. Vault - brings additional management overhead, altought integrates nicely with k8s.
2. Flix/ArgoCD + SOPS/sealed-secrets.
