provider "google" {
  credentials = file(var.gcp_credentials)
  # Configuration options
  # for project, name ?
  project     = var.gcp_project_id
  region      = var.gcp_region
}


