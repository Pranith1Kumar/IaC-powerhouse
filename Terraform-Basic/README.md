#  *Terraform with IaC*

#### Terraform automates the way infrastructure is defined and deployed across cloud environments. It supports a wide range of public cloud providers, including AWS, Azure, GCP, Kubernetes, and OCI.
### [↗ Click to explore more Terraform providers](https://registry.terraform.io/browse/providers)



### Terraform Registry
#### The Terraform Registry is an official catalog where you can find verified providers and reusable modules. It enables you to easily integrate cloud services, reuse community modules, and simplify infrastructure automation.

#### With Terraform, you can reuse the same code to deploy consistent environments across multiple clouds. It also manages state files to track the current status of every resource, ensuring accurate and reliable infrastructure management.

### Terraform Core Tool for IaC

Terraform is one of the most widely used IaC tools. It enables you to:

* Write infrastructure definitions using HCL (HashiCorp Configuration Language)
* Deploy cloud resources across providers (AWS, Azure, GCP, etc.)
* Plan changes before applying using terraform plan
* Manage infra state using terraform.tfstate
* Ensure predictable deployments using modules and workspaces.

### Terraform Workflow

* Write Terraform Configuration – Begin defining your infrastructure using HCL.
* Plan Infrastructure – Review and validate the proposed changes before deployment.
* Deploy Infrastructure – Apply the changes to provision or update the infrastructure.

<img width="1000" height="550" alt="image" src="https://github.com/user-attachments/assets/c1f1d927-aaa7-433b-835c-5ea84aaa71f2" >


## **Installing & Setting Up Terraform**

### **Install for any system**
[https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

### **Manual Installation Steps**

### 1. Download Terraform ZIP:
[https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
2. Extract the ZIP.

3. Move terraform.exe to:

```bash
C:\Windows\System32\
```

4. Verify installation:

```bash
terraform -version
```

## Initial Setup After Installation
[Initial Setup After Installation](https://github.com/Pranith1Kumar/IaC-powerhouse/tree/53184934e12a33b346c90b4a0112fd8ef7c352f3/Terraform-Basic/Initial%20Setup%20After%20Installation)

To use Terraform, we need at least one provider from the Terraform Registry. For beginners, the easiest and most widely used provider is AWS.

## AWS Terraform Provider:

[https://registry.terraform.io/providers/hashicorp/aws/latest](https://registry.terraform.io/providers/hashicorp/aws/latest)

### Setup AWS Account to use Terraform

[https://aws.amazon.com/free/](https://aws.amazon.com/free/)


### Create a Cloud Machine for Terraform Execution

You can run Terraform from your local system, but using a cloud machine (VM) is cleaner, team-friendly, and works well for DevOps workflows.

Below are the steps using AWS EC2 (beginner-friendly).

1. Launch an EC2 Instance

* Go to AWS Console → EC2 → Launch Instance
* Name: terraform-exec-machine
* AMI: Ubuntu 22.04 LTS
* Instance type: t2.micro (Free Tier)
* Key pair: Create/download a new one
* Security group: Allow SSH (22) from My IP
* Storage: Default (8GB) is enough
* Launch the instance

2. Connect to the Instance (SSH)

On your laptop terminal:

```bash
ssh -i your-key.pem ubuntu@<EC2-Public-IP>
```

3. Update System Packages
```bash
sudo apt update && sudo apt upgrade -y
```

4. Install Terraform [↗](https://developer.hashicorp.com/terraform/install)

Copy the Ubuntu/Debain install command


```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Verify:

```bash
terraform -version
```

5. Install AWS CLI
```bash
sudo apt install awscli -y
```

Check:
```bash
aws --version
```

6. Configure AWS Credentials

You need IAM user access keys.

Run:
```bash
aws configure
```

Enter:

* AWS Access Key
* AWS Secret Key
* Region (ap-south-1 for Hyderabad/Mumbai)
* Output format (json)

7. Create a Terraform Project Directory

```bash
mkdir terraform-project
cd terraform-project
touch main.tf
```

8. Initialize Terraform
```bash
terraform init
```

9. You are ready to run Terraform

Now you can run:

```bash
terraform plan
terraform apply
terraform destroy
```

## Terraform Commands (Power House Commands)

1. $${\color{purple} terraform init }$$ – Initializes the working directory that contains your Terraform code.
* During initialization, Terraform downloads the required providers, modules, and plugins.
* It also sets up the backend where Terraform will store its state file.

(We’ll discuss state files in detail later.)

2. $${\color{purple} terraform plan }$$ – After initialization, Terraform reads your configuration and generates an execution plan. 
* It does not deploy anything; it simply shows what changes will be made to the infrastructure. 
* This allows you to review and verify the proposed actions before applying them.
* Terraform also authenticates the credentials used to connect to your cloud infrastructure during this step.

3. $${\color{purple} terraform apply }$$ – This command deploys the infrastructure exactly as defined in your Terraform configuration. 
* It executes the actions shown in the plan and provisions, updates, or destroys resources as needed.
* After deployment, Terraform updates the state file, which keeps track of all resources it manages.
* Any changes made during deployment are recorded, ensuring the state file and your code remain in sync.

(I discussed above let's discuss state files in detail later.)

>[!IMPORTANT]
> $${\color{purple} terraform destroy }$$ is a dangerous, irreversible command that permanently deletes all infrastructure managed by Terraform—use it with extreme caution.

> [!CAUTION]
>  4. $${\color{purple} terraform destroy }$$ – This command reads the state file to identify all resources created during deployment and then deletes them. 
* It removes the entire infrastructure managed by Terraform.
* Use it carefully, as it is not reversible and will permanently destroy all tracked resources.


# **Terraform Providers & Initialization**

Terraform interacts with cloud providers, SaaS providers, and other APIs using plugins known as providers.

Terraform configurations must specify which providers are required so that Terraform may install and utilize them.  In addition, some providers require setup (such as endpoint URLs or cloud regions) before they may be utilized.

[Terraform Providers & Initialization](https://github.com/Pranith1Kumar/IaC-powerhouse/tree/f6a92c0f3a7b818887f79a27eb9085ee179ed4da/Terraform-Basic/Terraform%20Providers%20%26%20Initialization)
