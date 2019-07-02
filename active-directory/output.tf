output "microsoft-ad_dns_ip_addresses" {
  value = "${aws_directory_service_directory.this.*.dns_ip_addresses}"
}

output "microsoft-ad_dns_name" {
  value = "${aws_directory_service_directory.this.*.name}"
}