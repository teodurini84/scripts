# Parameter for the connection 
$var_vcenter_fqdn = Read-Host -Prompt 'Input your Vcenter FQDN'
$var_vcenter_user = Read-Host -Prompt 'Input your Vcenter Username (including Vcenter domain)'
$var_vcenter_pwd = Read-Host -Prompt 'Input your Vcenter Password'

# Store password
$password = New-VICredentialStoreItem -Host $var_vcenter_fqdn -User $var_vcenter_user -Password $var_vcenter_pwd 