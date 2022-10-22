unit PO_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  System.Variants,
  IQMS.Common.Controls,
//  iqmsgfrm,
  IQMS.Common.MsgFrm,
  IQMS.Common.DataLib,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.Common.DataConst;

procedure PopupARInfo(const ARCUSTO_ID:Real);
procedure PopupPOInfo(const AVENDOR_ID:Real);
procedure PopupAPInfo(const AVENDOR_ID:Real);
procedure PopupItemInfo( ANew_Arinvt_ID, AVendor_ID, AArinvt_Vendors_ID: Real );
function IsDisp_po_id_as_requisition( ADB: string = cnstFDConnectionName ):boolean;
function get_po_requisition_title( APO_ID: Real; ADB: string = cnstFDConnectionName ): string;
procedure CheckExecuteAutoEFormPO( APO_ID: Real );
procedure CheckExecuteAutoEFormPOQueue;
function GetPoDetailLeftToReceivePosted( APO_Detail_ID: Real ): Real;
function GetClosePOWithin( APO_ID: Real ): Real;
procedure CheckArinvtStdCostAssigned(AArinvtID: Real);

/// <summary> If the Inventory item unit price is greater than the standard
/// price, prompt user to continue.  If user does not wish to continue,
/// an exception will be raised, aborting the current operation.
/// </summary>
procedure CheckArinvtUnitPriceAgainstStdPrice(const AArinvtID: Int64;
  const APODetailUnitPrice: Real);

/// <summary> Determine of the GL Account requires a cost source to be
/// assigned to the detail item.
/// </summary>
/// <returns> True if GL Account requires a cost source to be assigned.
/// </returns>
function GLAccountRequiresCostSource(const AGLAcctID: Int64): Boolean;

/// <summary> Determine if the status string indicates the PO has been
/// approved.  Status will equal 'Approved'.
/// </summary>
/// <returns> True if status equals 'Approved'.</returns>
function POStatusApproved(const AStatus: string): Boolean;
/// <summary> Determine if the status string indicates the PO has not
/// been approved.  Status will equal 'Not Approved'.
/// </summary>
/// <returns> True if status equals 'Not Approved'.</returns>
function POStatusNotApproved(const AStatus: string): Boolean;
/// <summary> Determine if the status string indicates the PO has been
/// denied.  Status will equal 'Denied'.
/// </summary>
/// <returns> True if status equals 'Denied'.</returns>
function POStatusDenied(const AStatus: string): Boolean;

type
  {is used to create POs from mat_excep}
  TArinvtRec = record
    FArinvt_ID  : Real;
    FClass      : string;
    FItemNo     : string;
    FDescrip    : string;
    FDivision_ID: Real;
    FCost_Object_Source: string;
    FCost_Object_ID    : Real;
    FConsolidateDivReq: Boolean;
    FVendor_ID: Real;
  end;

  TPORelease = class;

  TPOItem = class
    FArinvt_ID  : Real;
    FClass      : string;
    FItemNo     : string;
    FDescrip    : string;
    FDivision_ID: Real;
    FPOReleases : TList;
    FCost_Object_Source: string;
    FCost_Object_ID: Real;
    FIsDropShip: Boolean;
    FTotal_Ord_Qty: Real;
    FConsolidateDivReq: Boolean;
    FVendor_ID: Real;
    FArinvt_Vendors_ID: Real;
    constructor Create( ARec: TArinvtRec ); overload;
    constructor Create; overload;
    destructor Destroy; override;
    procedure AddRelease( ADate: TDateTime; AQty: Real );
    procedure EnsureDivisionEPlantOfItemMatch;
  end;

  TPORelease  = class
    FQty        :  Real;
    FReqDate    :  TDateTime;
    constructor Create( ADate: TDateTime; AQty: Real );
  end;

  TPODropShipRec = record
    PO_Detail_ID: Real;
    PO_ID: Real;
    Vendor_ID: Real;
    Qty: Real;
    Trans_Code_ID: Real;
    TransCode: string;
    ShipDate: TDateTime;
    RecvDate: TDateTime;
    LotNo: string;
    Arinvt_ID: Real;
    Standard_ID: Real;
    Ord_Detail_ID: Real;
    FGMulti_ID: Real;
    PO_UOM: string;
    SO_UOM:string;
    IsOutSource: Boolean;
  end;


function IsPOWorkflowTemplateBased( ADatabaseName : string = cnstFDConnectionName): Boolean;

implementation

{ TPOItem }

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  po_const,
  po_rscstr,
  { TODO : POCheckStdPrice has no web conversion tag }
  //POCheckStdPrice,
  prn_doc,
  IQMS.Common.PrintDialogsShare;

