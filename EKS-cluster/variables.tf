variable "vpc_cidr_block" {
  type    = string
  default = ""
}

variable "private_subnet_cidr_blocks" {
  type    = set(string)
  default = [""]
}

variable "public_subnet_cidr_blocks" {
  type    = set(string)
  default = [""]
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "vpc_name" {
  type    = string
  default = ""
}

variable "bucket_name" {
  type        = string
  description = "AWS Bucket for backend provider"
  default     = ""
}

variable "bucket_region" {
  type        = string
  description = "AWS Bucket region for backend provider"
  default     = ""
}
