/*
# firewall resource  
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

terraform apply -target module.firewall_rules.google_compute_firewall.ssh-critical
terraform apply -target module.firewall_rules.google_compute_firewall.web-public

*/

resource "google_compute_firewall" "ssh-critical" {
  name    = "ssh-critical"
  network = "custom-vpc"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # source_tags = ["ssh-critical"]
  target_tags = ["ssh-critical"]
  source_ranges = [ "0.0.0.0/0" ]
}


resource "google_compute_firewall" "web-public" {
  name    = "web-public"
  network = "custom-vpc"

  allow {
    protocol = "udp"
    ports    = ["80", "8080"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  # source_tags = ["ssh-critical"]
  # target_tags = ["ssh-critical"]   if "target_tags" not specified it means all instance will be applicable.
  source_ranges = [ "0.0.0.0/0" ]
}



/*
# below for output


output "firewall-id" {
  value = google_compute_firewall.custom-firewall.id
}

*/