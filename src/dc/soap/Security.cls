Class dc.soap.Security
{

ClassMethod CreateWebAppSoapapp(
	pVars,
	pLogLevel,
	tInstaller) As %Status
{
	If $IsObject($Get(tInstaller)) {
		Set Namespace = tInstaller.Evaluate("${Namespace}")
		Do tInstaller.PushNS("%SYS")
	}
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
	Set cspProperties("Path") = "/voldata/icsp/feederapp"
	Set cspProperties("Resource") = ""
	Set cspProperties("ServeFiles") = 1
	Set tSC = ##class(Security.Applications).Create(cspName,.cspProperties)
	If ($Data(tInstaller)) Do tInstaller.PopNS()
	If $$$ISERR(tSC) Throw ##class(%Installer.Exception).CreateFromStatus(tSC)
	Quit $$$OK
}

ClassMethod CreateWebApp() As %Status
{
	Set tSC = $$$OK
	Quit tSC
}

}
