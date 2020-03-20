# gpo_bginfo #
The purpose of this script is to launch BGInfo from a GPO forcing a specific template based on the hostname check
## Description of files ##
### DC.bgi ###
BGINFO template specific for DCs, it's retrieving extra informations file FSMO roles and DNS resolvers from registry
### DEFAULT.bgi ###
BGINFO default template
### gpo_script.ps1 ###
PowerShell script executed by the policy itself.  
Adjust var_path with the path of the GPO in your DFS
### retrieve_fsmo_roles.vbs ###
Retrieve the FSMO servers for each role
### retrieve_latest_update.vbs ###
Retrieve the last Windows Update installation
### retrieve_server_roles_features.vbs ###
Retrieve the server roles and features, excluding commons one
### retrieve_vmware_files.vbs ###
Retrieve txt file from the vmware folder, matching hostname with vm name
Adjust var_path with the path of the GPO in your DFS
## Instructions ##
### GPO Creation ###
Create an empty GPO go to  
User Configuration  
-> Policies  
-> Windows Settings  
-> Scripts  
-> Logon  
Click on Show files  
### Files in GPO Folder ###
Copy all the files to this folder and create the vmware subfolder  
### GPO settings ###
The computer configuration is needed to enable the loopback and link the policy to the OU containing your machines, applying it at the user level  
Computer Configuration  
-> Policies  
-> Administrative Templates  
-> System/Group Policy  
Configure user Group Policy loopback processing mode => Enabled  
  
User Configuration  
-> Policies  
-> Windows Settings  
-> Scripts  
-> Logon  
For this GPO, Script order: Windows PowerShell scripts will run first  
Name        gpo_script.ps1  
Parameters  -executionpolicy bypass  
