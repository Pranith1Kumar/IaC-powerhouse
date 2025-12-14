# *Terraform State*

Terraform State is a critical component that allows Terraform to understand what infrastructure already exists and what needs to change.

Terraform uses the state file to map real-world resources to the resources defined in your Terraform code. Without the state file, Terraform cannot reliably manage or modify infrastructure.


## *Why Terraform State Is Important*

* Terraform State is essential for resource tracking
* It helps Terraform identify what has already been deployed
* Used to determine what to create, update, or destroy
* Plays a key role in Terraform’s core functionality
* Without state, Terraform cannot safely manage infrastructure.


## *Terraform State File Basics*

* Stored as a flat file
* Default name: `terraform.tfstate`
* Created automatically after running `terraform apply`
* Stored in the same working directory by default
* Can also be stored remotely (S3, Terraform Cloud, etc.)
* Used by `terraform plan` to calculate deployment differences (deltas)

> [!IMPORTANT]
> Never delete or lose your Terraform state file. Losing it can lead to orphaned resources, duplicate infrastructure, or unexpected charges.


## *How Terraform Uses the State File*

Terraform State helps to:

* Track the current infrastructure
* Compare desired state (code) vs actual state
* Generate accurate execution plans
* Enable safe updates and deletions
* Support collaboration when stored remotely

# *Let's Understand Terraform State using Hands-On Task*

1. Create a Simple EC2 Instance

   Use a basic Terraform configuration to create one EC2 instance.

- Refer [TFinfra-1 Task to create a simple EC2 instance](https://github.com/Pranith1Kumar/IaC-powerhouse/tree/2a060a6acf4eafd05ebec15686e0255868962557/Terraform-Basic/TFinfra-tasks/TFinfra-1)


    ```bash
    terraform init
    terraform apply
    ```

2. Observe the State File

    After apply completes, run:

    ```bash
    ls
    ```

    You will see:
    
    ```bash
    terraform.tfstate
    terraform.tfstate.backup
    ```

    Open the state file:

    ```bash
    cat terraform.tfstate
    ```

    You’ll notice Terraform storing:
    
    * Resource IDs
    * Instance details
    * Region
    * Metadata

3. Modify the Infrastructure

   Update your code to change something simple, for example:
    * Instance type (t3.micro to t4g.micro)
    * Instance count (1 increase it to 2)

    Then run:
    
    ```bash
    terraform plan
    ```
    
    Terraform compares:
    
    * State file (what exists)
    * Updated code (what you want)


4. Apply the Changes

    ```bash
    terraform apply
    ```

    Terraform updates the infrastructure and updates the state file automatically.

5. Destroy and Observe State Update

    ```bash
    terraform destroy
    ```

    Terraform removes:
    
    * The resource
    * The resource entry from the state file


$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the New Topic in Terraform!}}
}
}
$$