# Bginfo var_path and vexecutable
$var_path='\\<DOMAIN NAME>\sysvol\numcom.local\Policies\<POLICY ID>\User\Scripts\Logon\'
$var_exe = $var_path + "Bginfo.exe"
$var_param ="/accepteula /timer:00 /SILENT"
# Needed to manage the spaces inside the param variable
$var_parameters = $var_param.Split(" ")
# Load specific configuration file based on partial match of the computer name variable
switch -Regex ( $env:computername ){
    'DC' { $var_config = $var_path +  'DC.bgi'}
    default { $var_config = $var_path + 'DEFAULT.bgi'}
}
# BGInfo var_var_execution
& $var_exe $var_config $var_parameters