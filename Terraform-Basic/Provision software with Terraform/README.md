## Provision Software with Terraform

Provisioning software with Terraform means not only creating infrastructure (like EC2 instances) but also installing and configuring software automatically on those resources.

Instead of manually logging into a server and installing packages, Terraform allows you to automate this process using provisioners or user data scripts, making deployments faster, consistent, and repeatable.


### Why Software Provisioning is Important

- Automates software installation on infrastructure
- Eliminates manual configuration steps
- Ensures consistency across multiple machines
- Saves time and reduces human errors
- Helps in creating ready-to-use environments instantly


## Ways to Provision Software

1. Using Custom AMIs (Pre-Baked Images)
2. Installing Software at Runtime



1. **Using Custom AMIs (Pre-Baked Images)**

In this approach, you create an image that already contains all required software.

- Build a custom AMI with pre-installed software and configurations
- Use tools like **Packer** to create and manage these images
- Launch instances using this AMI
- No need to install software at runtime

✅ Advantages:

- Faster deployment
- Consistent environments
- Less runtime configuration



2. **Installing Software at Runtime**

In this approach, you launch a standard (base) AMI and install software after the instance starts.

This can be done using:

➤ **File Provisioner**

Upload files/scripts from local machine to instance

➤ **Remote-Exec Provisioner**

Run commands on the instance

➤**`local-exec`** 

Run commands on local machine

➤ **Configuration Management Tools**

**Chef** → Integrated with Terraform

**Puppet** → Can be executed using remote-exec

**Ansible** → Run after Terraform using instance IP

## How Terraform Works in Provisioning

Terraform focuses on deployment automation, not full configuration management.

- It can create infrastructure (EC2, VMs, networks)
- It can run basic provisioning scripts
- For advanced configuration, it integrates with tools like:
    - Chef
    - Puppet
    - Ansible

Example workflow with Ansible:

- Terraform creates the instance
- Fetch the public IP
- Run **Ansible** playbook on that instance


## When to Use What?

| Approach     | Best For                     |
| ------------ | ---------------------------- |
| Custom AMI   | Production, fast deployments |
| Remote Exec  | Quick setup, small tasks     |
| Ansible/Chef | Large-scale configuration    |


# Example: Install Nginx on EC2 using User Data

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-server"
  }
}
```


## How Terraform Uses Provisioning

Terraform will:

- Create the EC2 instance
- Run the script during launch
- Install and start Nginx automatically
- Make the server ready without manual login

## Best Practices
- Prefer user_data over provisioners
- Keep scripts simple and idempotent
- Avoid hardcoding sensitive data
- Use configuration management tools (Ansible) for complex setups
- Use Terraform only for initial provisioning, not full configuration management

**Let's do practical**

Click here for Task: 

[*Provision software with terraform* ↗](https://github.com/Pranith1Kumar/IaC-powerhouse/tree/6aa5e49bfaafdbee84b92deac66337fcb646d72b/Terraform-Basic/TFinfra-tasks/TFinfra-6)