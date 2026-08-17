data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.instance_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.instance_name}-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.instance_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.instance_name}-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "ssh" {
  name        = "${var.instance_name}-sg"
  description = "Autorise SSH depuis une IP definie"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_sensitive_file" "ssh" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${path.root}/${var.key_name}.pem"
  file_permission = "0600"
}

resource "aws_instance" "debian" {
  ami                    = data.aws_ami.debian.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name               = aws_key_pair.ssh.key_name

  user_data = templatefile("${path.module}/templates/cloud-init.yaml.tpl", {
    hostname       = var.hostname
    username       = var.username
    password_hash  = var.password_hash
  })

  user_data_replace_on_change = true

  tags = {
    Name = var.instance_name
  }
}