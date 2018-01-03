resource "aviatrix_transpeer" "test_transpeer1" {
  count = "${var.gateways - 1}"
  source = "${element(aviatrix_gateway.VPC-GW.*.id,count.index+1)}"
  nexthop = "${aviatrix_gateway.VPC-GW.0.id}"
  reachable_cidr = "${aviatrix_gateway.Prem-VPC-GW.vpc_net}"
  depends_on = ["aviatrix_tunnel.final_tunnel"]
}

resource "aviatrix_transpeer" "test_transpeer2" {
  source = "${aviatrix_gateway.On-Prem-VPC-GW.id}"
  nexthop = "${aviatrix_gateway.VPC-GW.0.id}"
  reachable_cidr = "10.1.0.0/16"
  depends_on = ["aviatrix_tunnel.final_tunnel"]
}

