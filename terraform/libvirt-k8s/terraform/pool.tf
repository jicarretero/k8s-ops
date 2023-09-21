## Define a pool for the thing....
resource "libvirt_pool" "vmpool" {
    name = "${var.VM_HOSTNAME}_pool"
    type = "dir"
    path = "/var/lib/libvirt/${var.VM_HOSTNAME}_pool"
}
