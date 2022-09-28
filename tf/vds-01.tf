variable "vsphere_server" {
  description = "Hostname of vCenter"
  type        = string
  default     = "vc01.home.uw.cz"
}

variable "vsphere_user" {
  description = "User name of vSphere administrator"
  type        = string
  default     = "administrator@uw.cz"
}

variable "vsphere_password" {
  description = "Password of vSphere administrator"
  type        = string
  default     = "VMware1!"
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "DC-HOME"
}

variable "esxi_hosts" {
  default = [
    "esx21.home.uw.cz",
    "esx22.home.uw.cz",
    "esx23.home.uw.cz",
    "esx24.home.uw.cz",
  ]
}

data "vsphere_host" "host" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_distributed_virtual_switch" "vds-01" {
  name          = "vds-01"
  datacenter_id = data.vsphere_datacenter.datacenter.id

  uplinks         = ["uplink1", "uplink2"]
  active_uplinks  = ["uplink1", "uplink2"]

#  host {
#    host_system_id = data.vsphere_host.host.0.id
#    devices        = ["vmnic0","vmnic1"]
#  }

#  host {
#    host_system_id = data.vsphere_host.host.1.id
#    devices        = ["vmnic0","vmnic1"]
#  }

  host {
    host_system_id = data.vsphere_host.host.2.id
    devices        = ["vmnic0","vmnic1"]
  }

  host {
    host_system_id = data.vsphere_host.host.3.id
    devices        = ["vmnic0","vmnic1"]
  }
}
