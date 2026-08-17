module "ec2" {
  source = "../../modules/aws-instance"

  instance_type = var.instance_type
  instance_name = var.instance_name
  my_ip         = var.my_ip
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr   = "10.0.1.0/24"
  hostname      = var.hostname
  users         = var.users
  password_hash = var.password_hash
}
