gcp_credentials = "~/.ssh/keys.json" 
gcp_project_id = "kubernetes-openscam"
gcp_region = "us-east1"

network = "gke-network"
subnetwork = "gke-subnet"
ip_range_pods_name = "ip-range-pods"
ip_range_services_name = "ip-range-scv"

node_locations = "us-east1-d,us-east1-b,us-east1-c"
gke_cluster_name = "gke-k8s"
gke_zones = [ "us-east1-d","us-east1-b","us-east1-c" ]
gke_nodepool_name = "gke-k8s-node-pool"
gke_sa_account = "k8s-openscam@kubernetes-openscam.iam.gserviceaccount.com"

