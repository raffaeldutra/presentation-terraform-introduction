# Internet gateway for the public subnet
resource "aws_internet_gateway" "tutorial" {

  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${merge(var.tags["values"],
    map(
    "Name", format("%s-%s", "igw" ,lookup(var.tags["values"], "Name"))
  ))}"
}