provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "app_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name: "${var.prefix}-vpc"
    }
}

resource "aws_subnet" "app_subnet" {
    vpc_id = aws_vpc.app_vpc.id
    availability_zone = var.avail_zone
    cidr_block = var.subnet_cidr

    tags = {
        Name: "${var.prefix}-subnet"
    }

}

resource "aws_internet_gateway" "app_igw" {
    vpc_id = aws_vpc.app_vpc.id

    tags = {
        Name: "${var.prefix}-igw"
    }
}

resource "aws_default_route_table" "app_rtb" {
    default_route_table_id = aws_vpc.app_vpc.default_route_table_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.app_igw.id
    }

    tags = {
        Name: "${var.prefix}-rtb"
    }
}

resource "aws_security_group" "app_sec_group" {
    name = "app_sec_group"
    vpc_id = aws_vpc.app_vpc.id

    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.my_ip]
        protocol = "TCP"
    }
      ingress {
        from_port = 8080
        to_port = 8080
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "TCP"
    }

      egress {
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
    }

    tags = {
        Name: "${var.prefix}-scg"
    }
}

data "aws_ami" "app_ami" {
    most_recent = true
    owners = [var.ami_owner]

    filter {
        name = "name"
        values = ["amzn2-ami-kernel-*-x86_64-gp2"]
    }
}

resource "aws_key_pair" "app_key" {
    key_name = "app_key"
    public_key = file(var.app_key)

    tags = {
        Name: "${var.prefix}-key_pair"
    }
}

resource "aws_instance" "app_instance" {
    ami = data.aws_ami.app_ami.id
    availability_zone = var.avail_zone
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.app_sec_group.id]
    key_name = aws_key_pair.app_key.key_name
    subnet_id = aws_subnet.app_subnet.id
    instance_type = var.my_instance

    user_data = file("script.sh")

    tags = {
        Name: "${var.prefix}-instance"
    }
}