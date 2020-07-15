# DogCat

## Infrastructure Setup
To setup your infrastructure in AWS you need to make sure that you are in the root of
project, have aws credentials configured and follow the steps below:
 - Copy example vars and modify it for your needs: `cp deployment/terraform/terraform.tfvars.example deployment/terraform/terraform.tfvars`
 - Go to the terraform directory `cd deployment/terraform` and issue following commands
    - `terraform init`
    - `terraform apply` - accept changes by entering `yes`
After this steps in your aws account are created 2 buckets for static and media files and
ec2 instance with access to that buckets.

## Local Development
To start development locally you just need to run `docker-compose up`
