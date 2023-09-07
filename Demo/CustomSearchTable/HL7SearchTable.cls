Class Demo.CustomSearchTable.HL7SearchTable Extends (%Persistent, Ens.VDoc.SearchTable) [ ClassType = persistent, CompileAfter = EnsLib.HL7.Message, Inheritance = right, ProcedureBlock, System = 4 ]

{

Parameter DOCCLASS = "EnsLib.HL7.Message";

Parameter EXTENTSIZE = 4000000;

/* Re-declare indices because the superclass is abstract */

Index indexValue On (PropId, PropValue, DocId) [ IdKey, Unique ];

Index indexDocId On (DocId, PropId, PropValue) [ Unique ];

XData SearchSpec [ XMLNamespace = "http://www.intersystems.com/EnsSearchTable" ]

{

<Items>

<Item DocType=""  PropName="MSHTypeName" Unselective="true">{1:9.1}_"_"_{1:9.2}</Item>

<Item DocType=""  PropName="MSHControlID" PropType='String:CaseSensitive' >{1:10}</Item>

<Item DocType=""  PropName="PatientID"   >[PID:2.1]</Item>

<Item DocType=""  PropName="PatientID"   >[PID:3().1]</Item>

<Item DocType=""  PropName="PatientID"   >[PID:4().1]</Item>

<Item DocType=""  PropName="PatientName" >[PID:5()]</Item>

<Item DocType=""  PropName="PatientAcct" >[PID:18.1]</Item>

<Item DocType=""  PropName="Order#"      >[ORC:2.1]</Item>

<Item DocType=""  PropName="Order#"      >[SCH:26.1]</Item>

<Item DocType=""  PropName="Order#"      >[ZOR:1]</Item>

<Item DocType=""  PropName="Accession#"  >[ORC:3.1]</Item>

<Item DocType=""  PropName="SIUVisitType">[AIS():3.1]</Item>

<Item DocType=""  PropName="SIUProvider#">[AIP():3.1]</Item>

</Items>

}


}
