variable "gcp_credentials" {
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

variable "gke_sa_account" {
  type = string
  description = "service account for IAM"
} 

variable "node_locations" {
  type = string
  description = "Node Location as per Zone"
}

## 
variable "network" {
  type = string
  description = "The VPC network created to host the cluster in"
  # default     = "gke-network"
}

variable "subnetwork" {
  type = string
  description = "The subnetwork created to host the cluster in"
  # default     = "gke-subnet"
}

variable "ip_range_pods_name" {
  type = string
  description = "The secondary ip range to use for pods"
  # default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  type = string
  description = "The secondary ip range to use for services"
  # default     = "ip-range-scv"
}