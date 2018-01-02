#Spoke-VPC-01
resource "aws_security_group" "allow-ssh-ping-VPC" {
  count = "${var.count}"
  vpc_id = "${element(aws_vpc.VPC.*.id,count.index)}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

tags {
    Name = "allow-ssh-ping"
  }
}

#Prem-VPC
resource "aws_security_group" "allow-ssh-ping-Prem" {
  vpc_id = "${aws_vpc.Prem-VPC.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

tags {
    Name = "allow-ssh-ping"
  }
}
