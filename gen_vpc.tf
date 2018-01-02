# Internet VPC
resource "aws_vpc" "VPC" {
    count = "${var.gateways}"
    cidr_block = "10.1.${count.index}.0/24"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags {
        Name = "VPC-${count.index}"
    }
}

# Subnets
resource "aws_subnet" "VPC-public" {
    count = "${var.gateways}"
    vpc_id = "${element(aws_vpc.VPC.*.id,count.index)}"
    cidr_block = "10.1.${count.index}.0/24"
    map_public_ip_on_launch = "true"

    tags {
        Name = "VPC-public-${count.index}"
    }
}

# Internet GW
resource "aws_internet_gateway" "VPC-gw" {
    count = "${var.gateways}"
    vpc_id = "${element(aws_vpc.VPC.*.id,count.index)}"

    tags {
        Name = "VPC-gw-${count.index}"
    }
}

# route tables
resource "aws_route_table" "VPC-route" {
     count = "${var.gateways}"
    vpc_id = "${element(aws_vpc.VPC.*.id,count.index)}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${element(aws_internet_gateway.VPC-gw.*.id,count.index)}"
    }

    tags {
        Name = "VPC-route-${count.index}"
    }
}

# route associations public
resource "aws_route_table_association" "VPC-ra" {
    count = "${var.gateways}"
    subnet_id = "${element(aws_subnet.VPC-public.*.id,count.index)}"
    route_table_id = "${element(aws_route_table.VPC-route.*.id,count.index)}"
}


