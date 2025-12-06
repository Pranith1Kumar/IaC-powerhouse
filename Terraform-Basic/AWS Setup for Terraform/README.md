# **AWS Setup for Terraform**

1. Create an IAM User (Recommended for Beginners)

- Open AWS Console → IAM → Users → Create user
- **User name:** `terraform-user`
- Select Programmatic access
- Attach permissions:
    * AdministratorAccess (for learning only)
- Create user and save Access Key & Secret Key

2. Install AWS CLI (If Not Installed)

- On your Terraform execution machine:

```bash
sudo apt update
sudo apt install awscli -y
```

- Verify installation:

```bash
aws --version
```

3. Configure AWS Credentials

Run the following command:

```bash
aws configure
```

Enter the details:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name: `ap-south-2`
- Default output format: `json`
- Credentials are securely stored in:

```bash
~/.aws/credentials
```

4. Verify AWS Access

- Test your AWS authentication:

```bash
aws sts get-caller-identity
```

If valid, it will return your AWS account details.

5. Verify Terraform Can Connect to AWS

Inside your Terraform project directory:

```bash
terraform init
terraform validate
terraform plan
```

If no authentication errors appear, Terraform is successfully connected to AWS.