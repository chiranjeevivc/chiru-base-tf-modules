output "cluster_id" {
  description = "The ID of the cluster"
  value       = "${element(concat(aws_emr_cluster.this.*.id, list("")), 0)}"
}

output "cluster_name" {
  description = "The name of the cluster"
  value       = "${element(concat(aws_emr_cluster.this.*.name, list("")), 0)}"
}

output "cluster_step_id" {
  description = "The ID of the cluster"
  value       = "${element(concat(aws_emr_cluster.cluster_step_job.*.id, list("")), 0)}"
}

output "cluster_step_name" {
  description = "The name of the cluster"
  value       = "${element(concat(aws_emr_cluster.cluster_step_job.*.name, list("")), 0)}"
}
