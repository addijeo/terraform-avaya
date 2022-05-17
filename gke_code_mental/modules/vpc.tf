/*
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

# subnet, subnet range, subnetwork  ... ?

*/

resource "google_compute_network" "vpc_network" {
  name                    = "custom-vpc"
  auto_create_subnetworks = true
  mtu                     = 1460
}

