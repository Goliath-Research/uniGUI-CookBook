unit AutoMrp;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
{ TODO -oGPatil -cWebconvert : Dependency
  IQMS.Common.UserMessages, }
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame, uniImage;

const
  AUTO_MRP_BY_DIVISION = 'Auto-MRP By Division';
  AUTO_MRP_BY_DEFAULT  = 'Default Auto-MRP';

type
  TFrmAutoMrp = class(TUniForm)
    procAssignSalesOrd: TFDStoredProc;
    QryOrders: TFDQuery;
    SrcOrders: TDataSource;
    IQJumpOrd: TIQWebJump;
    PopupMenu1: TUniPopupMenu;
    JumptoOrder1: TUniMenuItem;
    popmTrace: TUniPopupMenu;
    Trace1: TUniMenuItem;
    Panel2: TUniPanel;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    Panel3: TUniPanel;
    pnlByDivision: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    sbtnCreateOrder_DefaultAutoMrp: TUniSpeedButton;
    sbtnCreateOrder_DivisionAutoMrp: TUniSpeedButton;
    SrcArinvt_AutoMrp: TDataSource;
    TblArinvt_AutoMrp: TFDTable;
    TblArinvt_AutoMrpID: TBCDField;
    TblArinvt_AutoMrpARINVT_ID: TBCDField;
    TblArinvt_AutoMrpDIVISION_ID: TBCDField;
    TblArinvt_AutoMrpAUTO_MRP_REORD_POINT: TBCDField;
    TblArinvt_AutoMrpAUTO_MRP_ORDER_QTY: TBCDField;
    TblArinvt_AutoMrpAUTO_MRP_LEAD_DAYS: TBCDField;
    TblArinvt_AutoMrpAUTO_MRP_FIRM_WO: TStringField;
    TblArinvt_AutoMrpAUTO_MRP_INCLUDE_VMI: TStringField;
    TblArinvt_AutoMrpPROCESS_SAFETY_STOCK: TStringField;
    TblArinvt_AutoMrpDivisionName: TStringField;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    wwQueryDivision: TFDQuery;
    wwQueryDivisionID: TBCDField;
    wwQueryDivisionNAME: TStringField;
    wwQueryDivisionDESCRIP: TStringField;
    wwQueryDivisionEPLANT_ID: TBCDField;
    TblArinvt_AutoMrpOrderNo: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PopupMenu2: TUniPopupMenu;
    JumptoOrder2: TUniMenuItem;
    Contents1: TUniMenuItem;
    SP: TIQWebSecurityRegister;
    Panel5: TUniPanel;
    Label6: TUniLabel;
    Panel4: TUniPanel;
    PnlLeft02: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Panel8: TUniPanel;
    Splitter2: TUniSplitter;
    Label5: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dbeOrder: TUniDBEdit;
    dbeREORD_POINT: TUniDBEdit;
    dbeORDER_QTY: TUniDBEdit;
    Panel10: TUniPanel;
    Label4: TUniLabel;
    Bevel1: TUniPanel;
    PnlItemNumber: TUniPanel;
    lblItemNumber: TUniLabel;
    dbeItem: TUniDBEdit;
    Panel9: TUniPanel;
    pnlRightClient: TUniPanel;
    pnlRight1: TUniPanel;
    Splitter3: TUniSplitter;
    pnlRight2: TUniPanel;
    Label35: TUniLabel;
    dbeMultiples: TUniDBEdit;
    Label7: TUniLabel;
    dbeKANBAN_LOT_SIZE: TUniDBEdit;
    TblArinvt_AutoMrpAUTO_MRP_KANBAN_LOT_SIZE: TFMTBCDField;
    pnlRightBottom: TUniPanel;
    chkFirmWO: TUniDBCheckBox;
    dbchkIncludeVMI: TUniDBCheckBox;
    Splitter4: TUniSplitter;
    Label3: TUniLabel;
    dbeLEAD_DAYS: TUniDBEdit;
    TblArinvt_AutoMrpOrd_Detail_ID: TFloatField;
    TblArinvt_AutoMrpAUTO_MRP_EXCLUDE_HARD_ALLOC: TStringField;
    dbchkIncludeVMIMfgCalc: TUniDBCheckBox;
    TblArinvt_AutoMrpAUTO_MRP_INCLUDE_VMI_MFG_CALC: TStringField;
    Splitter5: TUniSplitter;
    Panel6: TUniPanel;
    dbchkExcludeHardAlloc: TUniDBCheckBox;
    dbchkSchedAlloc: TUniDBCheckBox;
    FlowPanel1: TUniPanel;
    dbchkbSafetyStock: TUniDBCheckBox;
    imgSafetyStockWarning: TUniImage;
    sbtnClearDefaultAutoMRP: TUniSpeedButton;
    sbtnClearAllAutoMRPDiv: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCreateOrdClick(Sender: TObject);
    procedure JumptoOrder1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Trace1Click(Sender: TObject);
    procedure TblArinvt_AutoMrpBeforePost(DataSet: TDataSet);
    procedure TblArinvt_AutoMrpCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnCreateOrder_DivisionAutoMrpClick(Sender: TObject);
    procedure TblArinvt_AutoMrpAfterPost(DataSet: TDataSet);
    procedure JumptoOrder2Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure sbtnClearDefaultAutoMRPClick(Sender: TObject);
    procedure sbtnClearAllAutoMRPDivClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FAfterPostOld : TDataSetNotifyEvent;
    FBeforePostOld : TDataSetNotifyEvent;
    procedure LocalAfterPost( DataSet: TDataSet );
    procedure LocalBeforePost( DataSet: TDataSet );
    procedure AssignDataSource( ADataSource: TDataSource );
    function GetArinvt_ID: Real;
    procedure IQNotify( var Msg: TMessage ); {essage iq_Notify;}
    procedure CheckKanbanLotSizeAgainstMultiplesOf(AKanbanLotSize: Real);
    procedure SetDataSource(const Value: TDataSource);
  public
    { Public declarations }
    class function CheckForJustOneMethodMessage(aIsAlreadySetTo: string): string;
    property DataSource: TDataSource write SetDataSource;
    property Arinvt_ID: Real read GetArinvt_ID;
  end;

