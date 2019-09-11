# Criando Máquina Virtual com EC2

```
resource "aws_instance" "web" {
  ami           = "ami-8eecc9e2"
  instance_type = "t2.micro"


  tags {
    Name        = "Web",
    Application = "Application 1"
  }
}
```

```
terraform plan
```

Com o seguinte resultado:

```
```