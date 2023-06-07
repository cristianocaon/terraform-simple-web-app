provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = "us-east-1"
}

resource "aws_key_pair" "ssh_key" {
  key_name = "ssh_key"
  public_key = file("simple-web-app-terraform.pub")
}

resource "aws_instance" "ec2_instance" {
  ami = var.ec2_ami_id
  count = var.ec2_count
  instance_type = var.ec2_type
  key_name = aws_key_pair.ssh_key.key_name
  security_groups = [var.ec2_sec_grp]
  tags = {
    Name = var.ec2_name
  }
  user_data = file("user_data.sh") 
}

resource "aws_security_group" "ec2_sec_grp" {
  name = var.ec2_sec_grp
  description = "Allow HTTP/HTTPS and SSH ingress only from my IP address."

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["99.104.233.184/32"]
  }

  egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
}
