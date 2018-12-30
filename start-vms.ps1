param (
    [string]$unknown_params = "",
    [string]$cluster = "",
    [string]$tag = ""
)

write-host "Cluster: $cluster"
write-host "Tag:     $tag"

# vCenter Server configuration
$vcenter      = "vc01.home.uw.cz"
$vcenteruser  = "readonly"
$vcenterpw    = "VMware1!"

Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -Confirm:$false | Out-Null
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false | Out-Null

$vc = connect-viserver $vcenter -User $vcenteruser -Password $vcenterpw

if ($cluster) {
  $clusters = get-cluster -name $cluster
} else {
  write-host "Cluster is not specified, therefore VMs from all clusters are considered."
  $clusters = get-cluster
}

if ($tag -eq "") {
  write-host "vSphere TAG is not specified, therefore all VMs are considered."
}

foreach ($cl in $clusters) {
 
  if ($tag) {
    $vms = $cl | get-vm -tag $tag
  } else { 
    $vms = $cl | get-vm
  }
  foreach ($vm in $vms) {
    write-host "Cluster: $cl"
    write-host "VM: $vm"
    write-host "-----------------"
  }
}

disconnect-viserver -Server $vc -Force -Confirm:$false

