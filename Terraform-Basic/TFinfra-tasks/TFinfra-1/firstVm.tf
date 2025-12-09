provider "aws" {
    access_key="ACCESS_KEY"
    secret_key="SECRECT_ACCESS_KEY"
    region="ap-south-1"
}
resource "aws_instance" "firstvm" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t3.micro"
}