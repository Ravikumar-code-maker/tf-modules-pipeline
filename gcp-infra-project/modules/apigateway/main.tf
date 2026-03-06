resource "google_api_gateway_api" "api" {
  provider = google-beta
  api_id = var.api_name
  project = var.project_id
}

resource "google_api_gateway_api_config" "api_config" {
  provider = google-beta
  api      = google_api_gateway_api.api.id
  api_config_id = "${var.env_name}-config"
  project = var.project_id

  openapi_documents {
    document {
      path = "openapi-spec.yaml"
    }
  }
}

resource "google_api_gateway_gateway" "gateway" {
  provider   = google-beta
  name       = "${var.env_name}-gateway"
  api        = google_api_gateway_api.api.id
  api_config = google_api_gateway_api_config.api_config.id
  location   = var.region
  project    = var.project_id
}
