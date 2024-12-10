variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr_blocks" {
  type = set(string)
  default = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]
}

variable "public_subnet_cidr_blocks" {
  type = set(string)
  default = [
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24"
  ]
}

variable "cluster_name" {
  type    = string
  default = "test-jenkins"
}

variable "vpc_name" {
  type    = string
  default = "eks-vpc"
}

variable "bucket_name" {
  type        = string
  description = "AWS Bucket for backend provider"
  default     = "paulopkl-jenkins-terraform-kubernetes"
}

variable "bucket_region" {
  type        = string
  description = "AWS Bucket region for backend provider"
  default     = "us-west-1"
}
