Class dc.soap.Util
{

ClassMethod StartISCSOAPLog() As %Status
{
	Set tSC = $$$OK
	Set ^ISCSOAP("Log")="iosH"
	Set ^ISCSOAP("Logfile")="/irissys/data/IRIS/mgr/ISCSOAP.log"
	Set ^ISCSOAP("Logfile")="/usr/irissys/mgr/ISCSOAP.log"
	Quit tSC
}

}
