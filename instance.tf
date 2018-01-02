#VPC
resource "aws_instance" "VPC-VM" {
  count = "${var.count}"
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(aws_subnet.VPC-public.*.id,count.index)}"

  # the security group
  vpc_security_group_ids = ["${element(aws_security_group.allow-ssh-ping-VPC.*.id,count.index)}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags{
    Name = "VPC-VM-${count.index}"
  }

  
}

#Prem VPC-0
resource "aws_instance" "Prem-VPC-VM" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.Prem-VPC-public.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh-ping-Prem.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

/*
  #ssh into instance
  provisioner "remote-exec" {
    inline = [
      "sleep 200"
    ]
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}" 
  }


  tags{
    Name = "Prem-VPC-VM"
  }
  depends_on = ["aviatrix_tunnel.tunnel2"]
*/
}




