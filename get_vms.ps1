Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $true
Set-PowerCLIConfiguration -InvalidCertificateAction ignore -confirm:$false

# vCenter Server configuration
$vcenter      = "vc01.home.uw.cz"
$vcenteruser  = "readonly"
$vcenterpw    = "readonly"

$vc = connect-viserver $vcenter -User $vcenteruser -Password $vcenterpw

get-vm

disconnect-viserver -Server $vc -Force -Confirm:$false

