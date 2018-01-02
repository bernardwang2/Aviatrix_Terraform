resource "aviatrix_tunnel" "tunnel1"{
  count = "${var.gateways - 1}"
  vpc_name1 = "${element(aviatrix_gateway.VPC-GW.*.gw_name,count.index+1)}"
  vpc_name2 = "${aviatrix_gateway.VPC-GW.0.gw_name}"
  cluster   = "no"                                    
  over_aws_peering = "no"                           
  peering_hastatus = "disabled"                     
  depends_on = ["aviatrix_gateway.Prem-VPC-GW"]

}

resource "aviatrix_tunnel" "final_tunnel"{
  vpc_name1 = "${aviatrix_gateway.VPC-GW.0.gw_name}"
  vpc_name2 = "${aviatrix_gateway.Prem-VPC-GW.gw_name}"
  cluster   = "no"                                    
  over_aws_peering = "no"                           
  peering_hastatus = "disabled"                     
  depends_on = ["aviatrix_gateway.Prem-VPC-GW"]
}
