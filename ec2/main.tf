provider "aws" {
  region = "us-east-1"
}

# Generate a key pair
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "generated-key-pair"
  public_key = tls_private_key.key.public_key_openssh
}

# Save the private key to a local file
resource "local_file" "private_key" {
  filename        = "${path.module}/generated-key.pem"
  content         = tls_private_key.key.private_key_pem
  file_permission = "0400"
}

resource "aws_instance" "ubuntu_hard" {
  ami           = "ami-08c0b02fa0560e6f3"
  instance_type = "t2.micro"

  key_name                    = aws_key_pair.key_pair.key_name
  associate_public_ip_address = true
}

output "instance_id" {
  value = aws_instance.ubuntu_hard.id
}

output "public_ip" {
  value = aws_instance.ubuntu_hard.public_ip
}

output "ami_id" {
  value = aws_instance.ubuntu_hard.ami
}

output "key_pair_name" {
  value = aws_key_pair.key_pair.key_name
}

output "private_key_path" {
  value = local_file.private_key.filename
}