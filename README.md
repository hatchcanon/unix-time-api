# unix-time-api
## Introduction
This repo is a demonstration for a API that returns the epoch time. Originally created for a take home interview, I took too much time on it for it to go to waste.
This API endpoint responds to HTTP GET requests and returns a JSON payload.
Tools used include
* Terraform
* kubectl
* Docker

## Components
There are 3 versions here
* [Lambda Version](lambda-version/README.md) - this version is fully automated but no container image
* [ECR Version](ecr-lambda-version/README.md) - this version pushes an image into ECR and lambda will use that image
* [Kubernetes Version](k8s-version/README.md) - this version uses kubectl and EKS for creating the endpoint