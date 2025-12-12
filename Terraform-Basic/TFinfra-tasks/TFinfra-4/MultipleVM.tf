resource "aws_instance" "MyFirstInstance" {
  count         = 3
  ami           = "ami-0ade68f094cc81635"
  instance_type = "t3.micro"

  tags = {
    Name = "demoinstance-${count.index}"
  }
}