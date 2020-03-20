# vmware_cli #
Scripts used to automate vmware tasks  
```powershell
# Install
Install-Module -Name VMware.PowerCLI -Scope AllUsers
# Update
Update-Module -Name VMware.PowerCLI
# Uninstall
Get-module VMware.* -listAvailable | Uninstall-Module -Force
```
### CLI_Suppress_certs_warnings.ps1 ###
