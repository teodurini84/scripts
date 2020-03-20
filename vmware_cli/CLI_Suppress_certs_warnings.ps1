# Suppressing certificate warnings
Set-PowerCLIConfiguration -Scope AllUsers -InvalidCertificateAction Ignore -Confirm:$false
# Suppressing warnings VMware's Customer Experience Improvement Program ("CEIP")
Set-PowerCLIConfiguration -Scope AllUsers -ParticipateInCEIP $false -Confirm:$false