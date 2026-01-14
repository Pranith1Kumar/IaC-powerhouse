# *Terraform State*

Terraform Variables allow you to parameterize infrastructure deployments, making Terraform configurations flexible, reusable, and environment-independent.

Instead of hardcoding values such as region, AMI ID, instance type, or resource count, Terraform variables let users pass configuration values dynamically during deployment.


## *Why Terraform Variables Are Important*

* Parameterize infrastructure deployments
* Allow users to pass configuration values at deployment time
* Avoid hardcoding values in Terraform files
* Make infrastructure code reusable across environments
* Improve security by keeping secrets out of Git repositories
* Enable dynamic configuration for elements like AMI IDs and instance sizes


## *Terraform Variable Basics*

* Variables are defined using variable blocks
* Commonly stored in a separate file: `variables.tf`
* Values can be passed using:
    * `terraform.tfvars`
    * Command-line flags (`-var`)
    * Environment variables

* Support multiple data types:
    * string, number, bool, list, map
    * Help keep Terraform files environment-agnostic

>[!IMPORTANT]
> Never store sensitive data such as AWS credentials directly in Terraform code or push them to Git repositories. Use variables or environment variables instead.


## *How Terraform Uses Variables*

Terraform Variables help to:

* Dynamically configure providers and resources
* Manage secrets securely
* Use the same Terraform across dev, test, and prod
* Reduce duplication and human error
* Enhance Terraform project readability and maintainability

When using `variables.tf`, the `provider.tf` file needs to be able to reference variables instead of static values in order for it to be "dynamic".


Let's Understand Terraform Variables using Hands-On Task

1. Define Variables

    Create a file named `variables.tf`:
    
    ```hcl
    variable "region" {
      description = "AWS region"
      type        = string
      default     = "ap-south-1"
    }
    
    variable "instance_type" {
      description = "EC2 instance type"
      type        = string
      default     = "t3.micro"
    }
    ```

2. Update Provider Configuration

    Modify `provider.tf` to use variables:
    
    ```hcl
    provider "aws" {
      region = var.region
    }
    ```

3. Use Variables in Resource Definition

    ```hcl
    resource "aws_instance" "demo_instance" {
      ami           = "ami-0ade68f094cc81635"
      instance_type = var.instance_type
    }
    ```

4. Initialize and Apply

    ```hcl
        terraform init
        terraform plan
        terraform apply
    ```


    Terraform reads values from variables and deploys the infrastructure accordingly.

5. Modify Variables and Reapply

    Change values in terraform.tfvars or variables.tf, then run:

    ```hcl
    terraform plan
    terraform apply
    ```


    Terraform updates resources and reflects changes automatically.


$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the New Topic in Terraform!}}
}
}
$$