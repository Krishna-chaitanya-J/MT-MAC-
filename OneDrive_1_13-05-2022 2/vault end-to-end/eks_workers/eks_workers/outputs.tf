output "aws_launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = aws_launch_configuration.workernode.id
}

output "aws_launch_configuration_name" {
  description = "The name of the launch configuration"
  value       = aws_launch_configuration.workernode.name
}

output "aws_autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.eks-asg.id
}

output "aws_autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.eks-asg.name
}

output "aws_autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.eks-asg.arn
}

output "aws_autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = aws_autoscaling_group.eks-asg.min_size
}

output "aws_autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = aws_autoscaling_group.eks-asg.max_size
}

output "aws_autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = aws_autoscaling_group.eks-asg.desired_capacity
}