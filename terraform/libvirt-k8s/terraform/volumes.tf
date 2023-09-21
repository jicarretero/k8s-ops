resource "libvirt_volume" "ubuntu-2204-qcow2" {
  count = var.VM_COUNT
  name = "ubuntu-2204-${count.index}.qcow2"
  pool = libvirt_pool.vmpool.name
  base_volume_name = var.VM_IMG
  base_volume_pool = "default"
  format = "qcow2"
  size = var.VM_HD_SIZE
}
