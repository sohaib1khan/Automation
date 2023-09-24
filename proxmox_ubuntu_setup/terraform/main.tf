# main.tf

resource "proxmox_vm_qemu" "vm_instance" {
  count       = 1
  name        = "terraform-vm${count.index + 1}" # "terraform-vm${count.index + 1}" - for creating multiple VM
  target_node = "pve" # Proxmox node name 
  vmid = 222  # Can manually assign this or terraform will automatically assign one 

  clone = "ubuntutemplate20" # Name of the VM/Template that you want to clone. This object needs to be already/present



  os_type    = "cloud-init"
  cores      = 2
  sockets    = 1
  memory     = 4048
  ciuser     = var.ciuser
  cipassword = var.cipassword

  disk {
    type    = "virtio"
    storage = "S1"
    size    = "20G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }


  # Cloud Init Settings (Optional, but helpful for initialization)
  # ipconfig0 = "ip=dhcp"  # Enable this if you want to use dhcp assignment 
  ipconfig0 = "gw=192.168.1.1,ip=192.168.1.50/24" # Assigning ip assignment works well with ansible when playbook run
  sshkeys   = <<-EOF
  INJECT_SSH_PUBLIC_KEY_HERE

  EOF
}

# Ip address output
output "vm_ip_address" {
  value = "192.168.1.50"
}

