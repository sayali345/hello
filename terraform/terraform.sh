
============== execute terraform.sh ===============


#!/bin/bash
sudo apt install wget -y
sudo apt-get update && sudo apt-get install -y wget gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null


gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list


sudo apt update

sudo apt-get install terraform -y


sudo apt install -y awscli
aws --version





=============== create IAM USER ============

create IAM USER  in ec2  
 
create group in iam user ------> select command cli 

copy the access key and secret key 

generate key pair in user .pem key ---> copy the key and paste in the Debian ssh  ---> create new file(mykey) in .ssh


======================= in Debian ============= 


create directory --- inside 
	main.tf
	output.tf 
	variable.tf 


===================== main.tf =========================



provider "aws" {
  region = var.region
}

resource "aws_instance" "debian_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "Debian-Terraform-EC2"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Use your IP/CIDR for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



====================== output.tf = ==============================



output "instance_ip" {
  value = aws_instance.debian_ec2.public_ip
  description = "The public IP address of the instance"
}

output "instance_id" {
  value = aws_instance.debian_ec2.id
  description = "The ID of the instance"
}


============================ variable.tf ========================= 

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Debian 12 AMI ID"
  default     = "ami-0779caf41f9ba54f0"  # Debian 12 (Bookworm) in us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Enter a key pair"
}




================== configuration in Debian -========================



aws configure 
paste access key 
secret key 
us-east-1 
json 
aws configure 
terraform init 
terraform plan 
terraform apply 

 	======if error occurs ======

	terraform  import aw-security_group allow_ssh sg-w08jsdfjo =------> give the security group  ssh id  in ec2 

== then do =====
	
	terraform init,plan,apply 



