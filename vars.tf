#Aviatrix
variable "Aviatrix_controller_ip" {}
variable "Aviatrix_username" {}
variable "Aviatrix_password" {}
variable "Aviatrix_account_name" {}
variable "Aviatrix_account_password" {}
variable "Aviatrix_account_email" {}
variable "Aviatrix_account_number" {}

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
variable "PATH_TO_PRIVATE_KEY"{
  default = "canada.pem"
}

variable "count"{}
