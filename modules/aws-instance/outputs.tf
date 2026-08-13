output "instance_id" {
  value = aws_instance.debian.id
}

output "public_ip" {
  value = aws_instance.debian.public_ip
}

output "ami_id" {
  value = data.aws_ami.debian.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "security_group_id" {
  value = aws_security_group.ssh.id
}

output "ssh_command" {
  value = "ssh -i ${var.key_name}.pem admin@${aws_instance.debian.public_ip}"
}