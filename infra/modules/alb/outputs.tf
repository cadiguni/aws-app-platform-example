output "alb_arn" {
  description = "ARN do ALB"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "DNS publico do ALB"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "Zone ID do ALB"
  value       = aws_lb.this.zone_id
}

output "alb_security_group_id" {
  description = "Security group do ALB"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ARN do target group"
  value       = aws_lb_target_group.this.arn
}

output "listener_arn" {
  description = "ARN do listener"
  value       = aws_lb_listener.http.arn
}
