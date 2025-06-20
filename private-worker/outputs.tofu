output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.workerpool.asg_name
}

output "launch_template_id" {
  description = "ID of the Launch Template"
  value       = module.workerpool.launch_template_id
}

output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = module.workerpool.iam_role_arn
}
