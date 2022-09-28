variable "esxi_hosts" {
  default = [
    "esx21.home.uw.cz",
    "esx22.home.uw.cz",
    "esx23.home.uw.cz",
    "esx24.home.uw.cz",
  ]
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
  ]
}

data "vsphere_datacenter" "datacenter" {
  name = "DC-HOME"
}

data "vsphere_host" "host" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_distributed_virtual_switch" "vds" {
  name          = "vds-01"
  datacenter_id = data.vsphere_datacenter.datacenter.id

  uplinks         = ["uplink1", "uplink2"]
  active_uplinks  = ["uplink1", "uplink2"]

  host {
    host_system_id = data.vsphere_host.host.0.id
    devices        = ["${var.network_interfaces}"]
  }

  host {
    host_system_id = data.vsphere_host.host.1.id
    devices        = ["${var.network_interfaces}"]
  }

  host {
    host_system_id = data.vsphere_host.host.2.id
    devices        = ["${var.network_interfaces}"]
  }

  host {
    host_system_id = data.vsphere_host.host.4.id
    devices        = ["${var.network_interfaces}"]
  }
}
