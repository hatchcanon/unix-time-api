# ontra-api

## Introduction
This version technically fulfills all requirements of completing the API while containerizing the code. It accomplishes this similiarly to the lambda version with the exception of the lambda package being an image instead of a zip file.

## Requirements
* Terraform v1.6
* AWS CLI v2
* Docker CLI

## Components
Terraform is structured in 2 main folders
* Infrastructure
* Modules

This insures that the code is modular and is easily readable. Written according to [best practices](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Instructions
1. Under terraform/infra/main.tf, please put in the AWS account ID you are using.
2. Under terraform/ecr/main.tf, please put the arn of an AWS user that has administrative access so you can push the docker image.
3. Run terraform plan and apply under terraform/infra
4. During this time, Terraform may complain that the lambda has no image. Ignore that for now.
5. Build the Docker Image under the source folder and push to the new ECR repo.
6. At this point please copy the new image_uri to terraform/infra/main.tf and rerun the tf apply.

To find the API endpoint, it should be under API gateway under the prod stage.
Ex: https://example.execute-api.us-east-1.amazonaws.com/prod/epoch-time