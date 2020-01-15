## 3-asg
This folder contains terraform sample scripts that
  - creates asg, elb, user-data, custom ssl
  - EC2 attaches to ELB and ELB in-turns attaches to ASG
    - User can access EC2 website via ELB on port 80 (http), port 443 (https), port 8000 (http).
    - SSL is custom generated so you will experience ssl warning on port 443
  - creates launch configuration