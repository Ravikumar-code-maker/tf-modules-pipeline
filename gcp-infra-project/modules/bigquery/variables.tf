variable "env_name" {
  type  = string
}

variable "project_id" { type = string }
variable "region" { type = string }

variable "location" {
  description = "The GCP region/location to deploy resources"
  type        = string
}

variable "tables" {
  type = list(string)
}
