#Aviatrix
provider "aviatrix" "example"{
  controller_ip = "${var.A_controller_ip}"
  username = "${var.A_username}"
  password = "${var.A_password}"
}

#AWS
provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
}

