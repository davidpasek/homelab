Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -Confirm:$false | Out-Null
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false | Out-Null

# vCenter Server configuration
$vcenter      = "vc01.home.uw.cz"
$vcenteruser  = "readonly"
$vcenterpw    = "VMware1!"

$vc = connect-viserver $vcenter -User $vcenteruser -Password $vcenterpw

get-vm

disconnect-viserver -Server $vc -Force -Confirm:$false

