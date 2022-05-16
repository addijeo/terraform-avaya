/*
# to run -target option https://jhooq.com/terraform-run-specific-resource/
# 
# 
# 
# 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
*/
resource "google_compute_instance" "vm-jenkins-001" {
  name         = "vm_001"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  tags = ["http", "https"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20220406"
      size = 20      
    }
  }

  network_interface {
    network = "custom-vpc"

    access_config {
      // Ephemeral public IP
    }
  }
}


resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  zone = "us-east1-b"
  machine_type = "n1-standard-1"

  allow_stopping_for_update = true

  network_interface {
    network = "default"
#    subnetwork = "sub-sg-us-east1"    
  }
  boot_disk {
    initialize_params {
      image = "centos-7-v20220406"
      size = 20
    }
  }
}

