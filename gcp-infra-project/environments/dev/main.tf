locals {
  env_name = "dev"
}

module "network" {
  source      = "../../modules/network"
  env_name    = local.env_name
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = var.subnet_cidr

firewall_rules = [
    {
      name  = "allow-ssh"
      ports = ["22"]
    },
    {
      name  = "allow-http"
      ports = ["80"]
    }
  ]
}


module "compute" {
  source       = "../../modules/compute"
  env_name     = local.env_name
  project_id   = var.project_id
  network      = module.network.vpc_name
  machine_type = var.machine_type
  zone         = var.zone
}

module "storage" {
  source     = "../../modules/storage"
  project_id = var.project_id
  env_name   = local.env_name
}

module "iam" {
  source     = "../../modules/iam"
  project_id = var.project_id
  env_name   = local.env_name
}

module "bigquery" {
  source     = "../../modules/bigquery"
  project_id = var.project_id
  env_name   = local.env_name
  region     = var.region

}

module "apigateway" {
  source     = "../../modules/apigateway"
  project_id = var.project_id
  env_name   = local.env_name
}




