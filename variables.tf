#<resource>-<Project name>-<env>

variable "location" {
    description = "Azure region"
    type        = string
    default     = "Sweden Central"
}

variable "networking_resource_group_name"{
    description = "Networking resource group"
    type        = string
    default     = "rg-platform-dev"
}

variable "Virtual_Network_name"{
    description = "App subnet"
    type        = string
    default     = "vnet-platform-dev"
}

variable "App_subnet_name"{
    description = "App subnet"
    type        = string
    default     = "snetapp-platform-dev"
}

variable "Data_subnet_name"{
    description = "Data subnet"
    type        = string
    default     = "snetdata-platform-dev"
}

variable "Management_subnet_name"{
    description = "Management subnet"
    type        = string
    default     = "snetmgmt-platform-dev"
}