# Para encontrar o owner id: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html
data "aws_ami" "ubuntu_server" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "tutorial" {
  tags = {
    Name = "tutorial-${terraform.workspace}"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.tutorial.id

  tags = {
    Name = "public-tutorial-${terraform.workspace}-${lookup(var.tags["values"], "Region")}*"
  }
}

data "aws_subnet" "public" {
  count = "${length(data.aws_subnet_ids.public.ids)}"
  id    = "${tolist(data.aws_subnet_ids.public.ids)[count.index]}"
}

resource "aws_instance" "tutorial" {
  count                       = 1
  ami                         = data.aws_ami.ubuntu_server.id
  instance_type               = var.instance_type[terraform.workspace]
  vpc_security_group_ids      = [aws_security_group.tutorial_sg.id]
  subnet_id                   = "${tolist(data.aws_subnet_ids.public.ids)[count.index]}"
  key_name                    = var.ssh_key
  associate_public_ip_address = true

  tags = "${merge(var.tags["values"])}"
}
