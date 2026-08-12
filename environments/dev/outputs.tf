output "account_id" {
  description = "ID du compte AWS authentifié"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "ARN de l'identité IAM utilisée par Terraform"
  value       = data.aws_caller_identity.current.arn
}

output "region_active" {
  description = "Région AWS effectivement utilisée"
  value       = data.aws_region.current.name
}