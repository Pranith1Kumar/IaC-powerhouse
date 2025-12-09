## **Create a VM in AWS Using Terraform**

You can use any folder for your Terraform project.

1. Create a directory manually, if using CLI follow below commands

```bash
pwd                      # Check current path
mkdir TFinfra-1          # Create a new directory
cd TFinfra-1             # Move into it

```
2. Create AWS Access Keys

* Log in to the AWS Management Console.
* Navigate to IAM, Users, Your User, Security credentials.
* Create an Access Key (for programmatic access).
* Download .`csv` / Note down:
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY

These will be used by Terraform to create resources in your AWS account.

3. Configure AWS Credentials (on your local/Virtual Machine)

On the machine where you run Terraform:

```bash
aws configure
```

Enter your access key, secret key, region (e.g. ap-south-1), and output format (json).

4. Create Your Terraform File

- Create a file with .tf extension, for example:

```bash
touch firstvm.tf # Use any one from below
vim firstvm.tf
```

- Add your Terraform AWS provider + EC2 VM code into firstvm.tf (example name: firstvm.tf).
- Copy `firstvm.tf` code and paste in your file.

5. Initialize Terraform

```bash
terraform init
```

This downloads providers and prepares the working directory. This will initializes the working directory that contains your Terraform code.

* During initialization, Terraform downloads the required providers, modules, and plugins.
* It also sets up the backend where Terraform will store its state file.

6. Terraform Plan to verify our requirements

```bash
terraform plan
```

7. Terraform Apply

This command deploys the infrastructure exactly as defined in your Terraform configuration. 

```bash
terraform apply
```

Terraform will show a plan and then ask for confirmation. Type yes to create the VM.

Once created, go to the EC2 console and check the instance status – make sure "3/3 checks passed" before using it.

8. Destroy the Instance (Free Tier Safety)

Since you’re using Free Tier, always clean up:

```bash
terraform destroy
```

Confirm with yes.

Then double-check in the AWS console that the instance is terminated to avoid charges.


## **Using Saved Plans**

Even after destroying the VM, Terraform still has your configuration.


1. Create and save a plan:

```bash
terraform plan -out vm-plan.out
```
![Save plan]()


2. Apply from the saved plan:

```bash
terraform apply vm-plan.out
```

3. After the instance passes checks, destroy again:

```bash
terraform destroy
```

This shows how IaC lets you recreate and delete the same infrastructure repeatedly with full control.