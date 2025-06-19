variable "virtual_network_name" {
description = "Type here , the name of your virtual network"
type = string
}

variable "resource_group_name" {
description = "Type here , resource group name for your virtual network."
type = string
}

variable "address_space" {
description = "Type here , the address space name for your virtual network."
type = list(string)
}