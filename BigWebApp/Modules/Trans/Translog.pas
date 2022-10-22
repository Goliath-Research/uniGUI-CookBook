unit TransLog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmTransLog = class(TUniForm)
    DBGridTransLog: TIQUniGridControl;
    Panel3: TUniPanel;
    NavTransLog: TUniDBNavigator;
    QryTransLog: TFDQuery;
    SrcTransLog: TDataSource;
    QryTransLogTRANS_DATE: TDateTimeField;
    QryTransLogTRANS_IN_OUT: TStringField;
    QryTransLogTRANS_QUAN: TFMTBCDField;
    QryTransLogRG_QUAN: TFMTBCDField;
    QryTransLogTRANS_TYPE: TStringField;
    QryTransLogLOC_DESC: TStringField;
    QryTransLogLOTNO: TStringField;
    QryTransLogACT_COST: TFMTBCDField;
    QryTransLogTRANS_REASON: TStringField;
    QryTransLogBEGIN_QUAN: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN: TFMTBCDField;
    QryTransLogSTD_COST: TFMTBCDField;
    QryTransLogFG_LOTNO: TStringField;
    Query1: TFDQuery;
    Query1ARINVT_ID: TBCDField;
    Query1ITEMNO: TStringField;
    QryTransLogBATCH: TBCDField;
    QryTransLogPARENT_ARINVT_ID: TBCDField;
    QryTransLogARINVT_ID: TBCDField;
    QryTransLogUSERID: TStringField;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    pmenuColTitle: TUniPopupMenu;
    DefineColumnTitle1: TUniMenuItem;
    QryTransLogFGMULTI_CUSER1: TStringField;
    QryTransLogFGMULTI_CUSER2: TStringField;
    QryTransLogFGMULTI_CUSER3: TStringField;
    SR: TIQWebSecurityRegister;
    QryTransLogRECEIPTNO: TStringField;
    QryTransLogDIVISION_NAME: TStringField;
    QryTransLogTRANS_CODE: TStringField;
    QryTransLogTRANS_DESCRIP: TStringField;
    QryTransLogLOCATION_DESCRIP: TStringField;
    QryTransLogEXCLUDE_RPT: TStringField;
    popmTranslog: TUniPopupMenu;
    ExcludeFromReport1: TUniMenuItem;
    QryTransLogWORKORDER_ID: TBCDField;
    StatusBar1: TUniStatusBar;
    QryTransLogParent_ItemNo: TStringField;
    QryTransLogSOURCE: TStringField;
    QryTransLogSOURCE_ID: TBCDField;
    N1: TUniMenuItem;
    JumptoPO1: TUniMenuItem;
    JumptoPackSlip1: TUniMenuItem;
    JumptoRMA1: TUniMenuItem;
    ParentItem1: TUniMenuItem;
    QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField;
    ConsumedVMISN1: TUniMenuItem;
    QryTransLogEPLANT_ID: TBCDField;
    QryTransLogPOSTED: TStringField;
    QryTransLogSYSTEM_DATE: TDateTimeField;
    IQAbout1: TIQWebAbout;
    N2: TUniMenuItem;
    About1: TUniMenuItem;
    EditItemLot1: TUniMenuItem;
    sbtnSearch: TUniSpeedButton;
    BevelToolBar: TUniPanel;
    lblFilterTransType: TUniLabel;
    BevelSpacerToolBar: TUniPanel;
    sbtnApplyTransType: TUniSpeedButton;
    PkTranslog: TIQWebHPick;
    edTransTypeFilter: TUniEdit;
    JumptoVendorRMA1: TUniMenuItem;
    ShowSerialNumbers1: TUniMenuItem;
    QryTransLogCLASS: TStringField;
    QryTransLogITEMNO: TStringField;
    QryTransLogREV: TStringField;
    QryTransLogDESCRIP: TStringField;
    QryTransLogDESCRIP2: TStringField;
    QryTransLogCOST_ELEMENT: TStringField;
    QryTransLogMFGNO: TStringField;
    CountryOfOrigin1: TUniMenuItem;
    JumpToProductionReporting1: TUniMenuItem;
    QryTransLogDAY_PART_ID: TBCDField;
    QryTransLogRECEIPT_COMMENT: TStringField;
    QryTransLogFGMULTI_ID: TBCDField;
    QryTransLogEND_QUAN: TFMTBCDField;
    QryTransLogEND_RG_QUAN: TFMTBCDField;
    QryTransLogID: TBCDField;
    QryTransLogPO_RECEIPTS_UNIT_PRICE: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridTransLogDblClick(Sender: TObject);
    procedure DefineColumnTitle1Click(Sender: TObject);
    procedure DBGridTransLogMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ExcludeFromReport1Click(Sender: TObject);
    procedure popmTranslogPopup(Sender: TObject);
    procedure QryTransLogCalcFields(DataSet: TDataSet);
    procedure JumptoPO1Click(Sender: TObject);
    procedure ParentItem1Click(Sender: TObject);
    procedure ConsumedVMISN1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure EditItemLot1Click(Sender: TObject);
    procedure sbtnApplyTransTypeClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShowSerialNumbers1Click(Sender: TObject);
    procedure CountryOfOrigin1Click(Sender: TObject);
    procedure JumpToProductionReporting1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CopyQueryToPickList( AQuery: TFDQuery; APkList: TIQWebHPick; ADBGrid: TUniDBGrid );
    procedure AssignTransTypeFilter;
    procedure DisplayTransTypeFilter;
  protected
    Arinvt_ID:Real;
    FFilterTransTypeList: TStringList;
    FFrom, FTo:TDateTime;
    procedure OpenTransLog; virtual;
  public
    { Public declarations }
    constructor Create(  nID:Real );
  end;

