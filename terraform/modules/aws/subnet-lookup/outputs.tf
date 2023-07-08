output "private_ids" {
  description = "List of all private subnet ids found"
  value       = [for s in data.aws_subnet.private : s.id]
}


output "public_ids" {
  description = "List of all public subnet cidr blocks found"
  value       = [for s in data.aws_subnet.public : s.id]
}
