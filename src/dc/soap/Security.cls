Class dc.soap.Security
{

ClassMethod AddServicesRoleToUnknownUser() As %Status
{
	New $NAMESPACE
	Set $NAMESPACE = "%SYS"
	Set tRoles = "Services_Role"
	Set tUsername = "UnknownUser"
	Set tSC = ##class(Security.Users).AddRoles(tUsername,tRoles)
	Quit tSC
}

ClassMethod CreateServicesRole() As %Status
{
	New $NAMESPACE
	Set $NAMESPACE = "%SYS"
	Set tRole = ##class(Security.Roles).%New()
	Set tRole.Description = "Services Role"
	Set tRole.Name = "Services_Role"
	Set tSC = tRole.%Save()
	Quit tSC
}

ClassMethod CreateWebAppSoapapp(
	pVars,
	pLogLevel,
	tInstaller) As %Status
{
	New $NAMESPACE
	If $IsObject($Get(tInstaller)) {
		Set Namespace = tInstaller.Evaluate("${Namespace}")
		Do tInstaller.PushNS("%SYS")
	}
	Set $NAMESPACE = "%SYS"
	Do ##class(Security.System).GetInstallationSecuritySetting(.security)
	If (security="None") {
		Set cspProperties("AutheEnabled") = $$$AutheUnauthenticated
	} Else {
		Set cspProperties("AutheEnabled") = $$$AutheCache // Password
	}
	Set cspName = "/soapapp"
	Set cspProperties("NameSpace") = $Get(Namespace,"USER")
	Set cspProperties("Enabled") = 1
	Set cspProperties("AutheEnabled") = $$$AutheUnauthenticated + $$$AutheCache
	Set cspProperties("DeepSeeEnabled") = 1
	Set cspProperties("DispatchClass") = "EnsLib.SOAP.GenericService"
	Set cspProperties("iKnowEnabled") = 0
	//Set cspProperties("MatchRoles") = "%All"
	Set cspProperties("Path") = "/voldata/icsp/feederapp"
	Set cspProperties("Resource") = ""
	Set cspProperties("ServeFiles") = 1
	Set tSC = ##class(Security.Applications).Create(cspName,.cspProperties)
	If ($Data(tInstaller)) Do tInstaller.PopNS()
	If $$$ISERR(tSC) Throw ##class(%Installer.Exception).CreateFromStatus(tSC)
	Quit $$$OK
}

ClassMethod ImportData() As %Status
{
	Set tSC = ..ImportResources()
	Set tSC = ..ImportRoles()
	Quit tSC
}

ClassMethod ImportResources(pFileName As %String = "") As %Status
{
	New $NAMESPACE
	If (pFileName = "") {
		Set mgr = $ZU(12)
		Set path = mgr_"data/"
		Set pFileName = path_"ResourcesExport.xml"
	}
	Set $NAMESPACE = "%SYS"
	Set tSC = ##class(Security.Resources).Import(pFileName)
	Quit tSC
}

ClassMethod ImportRoles(pFileName As %String = "") As %Status
{
	New $NAMESPACE
	If (pFileName = "") {
		Set mgr = $ZU(12)
		Set path = mgr_"data/"
		Set pFileName = path_"RolesExport.xml"
	}
	Set $NAMESPACE = "%SYS"
	Set tSC = ##class(Security.Roles).Import(pFileName)
	Quit tSC
}

}
