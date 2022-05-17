/*
# to run -target option https://jhooq.com/terraform-run-specific-resource/
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# to get machine type         $ gcloud compute machine-types list | grep -iE ^e | head -n 40
# to get images               $ gcloud compute images list

# provisioners, connections ... ?

*/

# terraform apply -target module.network.google_compute_network.vpc_network -target module.vm.google_compute_instance.vm-jenkins-001
resource "google_compute_instance" "vm-jenkins-001" {
  name         = "vm-jenkins-001"
  machine_type = "e2-micro"
  zone         = "us-east1-b"
#  key_name     = "ec2-user"

  tags = ["http", "https", "ssh-critical"]

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

  connection {
    type = "ssh"
    user = "ec2-user"
    host = "${google_compute_instance.vm-jenkins-001.network_interface.0.access_config.0.nat_ip}"
    timeout  = "1m"
    private_key = "${file("~/.ssh/key.pem")}"                   # https://stackoverflow.com/questions/36591653/how-do-i-use-the-file-provisioner-with-google-compute-instance-template
                                                                # key should be mention with full path or ~/.
    # host = "self.public_ip"                                   # works with aws, I guess 
                                                                # 
  }

  provisioner "remote-exec" {
    inline = [ 
#      "chmod +x /tmp/script.sh",
#      "/tmp/script.sh args",
        "sudo yum install httpd -y",
        "sudo systemctl start httpd"
    ]
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

