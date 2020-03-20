# gpo_bginfo #
The purpose of this script is to launch BGInfo from a GPO  
forcing a specific template based on the hostname check

## Instructions ##
Create a GPO in your DC enable the following options  
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
