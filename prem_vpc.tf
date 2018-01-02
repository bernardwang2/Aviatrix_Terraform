# Internet VPC
resource "aws_vpc" "Prem-VPC" {
    cidr_block = "172.16.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "Prem-VPC"
    }
}

# Subnets
resource "aws_subnet" "Prem-VPC-public" {
    vpc_id = "${aws_vpc.Prem-VPC.id}"
    cidr_block = "172.16.0.0/16"
    map_public_ip_on_launch = "true"

    tags {
        Name = "Prem-VPC-public"
    }
}

# Internet GW
resource "aws_internet_gateway" "Prem-VPC-gw" {
    vpc_id = "${aws_vpc.Prem-VPC.id}"

    tags {
        Name = "Prem-VPC-gw"
    }
}

# route tables
resource "aws_route_table" "Prem-VPC-route" {
    vpc_id = "${aws_vpc.Prem-VPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.Prem-VPC-gw.id}"
    }

    tags {
        Name = "Prem-VPC-route"
    }
}

# route associations public
resource "aws_route_table_association" "Prem-VPC-ra" {
    subnet_id = "${aws_subnet.Prem-VPC-public.id}"
    route_table_id = "${aws_route_table.Prem-VPC-route.id}"
}

