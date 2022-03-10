# Network Security Group and rule
resource "azurerm_network_security_group" "bastion_nsg" {
    name                = "BastionNetworkSecurityGroup"
    location            = var.location_region
    resource_group_name = azurerm_resource_group.dev_rg.name
    
/*
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = var.ip_admin
        destination_address_prefix = "*"
    }
*/

    security_rule {
        name                       = "SSH-12000"
        priority                   = 999
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "12000"
        source_address_prefix      = var.ip_admin
        destination_address_prefix = "*"
    }

    tags = {
        environment = "dev"
    }
}


resource "azurerm_network_security_group" "dev_nsg" {
    name                = "AccessNetworkSecurityGroup"
    location            = var.location_region
    resource_group_name = azurerm_resource_group.dev_rg.name

    security_rule {
        name                       = "Access8080"
        priority                   = 995
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = var.ip_admin
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "Access8081"
        priority                   = 993
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8081"
        source_address_prefix      = var.ip_admin
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "Access8082"
        priority                   = 991
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8082"
        source_address_prefix      = var.ip_admin
        destination_address_prefix = "*"
    }

    tags = {
        environment = "dev"
    }
}

