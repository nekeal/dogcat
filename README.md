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

## Provisioning server 
Ansible playbooks are located in `deployment/ansible` directory.
Firstly you need to create hosts file from `hosts.example`. <br>
Secondly fill necessary variables in `<your_variable_file>` basing on `group_vars/override-example.yml`
If you want override some additional variables present in `group_vars/all.yml`
just add them to `<your_variable_file>` created in second step.
As the last step run two playbooks with the following commands:
1. `ansible-playbook -i <your_hosts_file> core.yml --private-key <path_to_private_ssh_key> --extra-vars "@<your_variable_file>"`
This playbook will install all necessary packages, create deployer user,
and create some directories.
2. `ansible-playbook -i <your_hosts_file> core.yml --private-key <path_to_private_ssh_key> --extra-vars "@<your_variable_file>"`
This one will setup nginx with letsencrypt, postgresql, supervisor and will deploy your application from git server.



## Local Development
To start development locally you just need to run `docker-compose up`
