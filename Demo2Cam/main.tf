#####################################################################
##
##      Created 1/23/19 by admin. for Demo2Cam
##
#####################################################################

## REFERENCE {"aws_network_LA":{"type": "aws_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "aws" {
  version = "~> 1.8"
}

data "aws_subnet" "subnet" {
  availability_zone = "${var.availability_zone}"
  vpc_id = "${var.vpc_id}"
}

resource "random_pet" "citi-pet" {  
}

resource "aws_instance" "aws_instance_LA" {
  ami = "${var.aws_instance_LA_ami}"
  key_name = "${aws_key_pair.auth.id}"
  instance_type = "${var.aws_instance_LA_aws_instance_type}"
  availability_zone = "${var.availability_zone}"
  subnet_id = "${data.aws_subnet.subnet.id}"
  tags {
    Name = "${random_pet.citi-pet.id}"  # random_pet
  }
}

resource "tls_private_key" "ssh" {
    algorithm = "RSA"
}

resource "aws_key_pair" "auth" {
    key_name = "${random_pet.citi-pet.id}"  # random_pet
    public_key = "${tls_private_key.ssh.public_key_openssh}"
}