#Aviatrix
variable "A_controller_ip" {}
variable "A_username" {}
variable "A_password" {}
variable "A_account_name" {}
variable "A_account_password" {}
variable "A_account_email" {}
variable "A_account_number" {}

#AWS
variable "AWS_REGION" {}
variable "AMIS" {
  type = "map"
  default = {
    ca-central-1 = "ami-018b3065"
    us-east-1    = "ami-aa2ea6d0"
    us-east-2    = "ami-82f4dae7"
    us-west-1    = "ami-45ead225"
    us-west-2    = "ami-0def3275"

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

