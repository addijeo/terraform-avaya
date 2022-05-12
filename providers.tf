terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.20.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "432202482117"
  region      = "us-east1"  
}

