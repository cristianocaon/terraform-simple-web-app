provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-1"
}

locals {
  default_user = "ec2-user"
}

resource "aws_security_group" "sec_grp" {
  name        = var.ec2_sec_grp_name
  description = "Allow HTTP/HTTPS and SSH ingress only from my IP address."

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami             = var.ec2_ami_id
  count           = var.ec2_count
  instance_type   = var.ec2_type
  key_name        = "private_key"
  security_groups = [aws_security_group.sec_grp.name]
  tags = {
    Name = var.ec2_name
  }
  user_data = base64encode(templatefile("user_data.yaml", {
    ssh_private_key      = var.ssh_key
    ssh_private_key_file = "/home/${local.default_user}/private_key.pem"
    default_user         = local.default_user
  }))
  user_data_replace_on_change = true
}
