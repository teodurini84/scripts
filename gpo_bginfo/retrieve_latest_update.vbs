' Retrieve latest success installation date
Set obj_autoupdate = CreateObject("Microsoft.Update.AutoUpdate")
var_timestamp = obj_autoupdate.Results.LastInstallationSuccessDate

' Format it with two digits
' Echo is not a valid vbscript command but we must use the above syntax as this is what gets parsed back to BGINFO
' For debugging purpose, add Wscript. in front of echo
Echo Right(String(2, "0") & Day(var_timestamp), 2) & "/" & Right(String(2, "0") & Month(var_timestamp), 2) & "/" & Year(var_timestamp)