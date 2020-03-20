# Mount shared folder GPO using technical account
# 
$var_smb_usr=Read-Host -Prompt 'Input your SMB Username (including the domain)'
$var_smb_pwd=Read-Host -Prompt 'Input your SMB Password'
$var_path='"\\<DOMAIN NAME>\sysvol\numcom.local\Policies\<POLICY ID>\User\Scripts\Logon\'
New-SmbMapping -LocalPath 'J:' -RemotePath $var_path -Username $var_smb_usr -Password $var_smb_pwd

# Connect to the VC server
$var_vcenter_fqdn = '<VSPHERE FQDN>'
$var_stored_creds =  Get-VICredentialStoreItem -Host $var_vcenter_fqdn
Connect-VIServer -Server $var_vcenter_fqdn  -User $var_stored_creds.User -Password $var_stored_creds.Password

# Retrieve list of powered on Windows VMS 
$VMs = (Get-VM).where{$_.PowerState -eq 'PoweredOn' -and $_.Guest.OSFullName -match 'Windows'} | `
    Select Name, `
    @{N="Datastore";E={[string]::Join(',',(Get-Datastore -Id $_.DatastoreIdList | Select -ExpandProperty Name))}}, `
    @{N="Folder";E={$_.Folder.Name}},VMHost,HardwareVersion,Notes

# Write a TXT file to each server
foreach($VM in $VMs){
    $network_infos= (Get-NetworkAdapter -VM $VM.Name)
    $txt_content="ESXI Host: 	" +$VM.VMHost 
    $txt_content+="`r`nDatastore(s): 	" +$VM.Datastore
    $txt_content+="`r`nNetwork name/adapter type: 	" +($network_infos | Select -ExpandProperty NetworkName) + " (" +($network_infos | Select -ExpandProperty Type) + ")"
    $txt_content+="`r`nHW Version: 	" +$VM.HardwareVersion
    $txt_content+="`r`nVM Folder: 	" +$VM.Folder
    if ($VM.Notes) { 
        $txt_content+="`r`n`r`nNotes`r`n"
        # Replacing the new line characters with the ones compatible with txt file
        $txt_content+=$VM.Notes -replace "\r?\n|\r", "`r`n"
    }
    $txt_content | Set-Content -path ("J:\vmware\" + $VM.Name + ".txt")
}

# Umount path
Remove-SmbMapping -LocalPath "J:" -Force | Out-Null