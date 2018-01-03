output "public-ip"{
  value = ["${aws_instance.Linux.*.public_ip}"]
}
output "private-ip"{
  value = ["${aws_instance.Linux.*.private_ip}"]
}
output "user"{
  value = ["ubuntu"]
}
