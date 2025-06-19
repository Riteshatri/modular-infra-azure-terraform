variable "subnet_name" {
description = "Type here , the name for your sub network."
type = string
}

variable "resource_group_name" {
description = "Type here , resource group name for your subnet."
type = string
}

variable "virtual_network_name" {
description = "Type here , the name of your virtual network"
type = string
}

variable "address_prefixes" {
description = "Type here , the address prefixes for your subnet."
type = list(string)
}