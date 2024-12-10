terraform {
  required_version = "1.9.5"

  backend "s3" {
    # bucket = "jensins-kubernetes-app-2024-v2"
    # region = "us-west-1"
    # key    = "eks/terraform.tfstate"
  }
}
