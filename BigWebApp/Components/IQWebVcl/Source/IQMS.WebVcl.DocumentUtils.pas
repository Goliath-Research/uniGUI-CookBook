unit IQMS.WebVcl.DocumentUtils;

interface

uses
    SysUtils;
    
type

  TOnGetMasterTableNameEvent = procedure( Sender: TObject; var AMasterTableName: string ) of object;
  TOnGetIndexFieldNames = procedure( Sender: TObject; var AIndexFieldNames: string ) of object;

  function GetPrintWithDisplay( const APrintWith: String ): String;

implementation

uses
    IQMS.WebVcl.ResourceStrings;

function GetPrintWithDisplay( const APrintWith: String ): String;
begin
     { NOTE:  This method receives the literal "print with" value we save
              to the database, and returns text to display to the user.
              We do this for internationalization -- to allow the "Print With"
              text to be translated.

              When modifying the "Print With", always modify this list to ensure
              they are in sync. See \iqwin\vcl\IQMS.WebVcl.ResourceStrings.pas for resource strings.
     }

          if ( UpperCase( APrintWith ) = 'ALL'                ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000285 // 'All'
     else if ( UpperCase( APrintWith ) = 'BOM'                ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000286 // 'BOM'
     else if ( UpperCase( APrintWith ) = 'CRM QUOTE'          ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000299 // 'CRM Quotation'
     else if ( UpperCase( APrintWith ) = 'INSPECT RECEIPT'    ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000287 // 'Inspection Receipt'
     else if ( UpperCase( APrintWith ) = 'INVOICE'            ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000288 // 'Invoice'
     else if ( UpperCase( APrintWith ) = 'NONE'               ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000059 // 'None'
     else if ( UpperCase( APrintWith ) = 'PACKING SLIP'       ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000289 // 'Packing Slip'
     else if ( UpperCase( APrintWith ) = 'PM WORK ORDER'      ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000290 // 'MRO Work Order'
     else if ( UpperCase( APrintWith ) = 'PO'                 ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000291 // 'PO'
     else if ( UpperCase( APrintWith ) = 'PROJECT'            ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000292 // 'Project'
     else if ( UpperCase( APrintWith ) = 'PROJECT WORK ORDER' ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000293 // 'Project Work Order'
     else if ( UpperCase( APrintWith ) = 'RFQ'                ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000294 // 'RFQ'
     else if ( UpperCase( APrintWith ) = 'SALES ORDER'        ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000295 // 'Sales Order'
     else if ( UpperCase( APrintWith ) = 'SALES ORDER ACK'    ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000296 // 'Sales Order Acknowledgement'
     else if ( UpperCase( APrintWith ) = 'WEB'                ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000297 // 'Web'
     else if ( UpperCase( APrintWith ) = 'WORK ORDER'         ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000298 // 'Work Order'
     else if ( UpperCase( APrintWith ) = 'COC'                ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000328 // 'Certificate of Conformance'
     else if ( UpperCase( APrintWith ) = 'ROUTING PACKET'     ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000333 // 'Routing Packet'
     else if ( UpperCase( APrintWith ) = 'VENDOR_RFQ_HDR'     ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000355 // 'Vendor RFQ'
     else if ( UpperCase( APrintWith ) = 'REWORK'             ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000369 // 'Rework Work Order'
     else if ( UpperCase( APrintWith ) = 'PICKTICKET'         ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000376 // 'PickTicket'
     else if ( UpperCase( APrintWith ) = 'VENDOR RFQ'         ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000399 //  'Vendor RFQ'
     else if ( UpperCase( APrintWith ) = 'AR INVOICE'         ) then Result := IQMS.WebVcl.ResourceStrings.cTXT0000579 //  'Ar Invoice'
     else Result := UpperCase( APrintWith ); // if all else fails, return the constant
end;

end.
