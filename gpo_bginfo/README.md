# gpo_bginfo #
The purpose of this script is to launch BGInfo from a GPO  
forcing a specific template based on the hostname check

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
