# *Terraform EC2 Provisioning with Centralized Credential Management*

## 1. Navigate to the Working Directory

```bash
cd Terraform-Basic/TFinfra-tasks/TFinfra-2
```

Make sure you are on the correct Git branch:

```bash
git branch
```

## 2. AWS Authentication Setup
    
* Login to AWS Console
* Go to IAM → Users → Security credentials
* Generate AWS Access Key & Secret Key
* Configure credentials locally:

    ```bash
    aws configure
    ```

Terraform uses these credentials to authenticate with AWS.

>[! NOTE]
>Never hardcode credentials in provider.tf for real projects.

>Use environment variables or IAM roles instead.

## 3. Terraform Configuration Files

For using Provider [use this provider.tf file](https://github.com/Pranith1Kumar/IaC-powerhouse/blob/e246c643c2acf43afcc557fda3f772da5e1894e3/Terraform-Basic/TFinfra-tasks/TFinfra-2/provider.tf)

For Creating an instance [use this createVM.tf file](https://github.com/Pranith1Kumar/IaC-powerhouse/blob/e246c643c2acf43afcc557fda3f772da5e1894e3/Terraform-Basic/TFinfra-tasks/TFinfra-2/createVM.tf)


## 4. Initialize Terraform

* First attempt without initialization will fail:

```bash
terraform plan
```
* Run initialization:

```bash
terraform init
```
This will:

* Download AWS provider from Terraform Registry
* Create .terraform/ directory
* Generate .terraform.lock.hcl

## 5. Plan the Infrastructure

```bash
terraform plan
```

Terraform shows:

What resource will be created

No changes are applied yet

## 6. Apply the Configuration

```bash
terraform apply
```

Type yes when prompted.


## 7.Destroy the Instance (Free-Tier Safety)

```bash
terraform destroy
```

Type yes to confirm.

* Terraform references the state file to safely delete the exact resources it created.
* Always verify in the AWS Console that the instance is terminated.


$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the second IaC Terraform task!}}
}
}
$$