function DoShowAutoMRP(ADataSource: TDataSource ):TFrmAutoMrp;

implementation

{$R *.DFM}

uses
{ TODO -oGPatil -cWebConvert : Dependency
  bas_invt, }
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebconvert : Dependency
  iqsecins, }
  IQMS.Common.SysShare,
  System.Variants,
  IQMS.Common.TRBase;

function DoShowAutoMRP(ADataSource: TDataSource ):TFrmAutoMrp;
var
  LFrmAutoMrp : TFrmAutoMrp;
begin
  LFrmAutoMrp := TFrmAutoMrp.Create(UniGUIApplication.UniApplication);
  LFrmAutoMrp.DataSource := ADataSource;
  LFrmAutoMrp.Show;
end;

procedure TFrmAutoMrp.AssignDataSource( ADataSource: TDataSource );
begin
 NavMain.DataSource               := ADataSource;
 QryOrders.DataSource             := ADataSource;
 dbeREORD_POINT.DataSource        := ADataSource;
 dbeORDER_QTY.DataSource          := ADataSource;
 dbeLEAD_DAYS.DataSource          := ADataSource;
 dbeItem.DataSource               := ADataSource;
 dbchkbSafetyStock.DataSource     := ADataSource;
 dbchkIncludeVMI.DataSource       := ADataSource;
 chkFirmWO.DataSource             := ADataSource;
 dbeMultiples.DataSource          := ADataSource;
 dbeKANBAN_LOT_SIZE.DataSource    := ADataSource;
 dbchkExcludeHardAlloc.DataSource := ADataSource;
 dbchkIncludeVMIMfgCalc.DataSource:= ADataSource;
 dbchkSchedAlloc.DataSource       := ADataSource;

 TblArinvt_AutoMrp.MasterSource   := ADataSource;
 Reopen( TblArinvt_AutoMrp );

 dbeOrder.Cursor:= crJump;

(* TODO -oGPatil -cWebconvert : Dependency
 {Set Process_Safety_Stock enabled/disabled based on mfg_safety_qty > 0}
 PostMessage( self.Handle, iq_Notify, 0, 0);    {IQMS.Common.UserMessages.pas} *)
end;

procedure TFrmAutoMrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FDataSource) and Assigned( FDataSource.DataSet ) and (FDataSource.DataSet.State in [ dsEdit, dsInsert ]) then
     FDataSource.DataSet.Cancel;

  FDataSource.DataSet.AfterPost := FAfterPostOld;
  FDataSource.DataSet.BeforePost:= FBeforePostOld;

  IQRegFormWrite( self, [ self, wwDBGrid1, PnlLeft01, PnlLeft02 ]);
{ TODO -oGPatil -cWebConvert : Undeclared identifier: 'TBas_Inv'
  if Owner is TBas_Inv then
    (Owner as TBas_Inv).FAutoMrp:= NIL;   }
