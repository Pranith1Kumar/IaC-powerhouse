variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "instance_type_mapping" {
  description = "Instance type per environment"
  type        = map(string)
  default = {
    dev  = "t3.micro"
    prod = "c7i-flex.large"
  }
}