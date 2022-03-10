
# Create (and display) an SSH key
resource "tls_private_key" "bastion_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}

data "template_file" "bastion_docker_init" {
  template = file("bastion-entry-script.sh")
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "bastion_vm" {
    name                  = "BastionVM-${count.index}"
    count                 = var.count_vm
    location              = var.location_region
    resource_group_name   = azurerm_resource_group.dev_rg.name
    network_interface_ids = [element(azurerm_network_interface.dev_nic.*.id, count.index),]
#    size                  = "Standard_DS1_v2"
    size                  = "Standard_B2s"

    os_disk {
        name                 = "BastionOsDisk${count.index}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
        disk_size_gb         = "30"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name                   = "bastion${count.index}"
    admin_username                  = "azureuser"
    disable_password_authentication = true
    custom_data = base64encode(data.template_file.bastion_docker_init.rendered)

    admin_ssh_key {
        username       = "azureuser"
        public_key     = var.my_public_key 
    }

    # user_data = file("bastion-entry-script.sh")


    tags = {
        environment = "dev"
    }
}
