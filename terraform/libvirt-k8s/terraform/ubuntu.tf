# Define KVM domain to create
resource "libvirt_domain" "ubuntu-2204" {
  count = var.VM_COUNT
  name   = "${var.VM_HOSTNAME}-${count.index}"
  memory = "8192"
  vcpu   = 6

  cloudinit = "${libvirt_cloudinit_disk.cloudinit[count.index].id}"


  network_interface {
    network_name = "default" # List networks with virsh net-list
    # hostname   = "${var.VM_HOSTNAME}-${count.index}"
    wait_for_lease = true
  }

  network_interface {
    network_id = "${libvirt_network.vm_public_network.id}"
    network_name = "${libvirt_network.vm_public_network.name}"
    hostname   = "${var.VM_HOSTNAME}-${count.index}"
  }

  disk {
    volume_id = "${libvirt_volume.ubuntu-2204-qcow2[count.index].id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

output "ips0" {
  #value = libvirt_domain.domain-ubuntu
  #value = libvirt_domain.domain-ubuntu.*.network_interface
  # show IP, run 'terraform refresh' if not populated
  value = libvirt_domain.ubuntu-2204.*.network_interface.0.addresses
}
output "ips1" {
  #value = libvirt_domain.domain-ubuntu
  #value = libvirt_domain.domain-ubuntu.*.network_interface
  # show IP, run 'terraform refresh' if not populated
  value = libvirt_domain.ubuntu-2204.*.network_interface.1.addresses
}
