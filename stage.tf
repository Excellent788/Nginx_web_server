variable "instance_type" {
  type = string
  description = "instance type for ec2 instance"

}
variable "instance_ami" {
  type = string
  description = "AMI  id for ec2 instance"

}
variable "region" {
  type = string
  description = "Region where you want to deploy"

}
variable "tag_name" {
  type = string
  description = "Name of the instance"

}
variable "access_key" {
  type = string
  description = "access key to account"
}
variable "secret_key" {
  type = string
  description = "secret key to account"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for  the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The cide block for public subnet"
  type = string
  default = "10.0.1.0/24"
}