constructor TPOItem.Create;
begin
  inherited Create;
  FPOReleases:= TList.Create;
end;

constructor TPOItem.Create( ARec: TArinvtRec );
begin
  inherited Create;
  FArinvt_ID         := ARec.FArinvt_ID  ;
  FClass             := ARec.FClass      ;
  FItemNo            := ARec.FItemNo     ;
  FDescrip           := ARec.FDescrip    ;
  FDivision_ID       := ARec.FDivision_ID;
  FCost_Object_Source:= ARec.FCost_Object_Source;
  FCost_Object_ID    := ARec.FCost_Object_ID;
  FConsolidateDivReq := ARec.FConsolidateDivReq;
  FVendor_ID         := ARec.FVendor_ID;
  FArinvt_Vendors_ID := 0;

  FPOReleases:= TList.Create;
end;

destructor TPOItem.Destroy;
begin
  ClearListOfObjects( FPOReleases );  {IQCtrl}
  inherited;
end;

procedure TPOItem.AddRelease( ADate: TDateTime; AQty: Real );
begin
  FPOReleases.Add( TPORelease.Create( ADate, AQty ));
end;

procedure TPOItem.EnsureDivisionEPlantOfItemMatch;
var
 AArinvt_EPlant_ID: Real;
begin
  if FDivision_ID = 0 then
     EXIT;
  AArinvt_EPlant_ID:= SelectValueByID( 'eplant_id', 'arinvt', FArinvt_ID );

  if SelectValueByID('eplant_id', 'division', FDivision_ID) <>  AArinvt_EPlant_ID then
     FDivision_ID:= 0;
end;

{ TPORelease }

constructor TPORelease.Create( ADate: TDateTime; AQty: Real );
begin
  FQty    := IQRoundEx( AQty, 2 );
  FReqDate:= ADate;
end;

procedure PopupPOInfo(const AVENDOR_ID:Real);
var
  S: String;
begin
  // S := Trim( SelectValueFmtAsString( 'select info_po from vendor where id = %.0f', [AVENDOR_ID]));
  // 03-09-2015 EIQ-6308 Vendor Master -> add new tab in for "Vendor Specific Settings"
  S := SelectValueFmtAsString('select po_misc.default_vendor_eplant_cparam( %f, %f, ''INFO_PO'') from dual',
                              [ AVENDOR_ID,
                                SecurityManager.EPlant_ID_AsFloat ]);

  if ( S > '' ) then
  begin
   Beep;
   IQShowStrModal(S); // iqmsgfrm
  end;
end;

procedure PopupAPInfo(const AVENDOR_ID:Real);
var
  S: String;
begin
  S := Trim( SelectValueFmtAsString( 'select info_ap from vendor where id = %.0f', [AVENDOR_ID]));
  if ( S > '' ) then
  begin
   Beep;
   IQShowStrModal(S); // iqmsgfrm
  end;
end;

procedure PopupARInfo(const ARCUSTO_ID:Real);
var
  S: String;
begin
  S := Trim( SelectValueFmtAsString( 'select info_ar from arcusto where id = %.0f', [ARCUSTO_ID]));
  if ( S > '' ) then
  begin
   Beep;
   IQShowStrModal(S); // iqmsgfrm
  end;
end;

procedure PopupItemInfo( ANew_Arinvt_ID, AVendor_ID, AArinvt_Vendors_ID: Real );
var
  S, S1, S2: string;
  A: Variant;
  ACaption: string;
begin
  if ANew_Arinvt_ID > 0 then
  begin
    //S1:= SelectValueFmtAsString('select rtrim(info_po) from arinvt where id = %f', [ANew_Arinvt_ID]);
    A:= SelectValueArrayFmt('select rtrim(itemno), rtrim(info_po) from arinvt where id = %f', [ ANew_Arinvt_ID ]);
    if VarArrayDimCount(A) = 0 then
       EXIT;
    ACaption:= Format(po_rscstr.cTXT0000088, [ A[ 0 ]]); // 'PO Item %s Information';
    S1:= A[ 1 ];

    S2:= SelectValueFmtAsString(
      'select rtrim(info_po) from arinvt_vendors where arinvt_id = %f and ' +
      'vendor_id = %f and po_misc.Filter_Arinvt_Vendors(%f, id) = 1 ',
      [ANew_Arinvt_ID, AVendor_ID, AArinvt_Vendors_ID]);

    if (S1 = '') and (S2 = '') then
       EXIT
    else if (S1 > '') and (S2 = '') then
       S:= S1
    else if (S1 = '') and (S2 > '') then
       S:= S2
    else
       S:= S1 + #13#10#13#10 + S2;

    DoViewMemoStr(S, ACaption ); {IQMS.Common.EditMemoStr.pas}
  end;
