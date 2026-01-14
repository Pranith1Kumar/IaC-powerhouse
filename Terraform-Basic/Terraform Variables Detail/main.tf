resource "aws_instance" "env_instance" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = var.instance_type_mapping[var.environment]

  tags = {
    Name = "tf-${var.environment}-instance"
  }
}
