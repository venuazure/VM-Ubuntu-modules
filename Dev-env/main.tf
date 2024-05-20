
provider "azurerm" {
  features {}
  subscription_id = "d4456648-6da8-41bc-b2a9-7e239a025e19"
  tenant_id       = "8e00d335-dd13-4fa2-a796-c0cf789f6c56"
  client_id       = "fcad2806-9620-4eba-9fa1-96a5f1b4e669"
  client_secret   = "X9X8Q~TnLGVCoBb65N4cMwtzUeqEHcobzAOqcbqm"
}


module "rg1-dev" {

  source    = "../Inframodules/Rg-module"
  rg-1-name = "RG-1"
  location  = "eastus"
}


module "vnet-rg1-dev" {
  source         = "../Inframodules/Vnet-module"
  vnet1-name     = "vnet-one"
  location       = module.rg1-dev.location
  res-gp-name    = module.rg1-dev.rg-1-name
  address-sprace = ["10.2.0.0/16"]
  subnet-name    = "vnet1-subnet-01"
  address-prefix = ["10.2.1.0/24"]
}


module "vm-public-ip" {
  source       = "../Inframodules/public-ip"
  location     = module.rg1-dev.location
  res-grp-name = module.rg1-dev.rg-1-name
}


module "Nsg-rule" {
  source       = "../Inframodules/Nsg-rule"
  location     = module.rg1-dev.location
  res-grp-name = module.rg1-dev.rg-1-name
}

module "Vm-NIC" {

  source               = "../Inframodules/Vm-nic"
  location             = module.rg1-dev.location
  res-grp-name         = module.rg1-dev.rg-1-name
  subnet-id            = module.vnet-rg1-dev.subnet-id
  public-ip-address-id = module.vm-public-ip.public-ip-address-id
}

#connect security group to inerface
module "sec-group-to-inerface" {
  source               = "../Inframodules/connect sec to interface"
  nic-id               = module.Vm-NIC.vm-nic-id
  network-sec-group-id = module.Nsg-rule.network-sec-group-id
}


#virtual machine code
module "vm-ubuntu" {
  source       = "../Inframodules/virtual-machine"
  location     = module.rg1-dev.location
  res-grp-name = module.rg1-dev.rg-1-name
  nic-id       = module.Vm-NIC.vm-nic-id
  vm-size      = "Standard_B1s"
  username     = "user01"
  password     = "password@123"

}