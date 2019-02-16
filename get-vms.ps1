Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -Confirm:$false | Out-Null
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false | Out-Null

write-host "vCenter configuration ..."

# vCenter Server configuration
$vcenter      = "vc01.home.uw.cz"
$vcenteruser  = "readonly"
$vcenterpw    = "VMware1!"

write-host "vCenter connect ..."

$vc = connect-viserver $vcenter -User $vcenteruser -Password $vcenterpw

write-host "Get-VM ..."

get-vm

write-host "vCenter disconnect ..."

disconnect-viserver -Server $vc -Force -Confirm:$false

