# Fetch the latest Amazon Linux Image (AMI) owned by AWS
data "aws_ami" "latest_ubuntu_20_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins-server" {
  ami           = data.aws_ami.latest_ubuntu_20_04.id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  subnet_id     = aws_subnet.jenkins_public.id
  vpc_security_group_ids = [
    aws_default_security_group.public_sg.id
  ]
  availability_zone           = aws_subnet.jenkins_public.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-script.sh")

  tags = {
    Name = "${var.env_prefix}-server"
  }
}
