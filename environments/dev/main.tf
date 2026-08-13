module "ec2" {
  source = "../../modules/aws-instance"

  instance_type = var.instance_type
  instance_name = var.instance_name
}