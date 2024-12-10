variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = ""
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = ""
}

variable "availability_zone" {
  type        = string
  description = "CIDR block for VPC"
  default     = ""
}

variable "env_prefix" {
  type        = string
  description = "CIDR block for VPC"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = ""
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = ""
}

variable "ssh_key_name" {
  type        = string
  description = "AWS EC2 SSH key used to connect to instances"
  default     = ""
}
