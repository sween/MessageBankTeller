Class cls.ZMSPMB.MessageBank.ZMSP.MessageBank.HelperClass
{

ClassMethod OnBankMsg(pHeader As Ens.Enterprise.MsgBank.MessageHeader, pFullHeaderID As %String, pBody As %RegisteredObject = "", pFullBodyID As %String, pService As Ens.Enterprise.MsgBank.TCPService) As %Status
{
  /*
  If (pHeader.ClientBodyClassName="EnsLib.HL7.Message") {  //Ens.Message to include multiple clients
    Set pStream = ##class(%Stream.GlobalCharacter).%OpenId(pHeader.MessageBodyId)
    Do ##class(ZMSP.MessageBank.SearchTable).IndexDoc(pStream)
  }
  Do ##class(ZMSP.MessageBank.SearchTable).IndexDoc(pHeader)
  */
  Do ##class(ZMSP.MessageBank.SearchTable).IndexDoc(pHeader)
  Quit $$$OK
}

}
