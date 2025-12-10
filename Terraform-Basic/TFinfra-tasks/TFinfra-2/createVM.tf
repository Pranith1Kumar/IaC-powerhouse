resource "aws_instance" "MyFirstInstnace" {
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t3.micro"
}