end;

procedure TFrmAutoMrp.btnCreateOrdClick(Sender: TObject);
begin
  if Arinvt_ID > 0 then // Assigned(FDataSource) and Assigned( FDataSource.DataSet.FindField('ID')) then
  try
    FDataSource.DataSet.CheckBrowseMode;
    Screen.Cursor:= crSQLWait;
    with procAssignSalesOrd do
    begin
      ParamByName('v_arinvt_id').Value := Arinvt_ID; //  FDataSource.DataSet.FindField('ID').asFloat;
      ExecProc;
    end;
  finally
    Reopen( QryOrders );
    Screen.Cursor:= crDefault;
  end;
end;

procedure TFrmAutoMrp.JumptoOrder1Click(Sender: TObject);
begin
  IQJumpOrd.Execute;
end;

procedure TFrmAutoMrp.LocalAfterPost( DataSet: TDataSet );
begin
  if Assigned(FAfterPostOld) then
     FAfterPostOld( DataSet );
  btnCreateOrdClick( NIL );
end;

procedure TFrmAutoMrp.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAutoMrp.Trace1Click(Sender: TObject);
begin
  DoShowTrace('ARINVT', FDataSource.DataSet.FieldByName('ID').asFloat ); {IQMS.Common.TRBase.pas}
end;

procedure TFrmAutoMrp.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmAutoMrp'
  CenterForm(Self); // default position  }
  IQRegFormRead( self, [ self, wwDBGrid1, PnlLeft01, PnlLeft02 ]);
  FormStyle:= fsNormal;

(* TODO -oGPatil -cWebconvert : Undeclared Identifier Selected
  {division vs warehouse}
  with wwDBGrid1, Selected do
  begin
    CheckReplaceDivisionOfWWSelected( Selected );
    ApplySelected;
  end;
  with pnlByDivision do Caption:= CheckReplaceDivisionCaption( Caption );
  with wwDBLookupComboDivision do CheckReplaceDivisionOfWWSelected( Selected );
*)
  IQSetTablesActive( TRUE, self );

  // compensate for localization
  dbeItem.Left := lblItemNumber.Left + lblItemNumber.Width + 16;
  dbeItem.Width := PnlItemNumber.ClientWidth - (dbeItem.Left + 4);
end;

procedure TFrmAutoMrp.TblArinvt_AutoMrpBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );

  IQAssert(Trim(dbeORDER_QTY.Field.AsString) = '', CheckForJustOneMethodMessage(AUTO_MRP_BY_DEFAULT));
  IQAssert( TblArinvt_AutoMrpAUTO_MRP_REORD_POINT.asFloat > 0, inv_rscstr.cTXT0000024 {'Manufacturing Order Point must be greater than 0'} );
  IQAssert( TblArinvt_AutoMrpAUTO_MRP_ORDER_QTY.asFloat   > 0, inv_rscstr.cTXT0000025 {'Quantity to manufacture must be greater than 0'} );

  if  DataSet.FieldByName('AUTO_MRP_INCLUDE_VMI').asString <> 'Y' then
      DataSet.FieldByName('AUTO_MRP_INCLUDE_VMI_MFG_CALC').Clear;

  CheckKanbanLotSizeAgainstMultiplesOf( TblArinvt_AutoMrpAUTO_MRP_KANBAN_LOT_SIZE.asFloat );

  if (TblArinvt_AutoMrpAUTO_MRP_KANBAN_LOT_SIZE.asFloat <= 0)
      and
     (SelectValueByID('auto_mrp_kanban_lot_size', 'arinvt_auto_mrp_div', TblArinvt_AutoMrpID.asFloat ) > 0) then
    ExecuteCommandFmt('delete from releases where ord_detail_id = %f', [ TblArinvt_AutoMrpOrd_Detail_ID.asFloat ]);
end;

