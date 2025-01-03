# main.tf
# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1" # Ireland region
}

# Create a VPC Security Group
resource "aws_security_group" "java_app_sg" {
  name        = var.app_sg_name
  description = "Security group for EC2 instance"

  tags = {
    Name = var.app_sg_name
  }
}

# NSG Rules
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_22" {
  security_group_id = aws_security_group.java_app_sg.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.java_app_sg.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_out_all" {
  security_group_id = aws_security_group.java_app_sg.id
  ip_protocol       = "All"
  cidr_ipv4         = var.vpc_ssh_inbound_cidr
  tags = {
    Name = "Allow_Out_all"
  }
}

# Resource to create
resource "aws_instance" "java_app_instance" {
  ami           = var.app_ami_id
  instance_type = var.app_instance_type

  associate_public_ip_address = var.app_associate_pub_ip
  vpc_security_group_ids      = [aws_security_group.java_app_sg.id]
  key_name                    = var.ssh_key_name

  tags = {
    Name = var.app_instance_name
  }

# User data with file templating 
  user_data = templatefile("../minikube-files/prov.sh", {
    APP_DEPLOYMENT_YML      = file("../minikube-files/app-definitions.yml"),
    DATABASE_DEPLOYMENT_YML = file("../minikube-files/database-definitions.yml"),
    DATABASE_SEED_SQL       = file("../minikube-files/library.sql"),
    APP_PROVISIONING_SH     = file("../minikube-files/prov.sh")
  })
}

# Optional: Output the public IP
output "instance_public_ip" {
  value       = aws_instance.java_app_instance.public_ip
  description = "The public IP address of the EC2 instance"
}
