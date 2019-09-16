resource "aws_instance" "web" {
  ami           = "ami-0378588b4ae11ec24"
  instance_type = "t2.micro"

  tags = {
    Name        = "Web",
    Application = "Application 1"
  }
}
