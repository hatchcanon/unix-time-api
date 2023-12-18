# ontra-api

## Introduction
This version was what I initially created then I read the code had to be containerized. Left this version as it is the only one that is fully automated.

## Components
Terraform is structured in 2 main folders
* Infrastructure
* Modules

This insures that the code is modular and is easily readable. Written according to [best practices](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Instructions
1. Under terraform/infra/main.tf, please put in the AWS account ID you are using.
2. Run terraform plan and apply under terraform/infra

To find the API endpoint, it should be under API gateway under the prod stage.
Ex: https://example.execute-api.us-east-1.amazonaws.com/prod/epoch-time

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.57 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.57 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigw"></a> [apigw](#module\_apigw) | ../modules/apigw | n/a |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ../modules/lambda | n/a |