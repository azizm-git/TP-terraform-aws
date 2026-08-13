output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "ami_id" {
  value = module.ec2.ami_id
}

output "vpc_id" {
  value = module.ec2.vpc_id
}

output "security_group_id" {
  value = module.ec2.security_group_id
}

output "ssh_command" {
  value = module.ec2.ssh_command
}