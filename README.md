**Task** 

**Infrastructure as Code (IaC)**

    Use Terraform or CloudFormation to define infrastructure for both applications on AWS.
    Please ensure the front-end can communicate with the back-end
    The infrastructure could include, but not limited to:
        VPC with public and private subnets.
        EC2 instances in the private subnet.
        An Application Load Balancer in the public subnet.
        RDS (MySQL) in the private subnet.
        S3 bucket for static file storage.
    Include all necessary security groups and IAM roles/policies.

**1. Introduction**

Infrastructure as Code (IaC) Deployment with Terraform
This document provides a detailed guide on how to set up and deploy the infrastructure for a front-
end and back-end application on AWS using Terraform. The infrastructure includes a VPC with
public and private subnets, EC2 instances, an Application Load Balancer, RDS (MySQL), and an
S3 bucket for static file storage.

**2. Prerequisites**
Prerequisites
• AWS account
• AWS CLI installed and configured
• Terraform installed

**3. Terraform Configuration (setup terraform.tfvars )**

The terraform.tfvars file will include the variables used in the project.
The below variables are used in the project .
terraform.tfvars
region = "us-west-1"
access_key = "YOUR_ACCESS_KEY"
secret_key = "YOUR_SECRET_KEY"
ami = "ami-12345678"
instance_type = "t2.micro"
db_username = "your_db_username"db_password = "your_db_password"

**Deployment Instructions**
1.** Initialize Terraform:**
terraform init
**2. Validate the Configuration:**
terraform validate
**3. Plan the Deployment:**
terraform plan
**4. Apply the Configuration:**
terraform apply

