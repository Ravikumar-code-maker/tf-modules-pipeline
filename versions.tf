terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source = "hasicorp/google"
      version = "~> 5.0"
    }
  }
}
