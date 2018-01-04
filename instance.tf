#VPC
resource "aws_instance" "Linux-" {
  count = "${var.gateways}"
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${element(aws_subnet.VPC-public.*.id,count.index)}"

  # the security group
  vpc_security_group_ids = ["${element(aws_security_group.allow-ssh-ping-VPC.*.id,count.index)}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags{
    Name = "Linux-${count.index}"
  }

  
}

#Prem VPC-0
resource "aws_instance" "Linux-On-Prem" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.Prem-VPC-public.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh-ping-Prem.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags{
    Name = "Linux-On-Prem"
  }
 
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

  depends_on = ["aviatrix_tunnel.tunnel2"]
*/
}

output "public_ip"{
  value = ["${aws_instance.Linux-.*.id},${aws_instance.Linux-.*.public_ip}"]
}

output "private_ip"{
  value = ["${aws_instance.Linux-.*.id},${aws_instance.Linux-.*.private_ip}"]
}

output "On-Prem-ip"{
  value = ["${aws_instance.Linux-On-Prem.id},${aws_instance.Linux-On-Prem.public_ip},${aws_instance.Linux-On-Prem.private_ip}]
}
