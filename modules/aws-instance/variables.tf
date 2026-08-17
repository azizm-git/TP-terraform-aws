variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "my_ip" {
  type = string
}

variable "hostname" {
  type = string
}

variable "users" {
  type = map(string)
}

variable "password_hash" {
  type      = string
  sensitive = true
}