# Provision Nginx on AWS EC2 using Terraform (Step-by-Step Guide)

## End Goal

Create an EC2 instance and automatically install Nginx web server using Terraform user_data, without logging into the server manually.

### Project Structure

.
├── main.tf
├── provider.tf

### Step 1: Create Project Directory

Open terminal and run:

```bash
mkdir terraform-nginx
cd terraform-nginx
```

## Step 2: Create Required Files

```bash
touch provider.tf
touch main.tf
```

## Step 3: Configure AWS Provider

Open `provider.tf` and add:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```


### Step 4: Create Security Group (Allow HTTP + SSH)

Open `main.tf` and add:

```hcl
resource "aws_security_group" "web_sg" {
  name = "allow_http_ssh"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow HTTP
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow SSH
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

### Step 5: Create EC2 Instance + Install Nginx

Add below in `main.tf`:

```hcl
resource "aws_instance" "nginx_server" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF

  tags = {
    Name = "terraform-nginx-server"
  }
}
```


### Step 6: Initialize Terraform

```bash
terraform init
```

This downloads AWS provider and sets up environment.

### Step 7: Check Plan

```bash
terraform plan
```

Shows what Terraform will create (EC2 + Security Group).

### Step 8: Apply Configuration

```bash
terraform apply
```

Type:

```bash 
yes
```

⏳ Wait for 1–2 minutes.

### Step 9: Get Public IP

Go to:

👉 AWS Console → EC2 → Instances

Copy the Public IPv4 Address

### Step 10: Verify Nginx Installation

Open browser and enter:

`http://<your-public-ip>`

You should see:

**Welcome to Nginx!**

### Step 11: Destroy Resources (Very Important)

```bash
terraform destroy
```

Type:

```bash
yes
```

**This deletes EC2 and avoids AWS charges.**


$$
{\Huge
\boldsymbol{
\color{purple}{\text{🎉 You Successfully Automated Server Setup with Terraform!}}
}
}
$$