variable "aws_region" {
  description = "Région AWS de déploiement"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Profil AWS CLI utilisé pour l'authentification"
  type        = string
  default     = "terraform"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "tp-debian"
}

variable "my_ip" {
  type    = string
  default = "31.32.13.89/32"
}

variable "hostname" {
  type    = string
  default = "Ec2-debian-demo"
}

variable "username" {
  type    = string
  default = "aziz"
}

variable "password_hash" {
  type      = string
  sensitive = true
}