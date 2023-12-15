# ontra-api

## Introduction
This is the repo for the Exercise: Infrastructure and Code for an API Endpoint

## Requirements


## Components
Terraform is structured in 2 main folders
* Infrastructure
* Modules

This insures that the code is modular and is easily readable. This also makes it easy to update in case you need to.

Inside the modules you have 2 services
* API Gateway
* Lambda

These modules utilize Terraform AWS modules https://registry.terraform.io/namespaces/terraform-aws-modules
* Created using Terraform v1.6.6
* Lambda Module v6.5.0