procedure TFrmAutoMrp.TblArinvt_AutoMrpCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if Arinvt_ID > 0 then //  Assigned(FDataSource) and Assigned( FDataSource.DataSet.FindField('ID')) then
  begin
    A:= SelectValueArrayFmt( 'select orderno, d.id         '+
                        '  from orders o,             '+
                        '       ord_detail d          '+
                        ' where o.type = ''AUTO-MRP'' '+
                        '   and o.division_id = %f    '+
                        '   and o.id = d.orders_id    '+
                        '   and d.arinvt_id = %f      '+
                        '   and rownum < 2            ',
                        [
                          TblArinvt_AutoMrpDIVISION_ID.asFloat,
                          Arinvt_ID ]);
    if VarArrayDimCount( A ) = 0 then
       EXIT;

    TblArinvt_AutoMrpOrderNo.asString     := A[ 0 ];
    TblArinvt_AutoMrpOrd_Detail_ID.asFloat:= A[ 1 ];
  end;
  if TblArinvt_AutoMrpDIVISION_ID.asFloat <> 0 then
    TblArinvt_AutoMrpDivisionName.asString := SelectValueFmtAsString('select name from division where id = %f', [TblArinvt_AutoMrpDIVISION_ID.asFloat]);
end;

procedure TFrmAutoMrp.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAutoMrp.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAutoMrp.sbtnClearAllAutoMRPDivClick(Sender: TObject);
begin
  if IQConfirmYN(format('OK to clear all Auto-MRP by Division settings for item # %s?', [trim(dbeItem.Text)])) then
  begin
    with TblArinvt_AutoMrp do
      while RecordCount > 0 do
        delete;
    RefreshDataSetByID(TblArinvt_AutoMrp, 'ID');
  end;
end;

procedure TFrmAutoMrp.sbtnClearDefaultAutoMRPClick(Sender: TObject);
var
  s: string;
begin
  if IQConfirmYN(format('OK to clear all Default Auto-MRP settings for item # %s?', [trim(dbeItem.Text)])) then
  begin
    with dbeREORD_POINT.DataSource, DataSet do
      begin
        ExecuteCommandFmt(
          'begin auto_mrp.clear_mrp_settings( %f ); end;',
          [ DataSet.FieldByName('ID').AsFloat ]);

        RefreshDataSetByID(DataSet, 'ID');
      end;
    (*
    with dbeREORD_POINT.DataSource, DataSet do
    begin
      Edit;
      FieldByName(dbeREORD_POINT.DataField).Value := NULL;
      FieldByName(dbeORDER_QTY.DataField).Value := NULL;
      FieldByName(dbeLEAD_DAYS.DataField).Value := NULL;
      FieldByName(dbeMultiples.DataField).Value := NULL;
      FieldByName(dbeKANBAN_LOT_SIZE.DataField).Value := NULL;
      FieldByName(chkFirmWO.DataField).Value := NULL;
      FieldByName(dbchkbSafetyStock.DataField).Value := NULL;
      FieldByName(dbchkIncludeVMI.DataField).Value := NULL;
      FieldByName(dbchkIncludeVMIMfgCalc.DataField).Value := NULL;
      FieldByName(dbchkExcludeHardAlloc.DataField).Value := NULL;
      FieldByName(dbchkSchedAlloc.DataField).Value := NULL;
      Post;
      RefreshDataSetByID(DataSet, 'ID');
    end;
    *)
  end;
end;

procedure TFrmAutoMrp.sbtnCreateOrder_DivisionAutoMrpClick(Sender: TObject);
begin
  TblArinvt_AutoMrp.CheckBrowseMode;
  IQAssert( TblArinvt_AutoMrpDIVISION_ID.asFloat > 0, inv_rscstr.cTXT0000026 {'Please select a Division.'}); {s/n happen}

  if Assigned(FDataSource) then
  begin
     ExecuteCommandFmt('begin                                       '+
               '  auto_mrp.assign_sales_order( %f,          '+  //  v_arinvt_id   number,
               '                               ''MANUAL'',  '+  // varchar2 default 'MANUAL',
               '                               %f );        '+  // v_division_id number default NULL );
               'end;                                        ',
               [ TblArinvt_AutoMrpARINVT_ID.asFloat,
                 TblArinvt_AutoMrpDIVISION_ID.asFloat ]);

     TblArinvt_AutoMrp.Refresh;
  end;
end;

procedure TFrmAutoMrp.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
  AssignDataSource( Value );
  FAfterPostOld:= FDataSource.DataSet.AfterPost;
  FDataSource.DataSet.AfterPost:= LocalAfterPost;

  FBeforePostOld:= FDataSource.DataSet.BeforePost;
  FDataSource.DataSet.BeforePost:= LocalBeforePost;
end;

procedure TFrmAutoMrp.TblArinvt_AutoMrpAfterPost(DataSet: TDataSet);
begin
  sbtnCreateOrder_DivisionAutoMrp.Click;
end;

