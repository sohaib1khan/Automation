# main.tf

resource "proxmox_vm_qemu" "vm_instance" {
  count       = 1
  name        = "devops-vm${count.index + 1}" # "terraform-vm${count.index + 1}" - for creating multiple VM
  target_node = "pve"
  # vmid = 222  # This will assign the VM ID

  clone = "ubuntutemplate20" # Name of the VM/Template that you want to clone



  os_type    = "cloud-init"
  cores      = 4
  sockets    = 1
  memory     = 14048
  ciuser     = var.ciuser
  cipassword = var.cipassword

  disk {
    type    = "virtio"
    storage = "S1"
    size    = "50G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }


  # Cloud Init Settings (Optional, but helpful for initialization)
  # ipconfig0 = "ip=dhcp" 
  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.52/24"
  
  # UPDATE THE SSH KEY(s)
  sshkeys   = <<-EOF
  SSH_Public_KEY(s)

  EOF
}

output "vm_ip_address" {
  value = "192.168.1.52"
}

output "ciuser_output" {
  value = var.ciuser
  description = "Output the VM user name"
}
