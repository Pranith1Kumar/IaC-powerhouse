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
