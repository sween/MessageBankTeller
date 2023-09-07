Class MSP.MessageBank.Task.TuneTables Extends %SYS.Task.Definition
{

/* Examples from CH Gig
/// How many days of messages should not be purged
Property NumberOfDaysToKeep As %Integer(MINVAL = 0) [ InitialExpression = 120 ];

/// Preserve messages not yet completely processed
Property KeepIntegrity As %Boolean [ InitialExpression = 1 ];

/// Delete message bodies whenever their message header is deleted. This is off by default because some Productions may
/// use message objects that are part of a larger environment and not transitory.
Property BodiesToo As %Boolean [ InitialExpression = 1 ];
*/
/// The type of thing to purge
Property BanksToTune As %String(DISPLAYLIST = ",THH,NWL,Messages,Business Processes,Rule Logs,I/O Logs,Host Monitor Data,Managed Alerts", VALUELIST = ",THH,NWL") [ InitialExpression = "THH", Required ];


/// This defines the user-visible name of this task
Parameter TaskName As STRING = "ZMSP NWL Message Bank Tune Table";

/// Allows the user to select the namespaces
/// 
/// Property Namespaces As %List;
/// This method is responsible for executing the task.<br>
/// At the scheduled time, the Task Manager creates an instance of this object,
/// sets any property values using the stored "settings" for the task, and then
/// invokes this method to execute the task.<br>
/// In order to execute a real task, override this method in a subclass.
Method OnTask() As %Status
{
	Set tStatus = ..Process()

	Quit tStatus
}

/*
Do we want to loop over all of the trusts and do it, or specify
as a property?

Set payloadarr = ##class(ZMSP.HCCBankInstaller).GetBankNamespaces()

*/
/// https://docs.intersystems.com/irislatest/csp/documatic/%25CSP.Documatic.cls?CLASSNAME=%25SYSTEM.SQL.Stats.Table
/// TUNE TABLE Ens_Enterprise_MsgBank.MessageHeader %RECOMPILE_CQ
ClassMethod Process() As %Status
{
	Set tStatus = $$$OK
	//..BanksToTune
	Try {
        // Backup Current Stats
        Do $SYSTEM.SQL.Stats.Table.Export("/tmp/tunestats.xml","Ens_Enterprise_MsgBank","MessageHeader")
		//Do ##class(SYS.ICM).FlushToDisk()
		// Clear Current Status
        Do $SYSTEM.SQL.Stats.Table.ClearTableStats("""Ens_Enterprise_MsgBank"".MessageHeader","/tmp/cleartable.log")
        //Do ##class(SYS.ICM).FlushToDisk()
		Do $SYSTEM.SQL.Stats.Table.GatherTableStats("""Ens_Enterprise_MsgBank"".MessageHeader","/tmp/tunetable.log")
		$$$ThrowOnError(tStatus)
	} Catch eException {
		Set tStatus = eException.AsStatus()
	}
	Quit tStatus
}
ClassMethod SetRW() As %Status
{
	Set tSC = $$$OK
	set tSC = ##Class(Config.Databases).Get("/data/db/mgr/enslib/", .p)
	
	set dir = p("Directory")
	set db = ##class(SYS.Database).%OpenId(dir)

	set db.ReadOnly=0  //switch to read only mode
	set tSC = db.%Save()
	Quit tSC

}

ClassMethod SetRO() As %Status
{
	Set tSC = $$$OK
	set tSC = ##Class(Config.Databases).Get("/data/db/mgr/enslib/", .p)
	
	set dir = p("Directory")
	set db = ##class(SYS.Database).%OpenId(dir)

	set db.ReadOnly=1  //switch to read only mode
	set tSC = db.%Save()
	Quit tSC

}


}
