output "external_ip" {
    value = "${google_compute_instance.vm_instance[*].network_interface.0.access_config.0.nat_ip}"
}

output "instance_id" {
    value = "${google_compute_instance.vm_instance[*].name}"
}
output "ansible_host" {
    value = formatlist(
        "%v ansible_ssh_host=%v",
            split(",","${join(",",google_compute_instance.vm_instance[*].name)}"),
            split(",","${join(",",google_compute_instance.vm_instance[*].network_interface.0.access_config.0.nat_ip)}")
        )
}