procedure DoTransactionLog( nArinvtId:Real);
procedure DoTransactionLogWorkOrder(  nArinvtId, AWorkorder_ID:Real);
procedure DoTransactionLogLocation(  nArinvtId, nFgmultiId:Real);
procedure DoTransactionLogMRBItem(  AArinvt_ID, AWF_Deviation_Item_ID: Real);

var
  FrmTransLog: TFrmTransLog;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.InfoBox,
  IQMS.WebVcl.Jump,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.Common.StringUtils,
  IQMS.Common.JumpConstants,
  IQMS.Common.PanelMsg,
  IQMS.Common.SysShare,
  trans_rscstr,
  translog_master_label,
  TransTypeDialog,
  TrLogAll,
  TrLogItm,
  TrLogKid,
  VMI_Consume_SN_Hist;

{$R *.DFM}

procedure DoTransactionLog( nArInvtId:Real);
var
  Ref:TFrmTransLog;
begin
  if nArInvtId > 0 then
     Ref:= TFrmTransLogSingle.Create( nArinvtID )       {TrLogItm}
  else
     Ref:= TFrmTransLogItems.Create( nArinvtID );     {TrLogAll}
  with Ref do
  begin
//  try
    // 07/29/2014 Do not show form modally, by customer request.
    // EIQ-3758 SER# 05802 - Allow other System.Actions in the system while Translog is Open
    Show;
//  finally
//    Free;
  end;
end;

procedure DoTransactionLogLocation(  nArinvtId, nFgmultiId:Real);
begin
  with TFrmTransLogSingle.Create(nArinvtID ) do
//  try
  begin
    QryTransLog.Filter  := 'FGMULTI_ID <> NULL and  FGMULTI_ID = ' + FloatToStr( nFgmultiId );
    QryTransLog.Filtered:= TRUE;
    // 07/29/2014 Do not show form modally, by customer request.
    // EIQ-3758 SER# 05802 - Allow other System.Actions in the system while Translog is Open
    Show;
//  finally
//    Free;
  end;
end;

procedure DoTransactionLogWorkOrder(  nArinvtId, AWorkorder_ID:Real);
begin
  with TFrmTransLogSingle.Create( nArinvtID ) do
  begin
//  try
    QryTransLog.Filter  := 'WORKORDER_ID <> NULL and  WORKORDER_ID = ' + FloatToStr( AWorkorder_ID );
    QryTransLog.Filtered:= TRUE;
    // 07/29/2014 Do not show form modally, by customer request.
    // EIQ-3758 SER# 05802 - Allow other System.Actions in the system while Translog is Open
    Show;
//  finally
//    Free;
  end;
end;

procedure DoTransactionLogMRBItem(  AArinvt_ID, AWF_Deviation_Item_ID: Real);
begin
  with TFrmTransLogSingle.Create( AArinvt_ID ) do
  begin
//  try
    QryTransLog.Filter  := Format('SOURCE = ''WF_DEVIATION_ITEM'' and SOURCE_ID = %.0f', [ AWF_Deviation_Item_ID ]);
    QryTransLog.Filtered:= TRUE;
    // 07/29/2014 Do not show form modally, by customer request.
    // EIQ-3758 SER# 05802 - Allow other System.Actions in the system while Translog is Open
    Show;
