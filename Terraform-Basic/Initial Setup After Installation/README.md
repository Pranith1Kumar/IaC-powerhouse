## **Initial Setup After Installation**

### Once Terraform is installed, follow these steps:

1. Create a project folder

```bash
mkdir terraform-project
cd terraform-project
```

2. Create your first Terraform file
```bash
touch main.tf
```
3. Initialize Terraform
```bash
terraform init
```

This downloads:

* Providers
* Modules
* Backend plugins

4. Validate the configuration
```bash
terraform validate
```
5. Format your Terraform code
```bash
terraform fmt
```
6. Create a plan
```bash
terraform plan
```
7. Apply the changes
``` bash
terraform apply
```
