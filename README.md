# Overview

Terraform code that deploys an EKS cluster (`eks` folder) (whatever latest version is currently available) into an existing VPC (`vpc` folder)

1. `vpc` - provisions initial VPC for EKS cluster;
2. `eks` - provisions EKS cluster.

# Usage

1. Configure AWS providers and remote backends in `providers.tf` and `variables.tf`;
2. Navigate to `vpc` and `eks` folders and execute:
```
# tf init --backend-config=bucket=<YOUR_S3_BUCKET_NAME> --backend-config=profile=<YOUR_AWS_PROFILE> --backend-config=region=<TF_STATE_S3_BUCKET_REGION>
# tf apply
```
3. Deploy your code with corresponding IAM role:
```
# kubectl apply -f example_pod.yml
# kubectl logs aws-cli
```

# Customization

It's possible to provide your own AWS IAM role to the pod. For this, one needs to change IAM role arn in annotation:

`example_pod.yml`:
```
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: aws-cli-sa
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::828162785311:role/ default-playground-cluster-role <-- THIS
```