//  finally
//    Free;
  end;
end;

{ TFrmTransLog }

constructor TFrmTransLog.Create( nID:Real );
var
  AClass:String;
  AColumn:TUniBaseDBGridColumn;
begin
  inherited Create( uniGUIApplication.UniApplication );
  FFilterTransTypeList:= TStringList.Create;
  FFrom := 0;
  FTo   := 0;
  AClass := SelectValueFmtAsString('select class from arinvt where id = %f', [nID]);

  AColumn := IQColumnByName( DBGridTransLog.DBGrid, 'RG_QUAN' ) ;
  if AColumn <> nil then
    AColumn.Visible := (AClass = 'PL');
  AColumn := IQColumnByName( DBGridTransLog.DBGrid, 'BEGIN_RG_QUAN' );
  if AColumn <> nil then
    AColumn.Visible := (AClass = 'PL');
  AColumn := IQColumnByName( DBGridTransLog.DBGrid, 'END_RG_QUAN' );
  if AColumn <> nil then
    AColumn.Visible := (AClass = 'PL');
  AColumn := IQColumnByName( DBGridTransLog.DBGrid, 'BEGIN_RG_QUAN_TOTAL' );
  if AColumn <> nil then
    AColumn.Visible := (AClass = 'PL');


//  IQColumnByName( DBGridTransLog, 'RG_QUAN' ).Visible := (AClass = 'PL');
//  IQColumnByName( DBGridTransLog, 'BEGIN_RG_QUAN' ).Visible := (AClass = 'PL');
//  IQColumnByName( DBGridTransLog, 'END_RG_QUAN' ).Visible := (AClass = 'PL');

  Arinvt_ID:= nID;
  OpenTransLog;

  SecureColumnByName( DBGridTransLog.DBGrid, 'ACT_COST', SR );
  SecureColumnByName( DBGridTransLog.DBGrid, 'STD_COST', SR );

  IQUserDefLabel1.UpdateUserLabelColumnTitleByName( DBGridTransLog.DBGrid, 'FGMULTI_CUSER1' );
  IQUserDefLabel2.UpdateUserLabelColumnTitleByName( DBGridTransLog.DBGrid, 'FGMULTI_CUSER2' );
  IQUserDefLabel3.UpdateUserLabelColumnTitleByName( DBGridTransLog.DBGrid, 'FGMULTI_CUSER3' );

  if Assigned(IQColumnByName( DBGridTransLog.DBGrid, 'division_name' )) then
     with IQColumnByName( DBGridTransLog.DBGrid, 'division_name' ).Title do Caption:= CheckReplaceDivisionCaption(Caption);   {sys_share}

  {Nay-04-06 restore grid settign after user defined columns are assigned}
  IQRegFormRead( self, [ DBGridTransLog ]);

//  IQMS.Common.Controls.AutoSizeNavBar(NavTransLog);
end;

procedure TFrmTransLog.OpenTransLog;
var
  h: TPanelMesg;
begin
  try
    h:= hPleaseWait('Accessing Database...');
    // Query1.Open;
    // Reopen(Query1);  <== why do we need this 10/28/2008

    h.Mesg:= 'Accessing Translog...';
    Reopen( QryTransLog );

    DisplayTransTypeFilter;
  finally
    h.Free;
  end;
end;

procedure TFrmTransLog.FormCreate(Sender: TObject);
begin
  // IQRegFormRead( self, [ self, DBGridTransLog ]);
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmTransLog.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
  with QryTransLog do
  if Filtered and (Filter <> '') then
  begin
    StatusBar1.Visible   := TRUE;
    StatusBar1.panels[0].Text:= Format('Filter: %s', [ Filter ]);
  end;
end;

procedure TFrmTransLog.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTransLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGridTransLog ]);
  // 02-05-2015 EIQ-3731 SER# 05798 - Propogate Sort/Scope in TransLog
  // Local filter assigned to QryTranslog in HPick was kicking in with KeyScopeField = '' on form close
  QryTransLog.Close;
  Action:= caFree;
end;

procedure TFrmTransLog.FormDestroy(Sender: TObject);
begin
  FFilterTransTypeList.Free;
end;

procedure TFrmTransLog.DBGridTransLogDblClick(Sender: TObject);
var
  ASub_Batch: Real;
