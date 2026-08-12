data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
}

resource "aws_instance" "debian" {
  ami           = data.aws_ami.debian.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}