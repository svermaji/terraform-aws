# Terraform

> Will create multiple set of scripts for clarity.
> Version details:
>    - OS: Win10 Home
>    - Terraform: v0.12.18
>    - Packer: 1.5.1
>    - AWS: aws-cli/1.16.303 Python/3.6.0 Windows/10 botocore/1.13.39

## 1-beginner 
For details check my blog: [Begin with Terraform](http://sv-technical.blogspot.com/2019/12/terraform.html)<br>
This folder contains terraform sample scripts that
  - create roles, users (not using for security reasons)
  - create instance using ssh
  - create groups
  - ami
  - ec2 etc

Commands:
 - `terraform plan -no-color -refresh=true -out=infra.tfplan`
 - `terraform apply -refresh=true -auto-approve "infra.tfplan"`
 - `terraform destroy -auto-approve`
 
## 2-modules (and packer scripts) 
This folder contains terraform sample scripts that
  - terraform files arranged as modules
  - outputs.tf is at root only as terraform 0.12+ does not support modules outputs
  - packer scripts that creates ami after some script changes you want
  - ec2 creates based on newly created by packer ami
  - make ec2 public and connect with public subnet so able to ssh without any inbound rule modification
  - build-infra.bat that has packer and terraform commands to build complete infrastructure

Commands:
 - `packer validate FILENAME`
 - `packer build FILENAME`

## 3-asg
This folder contains terraform sample scripts that
  - created asg and ec2 attached to it
  - created launch configuration
