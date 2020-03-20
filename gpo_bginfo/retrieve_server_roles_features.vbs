' Default output if no special roles and features will be discovered
var_output="No special roles or features found"
i=0

' WMI Query to retrieve all the roles and features, excluding the basic and child ones 
var_wmi_query = "SELECT Name FROM Win32_ServerFeature WHERE ParentID='' " & _
"AND Not Name LIKE '%PowerShell%' " & _
"AND Not Name LIKE 'WoW64%' " & _
"AND Not Name Like '%Defender%' " & _
"AND Not Name LIKE 'SMB 1.0%' " & _
"AND Not Name LIKE '.NET Framework%'"  & _
"AND Not Name ='Telnet Client' " & _
"AND Not Name ='File and Storage Services' "
Set obj_locator = CreateObject("WbemScripting.SWbemLocator")
Set obj_service = obj_locator.ConnectServer(".", "root\cimv2")
obj_service.Security_.ImpersonationLevel = 3
Set var_roles = obj_service.ExecQuery(var_wmi_query)
For each var_role in var_roles
    ' Concatenation, avoiding to put an empty row
    If i = 0 Then  var_output=var_role.Name Else var_output=var_output & vbCrLf & var_role.Name End If
    i=i+1
Next

' Echo is not a valid vbscript command but we must use the above syntax as this is what gets parsed back to BGINFO
' For debugging purpose, add Wscript. in front of echo
echo var_output