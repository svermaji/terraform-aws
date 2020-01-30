# Terraform

> Will create multiple set of scripts for clarity.
> Version details:
>    - OS: Win10 Home
>    - Terraform: v0.12.18
>    - Packer: 1.5.1
>    - AWS: aws-cli/1.16.303 Python/3.6.0 Windows/10 botocore/1.13.39

## 1-beginner 
For details check my blog: http://sv-technical.blogspot.com/2019/12/terraform.html<br>
This folder contains terraform sample scripts that
  - creates roles, users (not using for security reasons)
  - creates instance using ssh
  - creates groups
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
  - creates asg, elb, user-data, custom ssl
  - EC2 attaches to ELB and ELB in-turns attaches to ASG
    - User can access EC2 website via ELB on port 80 (http), port 443 (https), port 8000 (http).
    - SSL is custom generated so you will experience ssl warning on port 443
  - creates launch configuration

## 4-kms
This folder contains terraform sample scripts that
  - encrypt ami
  - create kms key
  - use default i.e. aws or custom managed kms key
  - create and use custom managed kms key

## 5-separate-modules
This folder contains terraform sample scripts that
  - has proper steps for SSL
  - create separate modules for admin tasks, iam and infra etc
  - infra module managed so it can be called multiple times with param

## 6-httpd-logs
This folder contains terraform (packer) sample scripts that
  - ami is changed to have custom httpd conf 
  - configuration to disable logging for 
    - (internal dummy connection)
    - "ELB-HealthChecker/1.0"
    - 408 (in-progress)
