Set obj_root_dse = GetObject("LDAP://rootDSE")
Set obj_schema = GetObject("LDAP://" & obj_root_dse.Get("schemaNamingContext"))
var_schema_master = obj_schema.Get("fSMORoleOwner")
Set obj_ntds = GetObject("LDAP://" & var_schema_master)
Set obj_server = GetObject(obj_ntds.Parent)
var_output = "Schema Master:	" & Replace(obj_server.Name,"CN=","") 
Set obj_ntds = Nothing
Set obj_server = Nothing

Set obj_partitions = GetObject("LDAP://CN=Partitions," & obj_root_dse.Get("configurationNamingContext"))
var_domain_naming_master = obj_partitions.Get("fSMORoleOwner")
Set obj_ntds = GetObject("LDAP://" & var_domain_naming_master)
Set obj_server = GetObject(obj_ntds.Parent)
var_output =  var_output & vbCrLf  & "Domain Naming Master:	" & Replace(obj_server.Name,"CN=","") 

Set obj_domain = GetObject ("LDAP://" & obj_root_dse.Get("defaultNamingContext"))
var_pdc_emulator = obj_domain.Get("fSMORoleOwner")
Set obj_ntds = GetObject("LDAP://" & var_pdc_emulator)
Set obj_server = GetObject(obj_ntds.Parent)
var_output =  var_output & vbCrLf & "PDC Emulator:	" & Replace(obj_server.Name,"CN=","") 

Set obj_rid_manager = GetObject("LDAP://CN=RID Manager$,CN=System," & obj_root_dse.Get("defaultNamingContext"))
var_rid_manager = obj_rid_manager.Get("fSMORoleOwner")
Set obj_ntds = GetObject("LDAP://" & var_rid_manager)
Set obj_server = GetObject(obj_ntds.Parent)
var_output =  var_output & vbCrLf & "RID Master:	" & Replace(obj_server.Name,"CN=","") 

Set obj_infrastructure = GetObject("LDAP://CN=Infrastructure," & obj_root_dse.Get("defaultNamingContext"))
str_infrastructure_master = obj_infrastructure.Get("fSMORoleOwner")
Set obj_ntds = GetObject("LDAP://" & str_infrastructure_master)
Set obj_server = GetObject(obj_ntds.Parent)
var_output =  var_output & vbCrLf & "Infrastructure Master:	" & Replace(obj_server.Name,"CN=","") 

' Echo is not a valid vbscript command but we must use the above syntax as this is what gets parsed back to BGINFO
' For debugging purpose, add Wscript. in front of echo
echo var_output 