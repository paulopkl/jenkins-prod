variable "key_name" {
  type        = string
  description = "SSH Key name"
  default     = ""
}

variable "windows-linux-username" {
  type        = string
  description = "Put exact the name of your current user, root is not recommended"
  default     = ""
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = ""
}
