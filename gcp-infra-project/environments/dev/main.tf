local {
  env_name = "dev"
}

module "network" {
  source      = "../../modules/network"
  env_name    = local.env_name
  project_id  = var.project_id
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

module "compute" {
  source       = "../../modules/compute"
  env_name     = local.env_name
  project_id   = var.project_id
  network      = module.network.vpc_name
  machine_type = var.machine_type
  zone         = var.zone
}
