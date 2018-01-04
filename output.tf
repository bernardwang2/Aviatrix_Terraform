output "Linux-id"{
  value = ["${aws_instance.Linux-.*.id}"]
}

output "Linux_public_ip"{
  value = ["${aws_instance.Linux-.*.public_ip}"]
}

output "Linux_private_ip"{
  value = ["${aws_instance.Linux-.*.private_ip}"]
}

output "On-Prem-ip"{
  value = ["${aws_instance.Linux-On-Prem.id},${aws_instance.Linux-On-Prem.public_ip},${aws_instance.Linux-On-Prem.private_ip}]
}

