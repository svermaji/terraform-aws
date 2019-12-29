# Terraform

> Will create multiple set of scripts for clarity.

## 1-beginner 
For details check my blog: [Begin with Terraform](http://sv-technical.blogspot.com/2019/12/terraform.html)<br>
This folder contains terraform sample scripts that
  - create roles, users (not using for security reasons)
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
  - build-infra.bat that has packer and terraform commands to build complete infrastructure

Commands:
 - `packer validate FILENAME`
 - `packer build FILENAME`
