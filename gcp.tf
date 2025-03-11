# Generate SSH Key Pair: If you haven't already, generate an SSH key pair using ssh-keygen and save it in ~/.ssh/.
# Replace Placeholders: Update the your-username and the path to your public SSH key in the metadata block.
# Apply the Plan: Run terraform init, terraform plan, and terraform apply to provision the instances with the SSH key configured.

provider "google" {
  project = "your-gcp-project-id"  # Replace with your GCP project ID
  region  = "us-central1"          # Change to your preferred region
}
resource "google_compute_instance" "example" {
  count        = 3
  name         = "example-node-${count.index}"
  machine_type = "n1-standard-4"  # This machine type has 4 vCPUs and 15 GB of memory
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # Replace with your preferred image
      size  = 50                       # 50 GB data volume
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    ssh-keys = "your-username:${file("~/.ssh/id_rsa.pub")}"  # Replace with your username and path to your public SSH key
  }
  tags = ["example-node"]
}
output "instance_names" {
  value = google_compute_instance.example[*].name
}
output "instance_public_ips" {
  value = google_compute_instance.example[*].network_interface[0].access_config[0].nat_ip
}
