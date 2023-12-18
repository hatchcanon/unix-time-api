# ontra-api

## Introduction
This version was what I initially created then I read the code had to be containerized. Left this version as it is the only one that is fully automated.

## Requirements
* Terraform v1.6
* AWS CLI v2

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