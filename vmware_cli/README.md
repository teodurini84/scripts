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
Suppress warnings in every script that will contact Vcenter with Self-Signed certificate
### CLI_Store_credentials.ps1 ###
Script to store credentials in the PowerCli Vault  
Create a dedicated user with proper roles  
### CLI_Remote_BGInfo.ps1 ###
Script to retrieve VM infos: it can be scheduled  
Adjust var_path with the path of the GPO in your DFS