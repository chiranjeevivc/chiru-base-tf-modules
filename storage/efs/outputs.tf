// EFS File System outputs
output "dns_name" {
  description = "FQDN of the EFS volume"
  value       = "${element(concat(aws_efs_file_system.this.*.dns_name, list("")),0)}"
}

output "id" {
  description = "ID of EFS"
  value       = "${element(concat(aws_efs_file_system.this.*.id, list("")),0)}"
}

output "kms_key_id" {
  description = ""
  value       = "${element(concat(aws_efs_file_system.this.*.kms_key_id, list("")),0)}"
}

output "mount_target_ids" {
  description = "List of IDs of the EFS mount targets"
  value       = ["${aws_efs_mount_target.this.*.id}"]
}

output "mount_target_ips" {
  description = "List of IPs of the EFS mount targets"
  value       = ["${aws_efs_mount_target.this.*.ip_address}"]
}

output "mount_target_net_intf_ids" {
  description = "List of network interface IDs of the EFS mount targets"
  value       = ["${aws_efs_mount_target.this.*.id}"]
}

