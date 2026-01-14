# *Terraform Variables – Environment Switch Task*

This task demonstrates how Terraform Variables can be used to deploy the same infrastructure across multiple environments (dev / prod) without changing the core Terraform code.

The environment is controlled only through variables, making the setup flexible, reusable, and production-ready.

## *Objective*

* Use Terraform variables to switch environments
* Avoid hardcoding values
* Deploy environment-specific configurations dynamically
* Understand real-world usage of variables in IaC
* Variables Mastered – One Code, Multiple Environments!

## *Files Used*

* `variables.tf`
* `terraform.tfvars`
* `provider.tf`
* `main.tf`

### Step 1: Define Variables (`variables.tf`)

   Create variables to control the deployment environment and instance type mapping.
  * `environment`: Specifies the target environment (dev or prod)
  * `instance_type_mapping`: Maps environment names to EC2 instance types.

## Step 2: Set Environment (`terraform.tfvars`)

 Define the active environment using a variable value.
 
 Example:
  ```hcl
  environment = "dev"
  ```

 This allows switching environments without modifying Terraform code.

## Step 3: Configure AWS Provider (`provider.tf`)

 Specify the AWS provider and region where resources will be deployed.

 Ensure AWS credentials are already configured using AWS CLI or environment variables.

## Step 4: Define Infrastructure (`main.tf`)

 Create an EC2 instance that:

  * Selects instance type dynamically based on environment
  * Uses variable lookup from `instance_type_mapping`
  * Applies environment-specific tags

 Terraform automatically resolves the correct instance type based on the selected environment.

## Step 5: Initialize Terraform

 Run the following command to initialize the working directory:

 ```hcl
 terraform init
 ```

 This downloads required provider plugins.

## Step 6: Review Execution Plan

 Preview the infrastructure changes before deployment:

 ```hcl
 terraform plan
 ```

 Verify that the instance type and tags match the selected environment.

## Step 7: Apply Configuration

 Deploy the infrastructure:

 ```hcl
 terraform apply
 ```

 Confirm when prompted.

## Step 8: Verify Deployment

 * Log in to AWS EC2 Console.
 * Verify instance creation.
 * Confirm instance type and tag name reflect the selected environment.

## Step 9: Switch Environment (No Code Change)

 Edit terraform.tfvars:

  ```hcl
  environment = "prod"
  ```

 Re-run:

  ```hcl
  terraform plan
  terraform apply
  ```

 Terraform detects the environment change and updates the infrastructure accordingly.


### Expected Outcome

* EC2 instance is created based on the selected environment
* `dev` = `t3.micro`
* `prod` = `c7i-flex.large`

No Terraform code changes required to switch environments.

## Conclusion

This task demonstrates how Terraform variables and maps can be used to manage multiple environments efficiently, enabling scalable and maintainable infrastructure deployments.

$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the Fifth IaC Terraform task!}}
}
}
$$