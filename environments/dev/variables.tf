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