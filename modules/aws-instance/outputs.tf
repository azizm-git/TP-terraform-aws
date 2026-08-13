output "instance_id" {
  value = aws_instance.debian.id
}

output "public_ip" {
  value = aws_instance.debian.public_ip
}

output "ami_id" {
  value = data.aws_ami.debian.id
}