begin
   ASub_Batch:= SelectValueByID('sub_batch', 'translog', QryTransLogID.asFloat );
   DoTransLogBatch(  QryTransLogArinvt_ID.asFloat, QryTransLogBatch.asFloat, ASub_Batch); {TrLogKid.pas}
end;

procedure TFrmTransLog.DefineColumnTitle1Click(Sender: TObject);
var
  ALabel: TIQWebUserDefLabel;
begin
//  with DBGridTransLog, Columns[ SelectedIndex ] do
//  begin
//    if FieldName = 'FGMULTI_CUSER1'      then  ALabel:= IQUserDefLabel1
//    else if FieldName = 'FGMULTI_CUSER2' then  ALabel:= IQUserDefLabel2
//    else if FieldName = 'FGMULTI_CUSER3' then  ALabel:= IQUserDefLabel3
//    else
//      ALabel:= NIL;
//
//    if Assigned(ALabel) then
//    begin
//      ALabel.Execute;
//      ALabel.UpdateUserLabelColumnTitle( Columns[ SelectedIndex ])
//    end;
//  end;
end;

procedure TFrmTransLog.DBGridTransLogMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if (Button = mbRight) then with DBGridTransLog do
     begin
//        SelectedIndex:= MouseCoord( X, Y ).X - 1;
//        if Pos( string(Columns[ SelectedIndex ].FieldName), 'FGMULTI_CUSER1__FGMULTI_CUSER2__FGMULTI_CUSER3') > 0 then
        begin
           P.X:= X;
           P.Y:= Y;
           P:= ClientToScreen( P );
           pmenuColTitle.Popup( P.X, P.Y );
        end;
     end

end;

procedure TFrmTransLog.ExcludeFromReport1Click(Sender: TObject);
begin
  ExcludeFromReport1.Checked:= not ExcludeFromReport1.Checked;
  ExecuteCommandFmt('update translog set exclude_rpt = ''%s'' where id = %f', [sIIf( ExcludeFromReport1.Checked, 'Y', 'N'), QryTransLogID.asFloat ]);
end;

procedure TFrmTransLog.popmTranslogPopup(Sender: TObject);
begin
  ExcludeFromReport1.Checked:= SelectValueFmtAsString('select exclude_rpt from translog where id = %f', [ QryTransLogID.asFloat ]) = 'Y';
  JumptoPO1.Enabled                  := QryTransLogSOURCE.asString = 'PO_DETAIL';
  JumptoPackSlip1.Enabled            := QryTransLogSOURCE.asString = 'SHIPMENT_DTL';
  JumptoRMA1.Enabled                 := QryTransLogSOURCE.asString = 'RMA_RECEIPTS';
  JumptoVendorRMA1.Enabled           := QryTransLogSOURCE.asString = 'VENDOR_RMA_DETAIL';
  JumpToProductionReporting1.Enabled := (QryTransLogTRANS_TYPE.asString = 'DISPOSITION') and (QryTransLogTRANS_IN_OUT.asString = 'IN');
  ParentItem1.Enabled     := QryTransLogPARENT_ARINVT_ID.AsFloat > 0;
  ConsumedVMISN1.Enabled  := QryTransLogTRANS_TYPE.asString = 'CONSUME VMI SHIPMENT';
  CountryOfOrigin1.Enabled:= Trim(QryTransLogLOTNO.asString) > '';
end;

procedure TFrmTransLog.QryTransLogCalcFields(DataSet: TDataSet);
var
  FK: Real;
begin
  FK:= QryTransLogPARENT_ARINVT_ID.asFloat;
  // if (Query1.State = dsBrowse) and (FK > 0) then
  if (FK > 0) then
     //begin
     //  if (FK = Query1ARINVT_ID.asFloat) or Query1.Locate('arinvt_id', FK, []) then
     //    QryTransLogParent_ItemNo.asString:= Query1ITEMNO.asString
     //  else
     //    QryTransLogParent_ItemNo.Clear;
     //  end
     QryTransLogParent_ItemNo.asString:= 'Right Click to see Parent Item #'
  else
     QryTransLogParent_ItemNo.Clear;
end;

