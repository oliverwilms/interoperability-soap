Class dc.soap.Util
{

ClassMethod Setup() As %Status
{
	Set tSC = $$$OK
	Set tSC = ##class(dc.soap.Security).ImportResources()
	Set tSC = ##class(dc.soap.Security).ImportRoles()
	Set tSC = ##class(dc.soap.Security).CreateWebAppSoapapp()
	Set tSC = ##class(dc.soap.Util).StartISCSOAPLog()
	Quit tSC
}

ClassMethod StartISCSOAPLog() As %Status
{
	Set tSC = $$$OK
	Set ^ISCSOAP("Log")="iosH"
	Set ^ISCSOAP("Logfile")="/irissys/data/IRIS/mgr/ISCSOAP.log"
	Set ^ISCSOAP("Logfile")="/usr/irissys/mgr/ISCSOAP.log"
	Quit tSC
}

}
