# ontra-api

## Introduction
This version is the final version with kubernetes. This uses EKS Managed Node Groups, VPC with public and private subnets, IAM role for kubectl, ECR for image repo, and API Gateway to expose the API.

## Tools
* Terraform v1.6
* AWS CLI v2
* Docker CLI
* kubectl

## Instructions
1. Under terraform/ecr/main.tf, please put the arn of an AWS user that has administrative access so you can push the docker image.
2. Under terraform/iam/main.tf, please put the arn of an AWS user you would like to access the EKS cluster.
2. Return to terraform/infra/main.tf and please comment out all lines starting from line 28 module "apigw". This will be used later.
3. Run terraform plan and apply under terraform/infra
4. Building the EKS cluster may take 10 minutes.
5. Build the Docker Image under the source folder and wait for the current apply to finish.
6. In the new ECR repo, please push the image that you just build.
7. Try to connect to the new cluster. You may need to run something like this.
```
aws eks update-kubeconfig \
  --name my-eks \
  --region us-east-1 \
  --profile yourprofile
```

8. Once you are connected, run `kubectl apply -f kube/time-nlb.yaml`
9. The K8S service should have created a load balancer. Now go to the AWS console to find the listener uri. https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#LoadBalancers:
10. Once you have the uri, paste it into the apigw integration_uri line that you commented out earlier.
11. Uncomment everything in step 3.
12. Run terraform apply once more and the API should be running and connected to API Gateway.

At this point, the endpoint should be outputted to the console. You may curl it now. If the response is a server error, that means the load balancer has not finished provisioning. Give it a couple minutes and it will be complete.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.57 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.57 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigw"></a> [apigw](#module\_apigw) | ../modules/apigw | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ../modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ../modules/eks | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ../modules/iam | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_invoke_url"></a> [invoke\_url](#output\_invoke\_url) | API URL |