procedure TFrmTransLog.JumptoPO1Click(Sender: TObject);
begin
  if TUniMenuItem(Sender) = JumptoPO1 then
    JumpDirect(iq_JumpToPO, QryTransLogSource_Id.asInteger)
  else if TUniMenuItem(Sender) = JumptoPackSlip1 then
    JumpDirect(iq_JumpToPackSlip, QryTransLogSource_Id.asInteger)
  else if TUniMenuItem(Sender) = JumptoRMA1 then
    JumpDirect(iq_JumpToRma, QryTransLogSource_Id.asInteger)
  else if TUniMenuItem(Sender) = JumptoVendorRMA1 then
    JumpDirect(iq_JumpToVendorRMADetail, QryTransLogSource_Id.asInteger);
end;

procedure TFrmTransLog.ParentItem1Click(Sender: TObject);
var
  A    : Variant;
  AList: TStringList;
  I    : Integer;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select t1.class        as "Class",      '+
                   '       t1.itemno       as "Item #",     '+
                   '       t1.descrip      as "Description",'+
                   '       t1.rev          as "Rev",        '+
                   '       t1.trans_date   as "Tran Date",  '+
                   '       t1.trans_in_out as "In/Out",     '+
                   '       t1.trans_quan   as "Qty",        '+
                   '       t1.trans_type   as "Tran Type"   '+
                   'from translog t1               '+
                   'where t1.arinvt_id = %f and t1.batch = %f', [ QryTransLogPARENT_ARINVT_ID.asFloat, QryTransLogBATCH.asFloat ]));
    Open;
    AList:= TStringList.Create;
    try
      for I:= 0 to FieldCount - 1 do
         AList.Add(Format('%s=%s', [ Fields[ I ].DisplayLabel, Fields[ I ].asString ]));
      DoShowInfoBox(  AList, 'Parent Item Info' );        { IQInfoBox }
    finally
      AList.Free;
    end;
  finally
    Free;
  end;
end;

procedure TFrmTransLog.ConsumedVMISN1Click(Sender: TObject);
begin
  TFrmConsumeVMI_SN_Hist.DoShow(  QryTransLogID.asFloat ); {VMI_Consume_SN_Hist.pas}
end;

procedure TFrmTransLog.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTransLog.EditItemLot1Click(Sender: TObject);
var
  S: string;
begin
  S:= QryTransLogLOTNO.asString;
  if InputQuery( 'Edit Lot #', 'Enter Lot #', S ) then
  begin
    ExecuteCommandFmt('update translog set lotno = ''%s'' where id = %f', [ FixStr(S), QryTransLogID.asFloat ]);
    RefreshDataSetByID( QryTransLog );
  end;
end;

procedure TFrmTransLog.sbtnApplyTransTypeClick(Sender: TObject);
begin
  if TFrmTransTypeDialog.DoShowModal(  FFilterTransTypeList, FFrom, FTo ) then  // TransTypeDialog.pas
  begin
    AssignTransTypeFilter;
    OpenTransLog;
  end;
end;

procedure TFrmTransLog.sbtnSearchClick(Sender: TObject);
begin
  CopyQueryToPickList( QryTransLog, PkTranslog, DBGridTransLog.DBGrid );
  with PkTranslog do
    if Execute then
       QryTranslog.Locate('ID', GetValue('ID'), [])
end;

procedure TFrmTransLog.CopyQueryToPickList( AQuery: TFDQuery; APkList: TIQWebHPick; ADBGrid: TUniDBGrid );
var
  I        : Integer;
  AFieldSrc: TField;
  AFieldTrg: TField;
  AColumn  : TUniBaseDBGridColumn;
begin
  for I:= APkList.FieldCount - 1 downto 0 do
    APkList.Fields[ I ].Free;

  // Prepare TFDQuery
  APkList.Close;
  APkList.Connection := UniMainModule.FDConnection1;
  APkList.SQL.Assign( AQuery.SQL );

  APkList.Filtered:= AQuery.Filtered;
  APkList.Filter  := AQuery.Filter;
  APkList.OnFilterRecord:= AQuery.OnFilterRecord;

  APkList.BeforeOpen := AQuery.BeforeOpen;
  APkList.AfterOpen := AQuery.AfterOpen;

  for I:= 0 to AQuery.ParamCount - 1 do
    APkList.Params[ I ].DataType:= AQuery.Params[ I ].DataType;

  // Create TFields
  APkList.FieldDefs.Update;
  for I:= 0 to APkList.FieldDefs.Count - 1 do
  begin
    if AQuery.FindField( APkList.FieldDefs.Items[ I ].Name ) <> NIL then
    begin
      AFieldSrc:= AQuery.FieldByName( APkList.FieldDefs.Items[ I ].Name );
      AFieldTrg:= APkList.FieldDefs[ I ].CreateField( APkList );

      AColumn:= IQColumnByName( ADBGrid, AFieldSrc.FieldName );
      AFieldTrg.Visible:= Assigned( AColumn ) and AColumn.Visible;

      if Assigned( AColumn ) then
         AFieldTrg.DisplayLabel:= AColumn.Title.Caption;
    end
  end;