end;


function IsPOWorkflowTemplateBased( ADatabaseName : string = cnstFDConnectionName):  Boolean;
begin
  Result:= SelectValueAsString('select use_po_workflow_template from iqsys') = 'Y';
end;

function IsDisp_po_id_as_requisition( ADB: string = cnstFDConnectionName ):boolean;
begin
  result := SelectValueAsFloat('select po_misc.Disp_po_id_as_requisition from dual') = 1;
end;

function get_po_requisition_title( APO_ID: Real; ADB: string = cnstFDConnectionName ): string;
var
  APoNo: string;

  function _IsApproved: Boolean;
  var
    S: string;
  begin
    S:= SelectValueByID('nvl(rtrim(approved_by), ''*'')', 'po', APO_ID);
    Result:= not StrInList( S, ['*', po_const.c_po_not_approved,
      po_const.c_po_denied]);
  end;

begin
  case po_share.IsDisp_po_id_as_requisition( ADB ) and not _IsApproved() of
    // po_rscstr.cTXT0000121 = 'Requisition # %.0f';
    TRUE : Result:= Format(po_rscstr.cTXT0000121, [ APO_ID ]);

    FALSE:
       begin
           APoNo:= SelectValueFmtAsString('select pono from po where id = %f', [ APO_ID ]);
           // po_rscstr.cTXT0000122 = 'PO # %s';
           Result:= Format(po_rscstr.cTXT0000122, [ APONo ]);
       end;
  end;
end;

procedure CheckExecuteAutoEFormPOQueue;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add('  SELECT id, source_id');
    SQL.Add('    FROM print_queue');
    SQL.Add('   WHERE source = ''PO'' AND');
    SQL.Add('         user_name = misc.getusername AND');
    if SecurityManager.EPlant_ID_AsFloat > 0 then
      SQL.Add(Format('         eplant_id = %.0f',
      [SecurityManager.EPlant_ID_AsFloat]))
    else
      SQL.Add('         eplant_id IS NULL');
    SQL.Add('ORDER BY 1');
    Open;
    while not Eof do
      begin
        // Remove the record first
        ExecuteCommandFmt(
          'DELETE FROM print_queue WHERE id = %d',
          [Fields[0].AsLargeInt]);
        // Process the ID value
        if SelectValueFmtAsFloat('SELECT 1 FROM po WHERE id = %d',
          [Fields[1].AsLargeInt]) = 1 then
          CheckExecuteAutoEFormPO(Fields[1].AsLargeInt);
        // Next record
        Next;
      end;
  finally
    Free;
  end;
end;

procedure CheckExecuteAutoEFormPO( APO_ID: Real );
var
  A: Variant;
  APONo        : string;
  ASelectionList: TStringList;
  AReportName  : string;
  AVendor_ID   : Real;
  AShip_To_ID  : Real;
  AVendorNo    : string;
  ABody        : string;
  hMsg: TPanelMesg;
begin
  if SelectValueFmtAsFloat( 'select 1 from po, vendor_contact c where po.id = %f and po.vendor_id = c.vendor_id and c.auto_eform_po = ''Y'' and rownum < 2', [ APO_ID ]) = 0 then
     EXIT;

  if SelectValueFmtAsFloat( 'select 1 from po_detail where po_id = %f and rownum < 2', [ APO_ID ]) = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select po.pono, po.vendor_id, po.ship_to_id from po where po.id = %f', [ APO_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  APONo      := A[ 0 ];
  AVendor_ID := A[ 1 ];
  AShip_To_ID:= A[ 2 ];
  AVendorNo  := SelectValueByID('vendorno', 'vendor', AVendor_ID);

  ASelectionList:= TStringList.Create;
  try
    // report name
    AReportName:= TFrmPrintDocsCustom.GetReportNameEx( 'PO_REPORT', [ 'vendor', AVendor_ID ]);  // prn_doc.pas
    if Empty( AReportName ) then
       EXIT;

    // selection criteria
    ASelectionList.Add( IQFormat('{V_PO.ID} = %f', [ APO_ID ]));

    // construct body
    ABody:= Format('PO# %s', [ APoNo ]);

    // po_rscstr.cTXT0000053 = 'Processing.  Please wait.'
    hMsg := hPleaseWait(po_rscstr.cTXT0000053);
    try
      // po_rscstr.cTXT0000123 = 'PO # %s %s';
      TAutoEFormVendor.CreateEx( 'PO',                                        {IQMS.Common.PrintDialogsShare.pas}
                                  AVendor_ID,
                                  AShip_To_ID,
                                  AReportName,
                                  ASelectionList,
                                  Format(po_rscstr.cTXT0000123, [APoNo, AVendorNo]),
                                  ABody,
                                  'PO',
                                  APO_ID,
                                  nil,             // AExternalDocsList  (for now nil)
                                  '' ).Execute;    // AUserFormattedFileName
     finally
       FreeAndNil(hMsg);
     end;

  finally
    ASelectionList.Free;
  end;
