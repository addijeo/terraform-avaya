/*
# firewall resource  
# 
# 
# 
*/

resource "google_compute_firewall" "custom-firewall" {
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


/*
# below for output
*/

output "firewall-id" {
  value = google_compute_firewall.custom-firewall.id
}