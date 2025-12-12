resource "aws_instance" "MyFirstInstance_usingenv" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t3.micro"
}