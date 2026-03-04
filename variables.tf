variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "environment" {
  type        = string
  description = "Environment (dev/test/prod)"
  default     = "dev"
}

varibale "machine_type" {
  type = map(string)
  default = {
    dev  = "e2-medium"
    test = "e2-standard-2"\
    prod = "n2-standard"
  }
}

varibale "gcs_bucket_names" {
  type    = list(string)
  default = ["bucket-dev","bucket-test","bucket-prod"]
}

variable "bigquery_datasets" {
  type = map(object({
    location = string
    tables   = list(string)
  }))
  default = {
    dev = { location = "US", tables = ["dev_table1, "dev_table2"] }
    test = { location = "US", tables = ["test_table1"] } 
    prod = { location = "US", tables = ["prod_table1", "prod_table2"] }
  }
}

variable "api_gateway_names" {
  type    = set(string)
  default = ["api-gateway-dev","api-gateway-test","api-gateway-prod"]
}

variable "subnet_cidrs" {
  type = map(string)
  default = {
    dev  = "10.0.1.0/24"
    test = "10.0.2.0/24"
    prod = "10.0.3.0/24"
  }
}

variable "zones" {
  type = map(string)
  default = {
    dev  = "us-central1-a"
    test = "us-central1-b"
    prod = "us-central1-c"
  }
}
