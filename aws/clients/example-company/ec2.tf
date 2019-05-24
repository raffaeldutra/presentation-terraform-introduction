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

resource "aws_instance" "ec2_machine" {
  ami             = "${data.aws_ami.ubuntu_server.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.example_company.name}"]
  key_name        = "${var.ssh_key}"

  tags = {
    Name        = "App Instance"
    Environment = "Production"
    ClientName  = "Example Company"
  }
}

output "aws_instance_ip" {
  value = "${aws_instance.ec2_machine.public_ip}"
}

output "aws_instance_public_dns" {
  value = "${aws_instance.ec2_machine.public_dns}"
}
