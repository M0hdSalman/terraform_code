rgs = {
  rg1 = {
    name     = "dev-rg1"
    location = "westus2"
  }

  rg2 = {
    name     = "dev-rg2"
    location = "westus2"
  }
}

vnets = {
  vnet1 = {
    name                = "dev-vnet1"
    location            = "westus2"
    resource_group_name = "rg1"
    address_space       = ["10.1.0.0/16"]
  }

  vnet2 = {
    name                = "dev-vnet2"
    location            = "westus2"
    resource_group_name = "rg1"
    address_space       = ["10.2.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.1.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "frontend-nic-pip"
    location            = "westus2"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "backend-nic-pip"
    location            = "westus2"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    name                          = "frontend-vm-nic"
    location                      = "westus2"
    resource_group_name           = "rg1"
    ip_config_name                = "internal"
    subnet_id                     = "subnet1"
    public_ip_address_id          = "pip1"
    private_ip_address_allocation = "Dynamic"
  }

  nic2 = {
    name                          = "backend-vm-nic"
    location                      = "westus2"
    resource_group_name           = "rg1"
    ip_config_name                = "internal"
    subnet_id                     = "subnet2"
    public_ip_address_id          = "pip2"
    private_ip_address_allocation = "Dynamic"
  }
}

vms = {
  vm1 = {
    vm_name              = "frontend-vm"
    resource_group_name  = "rg1"
    location             = "westus2"
    size                 = "Standard_D2s_v3"
    admin_username       = "azureuser"
    admin_password       = "Azure@123456"
    nic_id               = "nic1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }

  vm2 = {
    vm_name              = "backend-vm"
    resource_group_name  = "rg1"
    location             = "westus2"
    size                 = "Standard_D2s_v3"
    admin_username       = "azureuser"
    admin_password       = "Azure@123456"
    nic_id               = "nic2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
  }
}

nsg = {
  nsg1 = {
    nsg_name = "frontend_nsg"
    location = "westus2"
    resource_group_name = "rg1"
  }

  nsg1 = {
    nsg_name = "backend_nsg"
    location = "westus2"
    resource_group_name = "rg1"
  }
}