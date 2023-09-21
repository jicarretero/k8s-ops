# get user data info
data "template_file" "user_data" {
  count = var.VM_COUNT
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    VM_USER = var.VM_USER
    VM_HOSTNAME = "${var.VM_HOSTNAME}-${count.index}"
  }
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "cloudinit" {
  count = var.VM_COUNT
  name = "${var.VM_HOSTNAME}_${count.index}_cloudinit.iso"
  pool = libvirt_pool.vmpool.name
  user_data      = "${data.template_file.user_data[count.index].rendered}"
  network_config = "${data.template_file.network_config[count.index].rendered}"
}

