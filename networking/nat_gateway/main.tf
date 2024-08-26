resource "aws_eip" "nat_eip" {
  count = length(var.public_subnet_ids)
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  count = length(var.public_subnet_ids)

  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]

  tags = {
    Name = "${var.vpc_name}-nat-gw-${count.index + 1}"
  }
}
