data "template_file" "network_config" {
    count = var.VM_COUNT
    template = file("${path.module}/network-config.cfg")
    vars = {
        NET_HOST_IP = (count.index > (var.VM_CONTROLLERS - 1) ? count.index + 11 - var.VM_CONTROLLERS  : count.index+1)
    }
}

resource "libvirt_network" "vm_public_network" {
    name = "${var.VM_HOSTNAME}_network"
    mode = "bridge"
    bridge = "${var.BRIDGE_NAME}"
}
