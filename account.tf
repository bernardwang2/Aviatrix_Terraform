resource "aviatrix_account" "example"{
  account_name = "${var.A_account_name}"
  account_password = "${var.A_account_password}"
  account_email = "${var.A_account_email}"
  cloud_type = 1
  aws_account_number = "${var.A_account_number}"
  aws_access_key = "${var.AWS_ACCESS_KEY}"
  aws_secret_key = "${var.AWS_SECRET_KEY}"
}

