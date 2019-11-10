output "ip_dev5" {
  value = "${aws_instance.dev5.public_ip}"
}

output "ip_dev6" {
  value = "${aws_instance.dev6.public_ip}"
}

output "ip_dev7" {
  value = "${aws_instance.dev7.public_ip}"
}
