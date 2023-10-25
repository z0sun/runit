provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}
############### VPC ######################
resource "aws_vpc" "deploy5_1vpc" {
  cidr_block         = var.cidr_block
  instance_tenancy   = "default"
  enable_dns_support = true
  tags = {
    Name = "deploy5.1vpc"
  }
}

# ################ INTERNET GATEWAY #############

resource "aws_internet_gateway" "d5_1gw" {
  vpc_id = aws_vpc.deploy5_1vpc.id

  tags = {
    Name = "d5.1gw"
  }
}

resource "aws_default_route_table" "d5_1dft" {
  default_route_table_id = aws_vpc.deploy5_1vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.d5_1gw.id
  }
}

############## SUBNETS #################
resource "aws_subnet" "deploy5_1sub1" {
  vpc_id                  = aws_vpc.deploy5_1vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet1"
  }
}
resource "aws_subnet" "deploy5_1sub2" {
  vpc_id                  = aws_vpc.deploy5_1vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet2"
  }
}
################ SECURITY GROUP ##################
resource "aws_security_group" "d5_1sgs" {
  name        = "d5.1sgs"
  description = var.description
  vpc_id      = aws_vpc.deploy5_1vpc.id
  # Ingress rule for port 8000
  ingress {
    description = "Allow port 8000"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Ingress rule for port 8080
  ingress {
    description = "Allow port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Ingress rule for port 22
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Default egress rule to allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name      = "allow_selected_ports"
    Terraform = "true"
  }
}
############# INSTANCES ##################


resource "aws_instance" "d5_1jenkins" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [aws_security_group.d5_1sgs.id]
  subnet_id                   = aws_subnet.deploy5_1sub1.id
  user_data                   = base64encode(file("userdata_jenkins.sh"))
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Jenkins Server"
  }
}

resource "aws_instance" "d5_1app_python" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [aws_security_group.d5_1sgs.id]
  subnet_id                   = aws_subnet.deploy5_1sub2.id
  user_data                   = base64encode(file("userdata_py.sh"))
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Application"
  }
}

resource "aws_instance" "d5_1app_python2" {
  ami                         = var.ami
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [aws_security_group.d5_1sgs.id]
  subnet_id                   = aws_subnet.deploy5_1sub2.id
  user_data                   = base64encode(file("userdata_py.sh"))
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Application2"
  }
}
