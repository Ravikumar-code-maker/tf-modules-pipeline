resource "google_service_account" "sa" {
  account_id   = "${var.env_name}-sa"
  dispaly_name = "${var.env_name} service account"
  project      = var.project_id
}

resource "google_project_iam_member" "sa_role" {
  project  = var.project_id
  role     = "roles/editor"
  member   = "serviceAccount:${google_service_account.sa.email}"
}
