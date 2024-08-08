output "service_account_email" {
  description = "The service account email for Cloudbase"
  value       = google_service_account.cloudbase_service_account.email
}
