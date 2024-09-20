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