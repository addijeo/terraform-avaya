variable "credential" {
    type = string 
    description = "Location of service account for GCP"
}

variable "gcp_project_id" {
  type = string
  description = "gcp_project_id"
}

variable "gcp_region" {
  type = string
  description = "GCP region"
} 

variable "gke_cluster_name" {
  type = string
  description = "gke_cluster_name"
} 


variable "gke_zones" {
  type = list(string)
  description = "gke_ zone"
} 

variable "gke_nodepool_name" {
  type = string
  description = "gke default nodepool name"
} 
