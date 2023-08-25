Class cls.ZMSPMB.MessageBank.ZMSP.MessageBank.SearchTable Extends Ens.CustomSearchTable
{

Property ClientIdC As %String(MAXLEN = 100);

Index ClientIdIdx On ClientIdC [ Type = bitmap ];

Property NodeIdC As %String(MAXLEN = 500);

Index NodeIdIdx On NodeIdC [ Type = bitmap ];

Property TimeBankedC As Ens.DataType.UTC;

Index TimeBankedIdx On TimeBankedC [ Type = bitmap ];

/*
ClientBodyClassName
ClientBodyId
ClientCorrespondingMessageId
ClientId
ClientSessionId
ID
NodeId
TimeBanked
*/
Parameter DOCCLASS = "Ens.Enterprise.MsgBank.MessageHeader";

ClassMethod OnIndexDoc(pDocObj As Ens.Enterprise.MsgBank.MessageHeader, pSearchTable As ZMSP.MessageBank.SearchTable) As %Status
{

  // Set the properties
  Set pSearchTable.ClientIdC = pDocObj.ClientId
  Set pSearchTable.NodeIdC = pDocObj.NodeId
  Set pSearchTable.TimeBankedC = pDocObj.TimeBanked
  Quit $$$OK
}

Storage Default
{
<Data name="SearchTableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ClientId</Value>
</Value>
<Value name="3">
<Value>DocId</Value>
</Value>
<Value name="4">
<Value>NodeId</Value>
</Value>
<Value name="5">
<Value>TimeBanked</Value>
</Value>
<Value name="6">
<Value>ClientIdC</Value>
</Value>
<Value name="7">
<Value>NodeIdC</Value>
</Value>
<Value name="8">
<Value>TimeBankedC</Value>
</Value>
</Data>
<DataLocation>^ZMSP.MessageBank.SearchTableD</DataLocation>
<DefaultData>SearchTableDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^ZMSP.MessageBank.SearchTableD</IdLocation>
<IndexLocation>^ZMSP.MessageBank.SearchTableI</IndexLocation>
<StreamLocation>^ZMSP.MessageBank.SearchTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
