# Public Subnet
resource "aws_subnet" "jenkins_public" {
  vpc_id                  = aws_vpc.current_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.current_vpc.id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

# Route Table
resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.current_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env_prefix}-route-table"
  }
}

resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.jenkins_public.id
  route_table_id = aws_default_route_table.public.id
}

# Security Group of the Jenkins server
resource "aws_default_security_group" "public_sg" {
  vpc_id = aws_vpc.current_vpc.id # Allow inbound TCP traffic on port 22 (SSH) from any source 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your actual IP
  }

  # Allow inbound TCP traffic on port 8080 (Jenkins) from any source.
  # This is the default port for Jenkins, so we open it to the Internet
  # because we will access it from a web browser
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  } # Allow all outbound traffic to any destination

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env_prefix}-default-sg"
  }
}