end;

procedure TFrmTransLog.AssignTransTypeFilter;
var
  I: Integer;

  function FormatTransTypeStrings(): string;
  var
    I: Integer;
  begin
    Result:= '';
    for I:= 0 to FFilterTransTypeList.Count - 1 do
    begin
      if I = 0 then
         Result:= Format('''%s''', [ FFilterTransTypeList[ I ]])
      else
         Result:= Result + Format(', ''%s''', [ FFilterTransTypeList[ I ]])
    end;
  end;

  function GetIndexOfString( AStrings: TStrings; Value: string ): Integer;
  var
    I: Integer;
  begin
    for I:= 0 to AStrings.Count - 1 do
      if Trim( AStrings[ I ]) = Trim(Value) then
      begin
         Result:= I;
         EXIT;
      end;
    Result:= -1;
  end;

begin
  // Translog query
  with QryTransLog do
  begin
    Close;

    // clear first
    I:= GetIndexOfString( SQL, '/* START TRANS_TYPE FILTER */');
    IQAssert( I > -1, 'Unable to find START TRANS_TYPE FILTER');
    I:= I + 1;
    repeat
      if (Trim(SQL[ I ]) = '/* END TRANS_TYPE FILTER */' ) then BREAK;
      SQL.Delete(I);
    until (I > SQL.Count - 1);

    // assign filter
    if FFilterTransTypeList.Count = 0 then
       SQL.Insert( I, '1 = 1' ) // no filter
    else
       SQL.Insert( I, Format(' trans_type in (%s)', [ FormatTransTypeStrings()]));
    if (FFrom <> 0) and (FTo <> 0) then
      SQL.Insert( I + 1, Format('and trans_date between To_Date(''%s'', ''MM/DD/RRRR'') and To_Date(''%s'', ''MM/DD/RRRR'')',
               [ FormatDateTime('mm/dd/yyyy', FFrom), FormatDateTime('mm/dd/yyyy', FTo)]));
  end;
end;

procedure TFrmTransLog.DisplayTransTypeFilter;
begin
  case FFilterTransTypeList.Count of
     0: edTransTypeFilter.Text:= '<Filter not assigned>';
     1: edTransTypeFilter.Text:= FFilterTransTypeList[0];
  else
     edTransTypeFilter.Text:= Format('%d trans types selected', [ FFilterTransTypeList.Count ]);
  end;
  if (FFrom <> 0) and (FTo <> 0) then
    edTransTypeFilter.Text:= edTransTypeFilter.Text + Format(' between %s and %s', [ DateToStr(FFrom), DateToStr(FTo) ]);
end;

procedure TFrmTransLog.ShowSerialNumbers1Click(Sender: TObject);
begin
  translog_master_label.DoShow( SrcTransLog ); // translog_master_label.pas
end;

procedure TFrmTransLog.CountryOfOrigin1Click(Sender: TObject);
var
  S: string;
begin
  S:= SelectValueFmtAsString('select country from arinvt_lot_docs where arinvt_id = %f and rtrim(lotno) = ''%s''',
                   [ QryTransLogARINVT_ID.asFloat,
                     Trim(QryTransLogLOTNO.asString) ]);

  IQInformation(Format( trans_rscstr.cTXT0000043 {'Country of Origin: %s'}, [ S ]));
end;

procedure TFrmTransLog.JumpToProductionReporting1Click(Sender: TObject);
var
  ADayProd_ID: Integer;
  ADay_Part_ID: Real;
begin
  ADay_Part_ID:= QryTransLogDAY_PART_ID.asFloat;
  if ADay_Part_ID = 0 then
     EXIT;

  ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'day_part', ADay_Part_ID ));
  if ADayProd_ID = 0 then
     ADayProd_ID:= Trunc(SelectValueByID('dayprod_id', 'pday_part', ADay_Part_ID ));

  IQMS.WebVcl.Jump.JumpDirect( iq_JumpToProdDispo, ADayProd_ID );
end;

end.
