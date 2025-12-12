# *Provide AWS Credentials Using Environment Variables*

Instead of hardcoding AWS Access Key and Secret Key inside your provider.tf file, you can store them securely as environment variables. This is a recommended and safer practice.


1. **Set Environment Variables**


    **Windows (PowerShell)**
    
    ```bash
    setx AWS_ACCESS_KEY_ID "your-access-key"
    setx AWS_SECRET_ACCESS_KEY "your-secret-key"
    setx AWS_DEFAULT_REGION "ap-south-1"
    ```

    Close and reopen the terminal after running these commands.
    
    **Linux / macOS**
    
    ```bash
    export AWS_ACCESS_KEY_ID="your-access-key"
    export AWS_SECRET_ACCESS_KEY="your-secret-key"
    export AWS_DEFAULT_REGION="ap-south-1"
    ```

2. **Update `provider.tf`**

    Remove hardcoded keys and use this clean provider block:
    
    ```hcl
    provider "aws" {
      region = "ap-south-1"
    }
    ```
    
    We have created a provider.tf in previous task remove/delete the file from directory.
    
    Terraform will automatically read your credentials from the environment variables.

3. **Validate Setup**

    Run:
    
    ```bash
    aws sts get-caller-identity
    ```

    If it returns your AWS account details → credentials are working.

4. **Use Terraform Normally**

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```


$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the third IaC Terraform task!}}
}
}
$$