resource "aws_vpc" "EksVPC" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}
