Class ZMSP.MessageBank.SearchTable Extends Ens.CustomSearchTable
{
Property ClientId As %String(MAXLEN = 1000);

Index ClientId On ClientId [ Type = bitmap ];

Parameter DOCCLASS = "Ens.Enterprise.MsgBank.MessageHeader";

ClassMethod OnIndexDoc(pDocObj As %Persistent, pSearchTable As Ens.CustomSearchTable) As %Status
{

  // Set the properties
  Set pSearchTable.ClientId = pDocObj.ClientId
  Quit $$$OK

}
}