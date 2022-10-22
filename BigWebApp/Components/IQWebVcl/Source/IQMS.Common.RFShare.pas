unit IQMS.Common.RFShare;

interface

uses
  System.SysUtils,
  IQMS.Common.DataLib,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys;

function GetRFPrinter( AReportName: string ): string;
function GetPalletType(AArinvt_ID: Real): string;

function GetLabelID( APalletKind: string; AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real;
function GetLabelIDEx(ALabelType, ALabelKind: string; AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real;
function GetLabelIDExA( AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real;
function GetLabelIDExB( AARinvt_ID: Real; AOrders_ID: Real = 0 ): Real;

function GetLabelIDBasedOn_Item_Customer_Ship_To( AArinvt_ID, AArcusto_ID, AShip_To_ID: Real ): Real;

function IsCRWLabel(ALMLabelsID: Real): Boolean;
function GetLotnoWithVendorPrefix(ALot, APrefix:String):String;
function CheckVendorVMILocID( AArinvt_ID , ALocID, AVendor_ID : real ) : boolean;
function CheckIsArinvtVendorVMI( AArinvt_ID, AVendor_ID : real ) : boolean;

implementation

uses
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.RfProShare,
  IQMS.PrintLabels.DmLm,
  System.Variants;

function GetRFPrinter( AReportName: string ): string;
var
  AReportKind : string;
begin
  AReportKind:= SelectValueFmtAsString('select report_kind from v_iqsys_reports where upper(report_name) = ''%s''', [ UpperCase( AReportName ) ]);
  if (UpperCase(AReportKind) = 'COC') or (UpperCase(AReportKind) = 'COMMERCIAL INVOICE') then
    Result:= SelectValueFmtAsString('select attribute from rf_profile where upper(module_name) = ''RECVTICK.RPT'' and userid = ''%s'' and topic = ''PRINTER''', [ SecurityManager.UserName ])
  else
    Result:= SelectValueFmtAsString('select attribute from rf_profile where upper(module_name) = ''%s'' and userid = ''%s'' and topic = ''PRINTER''', [ UpperCase( AReportName ), SecurityManager.UserName ]);
end;

function GetPalletType(AArinvt_ID: Real): string;
begin
  if SelectValueByID('standard_id', 'arinvt', AArinvt_ID ) > 0 then
     Result:= 'MFG'
  else
     Result:= 'RAW';
end;

function GetLabelID( APalletKind: string; AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real;
var
  ALabelKind : string;
  ALabelType : string;
begin
  Result:= 0;
  if APalletKind = '' then        {Non pallet, raw material}
     begin
       ALabelKind:= 'RF';
       ALabelType:= 'PURCHASED';
     end
  else if APalletKind = 'DETERMINE' then {from Receiving w/o PO or dispo by item}
     begin
       ALabelKind:= 'RF';
       if SelectValueByID('standard_id', 'arinvt', AArinvt_ID ) > 0 then
          ALabelType:= 'MANUFACTURED'
       else   
          ALabelType:= 'PURCHASED'
     end   
  else
     begin
       ALabelKind:= 'PALLET';
       if APalletKind = 'RAW' then
          ALabelType:= 'PURCHASED'
       else if APalletKind = 'MFG' then
          ALabelType:= 'MANUFACTURED'
       else if APalletKind = 'MIXED' then
          ALabelType:= 'MIXED'
       else                        
          EXIT;  {should not happen}
     end;

  Result:= GetLabelIDEx( ALabelType, ALabelKind, AARinvt_ID, APS_Ticket_ID );
end;

function GetLabelIDEx(ALabelType, ALabelKind: string; AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real; 
var
  S          : string;
  AArcusto_ID: Real;
  ASource    : string;
begin
  {Get label ID from Arinvt or rf_profile if exists}
  if ALabelKind <> 'PALLET' then
  begin
     Result:= Profile_Get_AttachmentAsReal( PRO_LABELS, PRO_ITEM_LABEL, 'ARINVT', AArinvt_ID );
     if Result > 0 then
        EXIT;
     
     Result:= SelectValueByID( 'lm_labels_id', 'arinvt', AArinvt_ID );
     if Result > 0 then
        EXIT;
  end;

  {Get Label ID from RF_PRofile. ALabelType - 'MANUFACTURED', 'PURCHASED'. ALabelKind - 'PALLET', 'RF' }
  ASource:=  ALabelType + '_' + ALabelKind;
  Result := Profile_Get_Source_ID( PRO_LABELS, PRO_SOURCE_ID, ASource );    {RF_Pro.pas}
  if Result > 0 then
     EXIT;

  {Get labels_id by type, kind and eplant}
  S:= Format('select id from lm_labels   '+                   
             ' where label_type = ''%s'' '+
             '   and label_kind = ''%s'' '+
             '   and misc.eplant_filter(eplant_id) = 1', 
             [ ALabelType, ALabelKind ]);

  {Customer specific}
  {for now APS_Ticket_ID is passed only when printing mixed labels so we could get to arcusto}           
  if APS_Ticket_ID > 0 then
  begin
    AArcusto_ID:= SelectValueFmtAsFloat( 'select s.arcusto_id from ship_to s, ps_ticket t where t.id = %f and t.ship_to_id = s.id', [ APS_Ticket_ID ]);
    if AArcusto_ID > 0 then
       Result:= SelectValueFmtAsFloat( '%s and arcusto_id = %f', [ S, AArcusto_ID ])
    else   
       Result:= SelectValueFmtAsFloat( '%s and arcusto_id is null', [ S ]);
    if Result > 0 then
       EXIT;
  end;          
             
  {Default Customer specific}
  AArcusto_ID:= SelectValueByID( 'arcusto_id', 'arinvt', AArinvt_ID );

  // attempt to find a label for specific customer
  if AArcusto_ID > 0 then
     Result:= SelectValueFmtAsFloat( '%s and arcusto_id = %f', [ S, AArcusto_ID ]);
  if Result > 0 then
     EXIT;

  // attempt to find a label for non specific customer   
  Result:= SelectValueFmtAsFloat( '%s and arcusto_id is null', [ S ]);
  if Result > 0 then
     EXIT;

  {Default label}
  Result:= SelectValueAsFloat( S );
end;


function GetLabelIDExA( AARinvt_ID: Real; APS_Ticket_ID: Real = 0 ): Real; 
var
  A          : Variant;
  AArcusto_ID: Real;
  AShip_To_ID: Real;
begin
  {APS_Ticket_ID is passed when reprinting labels due to SALES ORDER MISMATCH so we could get to arcusto}           
  AArcusto_ID:= -1;
  AShip_To_ID:= 0;
  
  A:= SelectValueArrayFmt( 'select s.arcusto_id, s.id from ship_to s, ps_ticket t where t.id = %f and t.ship_to_id = s.id', [ APS_Ticket_ID ]);
  if VarArrayDimCount( A ) > 0 then 
  begin
    AArcusto_ID:= A[ 0 ];
    AShip_To_ID:= A[ 1 ];
  end;

  Result:= GetLabelIDBasedOn_Item_Customer_Ship_To( AArinvt_ID, AArcusto_ID, AShip_To_ID );
end;


function GetLabelIDExB( AARinvt_ID: Real; AOrders_ID: Real = 0 ): Real; 
var
  A          : Variant;
  AArcusto_ID: Real;
  AShip_To_ID: Real;
begin
  {AOrders_ID is passed when reprinting labels due to SALES ORDER BASED REPRINT}           
  AArcusto_ID:= -1;
  AShip_To_ID:= 0;
  
  A:= SelectValueArrayFmt( 'select arcusto_id, ship_to_id from orders where id = %f', [ AOrders_ID ]);
  if VarArrayDimCount( A ) > 0 then 
  begin
    AArcusto_ID:= A[ 0 ];
    AShip_To_ID:= A[ 1 ];
  end;

  Result:= GetLabelIDBasedOn_Item_Customer_Ship_To( AArinvt_ID, AArcusto_ID, AShip_To_ID );
end;


function GetLabelIDBasedOn_Item_Customer_Ship_To( AArinvt_ID, AArcusto_ID, AShip_To_ID: Real ): Real; 
var
  ALM_DM     : TLM_DM;
begin
  {Use the same query as in EIQ to determine the label id}
  ALM_DM:= TLM_DM.Create(nil);
  try
    with ALM_DM.QryLabelCust do
    begin
      BeforeOpen:= NIL;
      Close;
      IQAssignEPlantFilter( ALM_DM.QryLabelCust );

      ParamByName('nID').Value := AArcusto_ID;
      ParamByName('arinvt_id').Value := AArinvt_ID;
      ParamByName('ship_to_id').Value := AShip_To_ID;
      Open;
      
      if not Eof then
         Result:= FieldByName('id').asFloat
      else   
         Result:= 0;
    end;
  finally
    ALM_DM.Free;
  end;  
end;


function IsCRWLabel( ALMLabelsID: Real ): Boolean;
begin
  Result:= ( Trim(SelectValueByID( 'report_name', 'lm_labels', ALMLabelsID )) <> '' );
end;

function GetLotnoWithVendorPrefix(ALot, APrefix:String):String;
begin
  Result := ALot;
  if APrefix <> '' then
  begin
    Result := APrefix + Result;
    if Length(Result) > 25 then
      raise Exception.Create(Format('Lot# %s cannot be longer than 25 characters.', [Result]));
  end;
end;

function CheckVendorVMILocID( AArinvt_ID , ALocID, AVendor_ID : real ) : boolean;
var
  ACount: Real;
begin
  Result := False;

  {Not Vendor VMI, then pass!}
  // if SelectValueFmtAsFloat('select count(id) from arinvt_vendors     '+
  //                              ' where arinvt_id = %.0f  '+
  //                              '   and vendor_id = %.0f  '+
  //                              '   and vmi_locations_id is not null ',
  //                                                        [ AArinvt_ID,
  //                                                          AVendor_ID ]) = 0
  if SelectValueFmtAsFloat('select po_misc.vmi_loc_count( %f, %f ) from dual', [ AVendor_ID, AArinvt_ID ]) = 0 then
     Result := True
  else
    {Is Vendor VMI, ensure they chose the correct location}
    // Result := SelectValueFmtAsFloat('select 1 from arinvt_vendors   '+
    //                               ' where arinvt_id = %.0f  '+
    //                               '   and vendor_id = %.0f  '+
    //                               '   and vmi_locations_id = %.0f ',
    //                                                    [ AArinvt_ID,
    //                                                      AVendor_ID,
    //                                                      ALocID ]) = 1;
    Result:= SelectValueFmtAsFloat('select po_misc.vmi_loc_count( %f, %f, %f ) from dual', [ AVendor_ID, AArinvt_ID, ALocID ]) > 0;
end; 

function CheckIsArinvtVendorVMI( AArinvt_ID, AVendor_ID : real ) : boolean;
begin
  Result:= SelectValueFmtAsFloat('select po_misc.vmi_loc_count( %f, %f ) from dual', [ AVendor_ID, AArinvt_ID ]) > 0;
  
  // Result := False;
  // if SelectValueFmtAsFloat('select count(id) from arinvt_vendors     '+
  //                              ' where arinvt_id = %.0f  '+
  //                              '   and vendor_id = %.0f  '+
  //                              '   and vmi_locations_id is not null ',
  //                                                        [ AArinvt_ID,
  //                                                          AVendor_ID ]) > 0
  //   then Result := True
end;

end.



