variable "aws_region" {}
variable "vpc_cidr" {}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}

variable "data_disks" {
  type = list(object({
    size = number
    type = string
  }))
}

variable "tags" {
  type = map(string)
}
