provider "google" {
  project     = "involuted-earth-341207"
  region      = "us-west1"
  zone        = "us-west1-b"
}

resource "google_compute_instance" "myserver" {
  name         = "amsiblehost-${count.index}"
  machine_type = "f1-micro"
  count = 2
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    sshKeys = "Dinarius:${var.ssh_public_key}"
  }
}