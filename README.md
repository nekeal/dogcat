# DogCat

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