procedure TFrmAutoMrp.JumptoOrder2Click(Sender: TObject);
var
  AOrders_ID: Integer;
begin
  AOrders_ID:= Trunc(SelectValueFmtAsFloat('select id from orders where orderno = ''%s''', [ TblArinvt_AutoMrpOrderNo.asString ]));
{ TODO -oGPatil -cWebconvert : Undeclared Identifier Selected
  JumpDirect( iq_JumpToSalesOrder, AOrders_ID );  }
end;

function TFrmAutoMrp.GetArinvt_ID: Real;
begin
 if Assigned(FDataSource) and Assigned( FDataSource.DataSet.FindField('ID')) then
    Result:= FDataSource.DataSet.FindField('ID').asFloat
 else
    Result:= 0;
end;

procedure TFrmAutoMrp.IQNotify(var Msg: TMessage);
begin
  {this method was written so Inv_DM arinvt before post could call it to update the safet stock check box}
  if Assigned(FDataSource) and Assigned( FDataSource.DataSet ) and (FDataSource.DataSet.State in [ dsEdit, dsInsert ]) then
     FDataSource.DataSet.Cancel;

  if TblArinvt_AutoMrp.State in [ dsEdit, dsInsert ] then
     TblArinvt_AutoMrp.Cancel;

  if Arinvt_ID = 0 then
     EXIT;

  dbchkbSafetyStock.Enabled:= SelectValueByID('mfg_safety_qty', 'arinvt', Arinvt_ID ) = 0;
  imgSafetyStockWarning.Visible:= not dbchkbSafetyStock.Enabled;
  TblArinvt_AutoMrpPROCESS_SAFETY_STOCK.ReadOnly:= not dbchkbSafetyStock.Enabled;
  // if not dbchkbSafetyStock.Enabled then
  // begin
  //   lblSafetyStock.Hint:= inv_rscstr.cTXT0000027; // 'Manufacturing Safety Stock is greater than 0. Auto-MRP Safety Stock is disabled.';
  //   TblArinvt_AutoMrpPROCESS_SAFETY_STOCK.ReadOnly:= TRUE;
  // end;
end;

procedure TFrmAutoMrp.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAutoMrp.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebconvert : Undeclared Identifier Selected
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmAutoMrp.LocalBeforePost(DataSet: TDataSet);
begin
  if Assigned(FBeforePostOld) then
     FBeforePostOld( DataSet );

  if  DataSet.FieldByName('AUTO_MRP_INCLUDE_VMI').asString <> 'Y' then
      DataSet.FieldByName('AUTO_MRP_INCLUDE_VMI_MFG_CALC').Clear;

  CheckKanbanLotSizeAgainstMultiplesOf( FDataSource.DataSet.FieldByName('AUTO_MRP_KANBAN_LOT_SIZE').asFloat );

  if (FDataSource.DataSet.FieldByName('auto_mrp_kanban_lot_size').asFloat <= 0)
      and
     (SelectValueByID('auto_mrp_kanban_lot_size', 'arinvt', Arinvt_ID ) > 0) then
    ExecuteCommandFmt('delete from releases where ord_detail_id = %f', [ QryOrders.FieldByName('ord_detail_id').asFloat ]);
end;

class function TFrmAutoMrp.CheckForJustOneMethodMessage(
  aIsAlreadySetTo: string): string;
var
  s: string;
begin
  if aIsAlreadySetTo = AUTO_MRP_BY_DIVISION then
    s := AUTO_MRP_BY_DEFAULT
  else
    s := AUTO_MRP_BY_DIVISION;
  result := format('Auto-MRP has already been set up using the %s method.  In order to set up using %s, ' +
    'data must be removed from %s first as these modes are mutually exclusive.',
      [aIsAlreadySetTo, s, aIsAlreadySetTo]);
end;

procedure TFrmAutoMrp.CheckKanbanLotSizeAgainstMultiplesOf( AKanbanLotSize: Real );
var
  AMultipleOf: Real;
begin
  AMultipleOf:= FDataSource.DataSet.FieldByName('MULTIPLE').asFloat;
  if (AKanbanLotSize > 0) and (AMultipleOf > 0) and ( Trunc((AKanbanLotSize / AMultipleOf)) * AMultipleOf - AKanbanLotSize <> 0 ) then
     raise Exception.Create( inv_rscstr.cTXT0000131 {'''Kanban Lot Size'' is not a multiple of ''Multiples Of''.'});
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmAutoMrp.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;   }

end.
