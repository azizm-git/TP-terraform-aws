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