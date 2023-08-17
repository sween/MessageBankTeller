Class ZMSP.MessageBank.HelperClass
{

//Property myproperty As ... //This actually needs to be a part of the Ens.Message

ClassMethod OnBankMsg(pHeader As Ens.Enterprise.MsgBank.MessageHeader, pFullHeaderID As %String, pBody As %RegisteredObject = "", pFullBodyID As %String, pService As Ens.Enterprise.MsgBank.TCPService) As %Status
{
  If (pHeader.ClientBodyClassName="EnsLib.HL7.Message") {  //Ens.Message to include multiple clients
    Set pStream = ##class(%Stream.GlobalCharacter).%OpenId(pHeader.MessageBodyId)
    Do ##class(ZMSP.MessageBank.SearchTable).IndexDoc(pStream)
  }
  Quit $$$OK

}
}