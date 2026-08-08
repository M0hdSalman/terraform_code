rgs = {
  rg1 = {
    name     = "dev-rg1"
    location = "japaneast"
  }

  rg2 = {
    name     = "dev-rg2"
    location = "japaneast"
  }
}

vnets = {
  vnet1 = {
    name                = "dev-vnet1"
    location            = "japaneast"
    resource_group_name = "rg1"
    address_space       = ["10.1.0.0/16"]
  }

  vnet2 = {
    name                = "dev-vnet2"
    location            = "japaneast"
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
    location            = "japaneast"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "backend-nic-pip"
    location            = "japaneast"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    name                          = "frontend-vm-nic"
    location                      = "japaneast"
    resource_group_name           = "rg1"
    ip_config_name                = "internal"
    subnet_id                     = "subnet1"
    public_ip_address_id          = "pip1"
    private_ip_address_allocation = "Dynamic"
  }

  nic2 = {
    name                          = "backend-vm-nic"
    location                      = "japaneast"
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
    location             = "japaneast"
    size                 = "Standard_B2als_v2"
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
    location             = "japaneast"
    size                 = "Standard_B2als_v2"
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
    nic_name            = "frontend-nic"
    location            = "japaneast"
    resource_group_name = "rg1"
    subnet_name         = "subnet1"
    pip_name            = "pip1"
    nsg_name            = "nsg1"
  }

  nsg2 = {
    nic_name            = "backend-nic"
    location            = "japaneast"
    resource_group_name = "rg1"
    subnet_name         = "subnet2"
    pip_name            = "pip2"
    nsg_name            = "nsg2"
  }
}
