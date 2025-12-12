# **Creating Multiple Instances on AWS**

Sometimes we need more than one virtual machine for example, to build a small cluster, create test environments, or deploy multiple identical servers. Terraform makes this easy using the `count` meta-argument.

Instead of writing the same resource block three times, we tell Terraform how many copies we want, and it will automatically create them.

Create 3 EC2 Instances Refer to `MultipleVM.tf` file for code.

What This Code Does (Simple Explanation)

* count = 3 → Terraform creates three identical EC2 instances.
* ${count.index} → Adds a unique number (0,1,2) to each instance name.
* All three instances use:
    - The same AMI
    - The same instance type
    - The same configuration

* Terraform will create:
    - demoinstance-0
    - demoinstance-1
    - demoinstance-2

This is a simple and powerful way to scale infrastructure without repeating code manually.

**Use Terraform Normally**

    ```bash
    terraform init
    terraform plan
    terraform apply
    ```

$$
{\Huge
\boldsymbol{
\color{purple}{\text{Hooray! You completed the fourth IaC Terraform task!}}
}
}
$$