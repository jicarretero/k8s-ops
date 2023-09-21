variable "VM_COUNT" {
   default = 3
   type = number
}

variable "VM_CONTROLLERS" {
   default = 1
   type = number
}

variable "VM_USER" {
   default = "ubuntu"
   type = string
}

variable "VM_HOSTNAME" {
   default = "tfk8scluster"
   type = string
}
variable "VM_IMG" {
   default = "base-ubuntu-22.04.qcow2"
   type = string
}

variable "VM_CIDR_RANGE" {
   default = "10.95.10.0/24"
   type = string
}

# HD size in bytes
variable "VM_HD_SIZE" {
   default = 85899345920
   type = number
}

variable "BRIDGE_NAME" {
   default = "br-tf-k8s"
   type = string
}
