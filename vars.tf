#Aviatrix
variable "A_controller_ip" {}
variable "A_username" {}
variable "A_password" {}
variable "A_account_name" {}
variable "A_account_password" {}
variable "A_account_email" {}
variable "A_account_number" {}

#AWS
variable "AWS_REGION" {
  default = "ca-central-1"
}
variable "AMIS" {
  type = "map"
  default = {
    ca-central-1 = "ami-018b3065"
  }
}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "gateways"{}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

