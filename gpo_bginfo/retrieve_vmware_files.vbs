' Point to the shared folder
var_path = "\\<DOMAIN NAME>\sysvol\numcom.local\Policies\<POLICY ID>\User\Scripts\Logon\vmware"

' Retrieve the computer name
Set wshShell = CreateObject( "WScript.Shell" )
var_computername = wshShell.ExpandEnvironmentStrings( "%COMPUTERNAME%" )

' Retrieve the content of the proper text file
Set obj_filetoread = CreateObject("Scripting.FileSystemObject").OpenTextFile(var_path + "\" + var_computername + ".txt",1)
var_textfile = obj_filetoread.ReadAll()
obj_filetoread.Close
Set obj_filetoread = Nothing

' Echo is not a valid vbscript command but we must use the above syntax as this is what gets parsed back to BGINFO
' For debugging purpose, add Wscript. in front of echo
Echo var_textfile 