end;


function GetPoDetailLeftToReceivePosted( APO_Detail_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select sum(greatest(0, quan - nvl(recv_quan,0))) '+
                     '  from c_po_releases                             '+
                     ' where po_detail_id = %f                         ',
                     [ APO_Detail_ID ]);
end;


function GetClosePOWithin( APO_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select po_misc.close_po_within( %f ) from dual', [ APO_ID ]);
end;

function POStatusApproved(const AStatus: string): Boolean;
begin
  Result := (Trim(AStatus) > '') and
    not POStatusNotApproved(AStatus) and
    not POStatusDenied(AStatus);
end;

function POStatusNotApproved(const AStatus: string): Boolean;
begin
  Result := CompareText(Trim(AStatus), po_const.c_po_not_approved) = 0;
end;

function POStatusDenied(const AStatus: string): Boolean;
begin
  Result := CompareText(Trim(AStatus), po_const.c_po_denied) = 0;
end;

procedure CheckArinvtStdCostAssigned(AArinvtID: Real);
var
  AConfirm:integer;
begin
  if  (SelectValueAsString('select NVL(STD_COST_POSTING, ''N'') from iqsys where rownum < 2') = 'Y')
  and (SelectValueFmtAsFloat('select count(arinvt_id) from arinvt_elements where arinvt_id = %.0f', [AArinvtID]) = 0)
  and (SelectValueFmtAsString('select NVL(non_material, ''N'') from arinvt where id = %.0f', [AArinvtID]) = 'N')
  // po_rscstr.cTXT0000086 =
  // 'Standard Cost is not assigned. Do you wish to Continue?';
  and not IQMS.Common.Dialogs.IQConfirmYNWithSecurity(po_rscstr.cTXT0000086,
    'PO_CheckStdCost', False) then
    // po_rscstr.cTXT0000060 = 'Standard Cost is not assigned.';
    raise Exception.Create(po_rscstr.cTXT0000060);
end;

procedure CheckArinvtUnitPriceAgainstStdPrice(const AArinvtID: Int64;
  const APODetailUnitPrice: Real);
var
  AItemInfo: string;
  AStdPrice: Real;
begin
  if AArinvtID > 0 then
    begin
      AStdPrice := SelectValueFmtAsFloat(
        'select std_price from arinvt where id = %d',
        [AArinvtID]);

      // 06/16/2011 Display prompt only if for an inventory item, not MISC item.
      if IQMS.Common.Numbers.GreaterThan(APODetailUnitPrice - AStdPrice, 0) then
        begin
          AItemInfo :=
            IQMS.Common.StringUtils.FixStr(
            SelectValueFmtAsString(
           'SELECT TRIM(itemno) || '' - '' || TRIM(descrip) FROM arinvt ' +
           'WHERE id = %d', [AArinvtID]));
          // TFrmPOConfStdPrice is declared in POCheckStdPrice.pas
          // po_rscstr.cTXT0000063 =
          // 'Unit Price is greater than Standard Item Price. Continue?';
          { TODO : POCheckStdPrice has no web conversion tag }
         { if IQMS.Common.Dialogs.IQDialogChkEx( TFrmPOConfStdPrice,
            po_rscstr.cTXT0000063 + #13#13 + AItemInfo,
            'PO_ConfirmStdPrice' ) <> 1 then
            // po_rscstrcTXT0000064 =
            // 'Unit Price is greater than Standard Item Price.';
            raise Exception.Create(po_rscstr.cTXT0000064 + #13#13 + AItemInfo); }
        end;
    end;
end;

function GLAccountRequiresCostSource(const AGLAcctID: Int64): Boolean;
begin
  Result :=
    (AGLAcctID > 0) and
    (SelectValueFmtAsString(
    'SELECT NVL(cost_source_rqd, ''N'') FROM glacct WHERE id = %d',
    [AGLAcctID]) = 'Y');
end;

end.
