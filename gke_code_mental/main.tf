# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest
# below module path is above url
module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = false
  # zones                      = ["us-east1-a", "us-east1-b", "us-east1-f"]
  zone                       = var.gke_zones
  network                    = "default"
  subnetwork                 = "default"
#  ip_range_pods              = "us-central1-01-gke-01-pods"
#  ip_range_services          = "us-central1-01-gke-01-services"
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false

  node_pools = [
    {
      name                      = var.gke_nodepool_name
      machine_type              = "e2-medium"
      node_locations            = "us-central1-b,us-central1-c"
      min_count                 = 1
      max_count                 = 100
      local_ssd_count           = 0
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = "project-service-account@<PROJECT ID>.iam.gserviceaccount.com"
      preemptible               = false
      initial_node_count        = 80
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}