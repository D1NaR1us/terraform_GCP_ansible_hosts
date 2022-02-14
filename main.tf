provider "google" {
  project     = "involuted-earth-341207"
  region      = "europe-west1"
  zone        = "europe-west1-b"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance-${count.index + 1}"
  machine_type = "f1-micro"
  count = 2
  tags = ["http-server"] 

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata = {
   sshKeys = "Dinarius:${file(var.ssh_public_key)}"
  }
}