#VPC-GW
resource "aviatrix_gateway" "VPC-W" {
  count = "${var.gateways}"
  cloud_type = 1
  account_name = "${aviatrix_account.example.account_name}"
  gw_name = "VPC-GW-${count.index}"
  vpc_id = "${element(aws_vpc.VPC.*.id,count.index)}"
  vpc_reg = "ca-central-1"
  vpc_size = "t2.micro"
  vpc_net = "${element(aws_subnet.VPC-public.*.cidr_block,count.index)}"
}


#Prem-VPC-GW
resource "aviatrix_gateway" "On-Prem-VPC-GW" {
  cloud_type = 1
  account_name = "${aviatrix_account.example.account_name}"
  gw_name = "On-Prem-VPC-GW"
  vpc_id = "${aws_vpc.Prem-VPC.id}"
  vpc_reg = "ca-central-1"
  vpc_size = "t2.micro"
  vpc_net = "${aws_subnet.Prem-VPC-public.cidr_block}"
  depends_on = ["aviatrix_gateway.VPC-GW"]
}


