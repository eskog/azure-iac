variable "resource_group_name" {
  default = "myTFResourceGroup"
}

variable "resource_group_location" {
  default = "swedencentral"
}

variable "ssh_key" {
  default = "~/.ssh/azure.pub"
}

variable "k8s_nodes" {
  type = map(object({
    name     = string
    size     = string
    role_tag = string
    OS       = string
  }))
  default = {
    "master01" = {
      name     = "master01"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
    "master02" = {
      name     = "master02"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
    "master03" = {
      name     = "master03"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
    "worker01" = {
      name     = "worker01"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
    "worker02" = {
      name     = "worker02"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
    "worker03" = {
      name     = "worker03"
      size     = "Standard_B1s"
      role_tag = "k8s"
      OS       = "Ubuntu"
    }
  }
}