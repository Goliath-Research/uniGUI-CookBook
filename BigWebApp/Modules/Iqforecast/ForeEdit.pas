{Note: TFDUpdateSQL component updtForeSummary is edited manually. 2 Datasets depending on IsConsumeByMonthly are using updtForeSummary}
unit ForeEdit;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DBCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  Db,
  Wwdatsrc,
  StdCtrls,
  DBGrids,
  ComCtrls,
  Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Buttons,
  Mask,
  wwdbedit,
  Wwdotdot,
  IQMS.WebVcl.DropDownButton,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniEdit,
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
  uniLabel,
  uniPageControl,
  IQUniGrid, uniComboBox, uniDBComboBox, uniGUIFrame, uniButton, uniBitBtn,
  uniMenuButton;

type
  TFrmEditForecast = class(TUniForm)
    Panel2: TUniPanel;
    wwSrcFore_Cust: TDataSource;
    pnlCust: TUniPanel;
    wwgridCust: TIQUniGridControl;
    Splitter1: TUniSplitter;
    wwSrcForeWk: TDataSource;
    wwQryArcusto: TFDQuery;
    wwQryArcustoID: TBCDField;
    wwQryArcustoCUSTNO: TStringField;
    wwQryArcustoCOMPANY: TStringField;
    wwQryArcustoECODE: TStringField;
    Panel7: TUniPanel;
    PopupMenu1: TUniPopupMenu;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    CustomerPickList1: TUniMenuItem;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    wwQryTotShip: TFDQuery;
    wwQryTotShipQTY_SHIPPED: TFMTBCDField;
    wwQryTotOrd: TFDQuery;
    wwQryTotOrdORD_QUAN: TFMTBCDField;
    wwQryForeWk: TFDQuery;
    wwQryForeWkFORE_ITEM_ID: TFMTBCDField;
    wwQryForeWkFORE_CUST_ID: TFMTBCDField;
    wwQryForeWkFORE_DTL_ID: TFMTBCDField;
    wwQryForeWkWEEK: TFMTBCDField;
    wwQryForeWkYEAR: TFMTBCDField;
    wwQryForeWkQTY: TFMTBCDField;
    wwQryForeWkPRICE: TFMTBCDField;
    wwQryForeWkREQ_DATE: TDateTimeField;
    wwQryForeWkSHIPPED: TFMTBCDField;
    wwQryForeWkONORDER: TFMTBCDField;
    wwQryForeWkUNCONSUMED: TFMTBCDField;
    wwQryForeWkARCUSTO_ID: TFMTBCDField;
    updtForeSummary: TFDUpdateSQL;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    gridForeDtl: TIQUniGridControl;
    wwSrcFore_Dtl: TDataSource;
    wwQryFore_Dtl: TFDQuery;
    wwQryFore_DtlID: TBCDField;
    wwQryFore_DtlFORE_CUST_ID: TBCDField;
    wwQryFore_DtlQTY: TFMTBCDField;
    wwQryFore_DtlPRICE: TFMTBCDField;
    wwQryFore_DtlREQ_DATE: TDateTimeField;
    wwQryFore_DtlWEEK: TBCDField;
    updtFore_Dtl: TFDUpdateSQL;
    wwQryFore_DtlNOTE1: TStringField;
    wwQryFore_Cust: TFDQuery;
    wwQryFore_CustID: TBCDField;
    wwQryFore_CustFORE_ITEM_ID: TBCDField;
    wwQryFore_CustARCUSTO_ID: TBCDField;
    wwQryFore_CustDate1: TDateTimeField;
    wwQryFore_CustDate2: TDateTimeField;
    wwQryFore_Custarinvt_id: TFloatField;
    wwQryFore_CustCustNo: TStringField;
    wwQryFore_CustCompany: TStringField;
    updtFore_Cust: TFDUpdateSQL;
    wwQryFore_DtlSHIP_TO_ID: TBCDField;
    wwQryFore_Dtlship_to_attn: TStringField;
    wwDBLookupComboShipTo: TUniDBLookupComboBox;
    QryShip_To: TFDQuery;
    QryShip_ToID: TBCDField;
    QryShip_ToATTN: TStringField;
    QryShip_ToADDR1: TStringField;
    QryShip_ToCITY: TStringField;
    QryShip_ToSTATE: TStringField;
    QryShip_ToCOUNTRY: TStringField;
    QryShip_ToZIP: TStringField;
    wwQryFore_DtlIs_Ship_To_Belongs_Arcusto: TStringField;
    wwQryForeWkSHIP_TO_ID: TFMTBCDField;
    wwQryForeWkship_to_attn: TStringField;
    wwQryForeWkIs_Ship_To_Belongs_Arcusto: TStringField;
    wwSrcForeMonth: TDataSource;
    wwQryForeMonth: TFDQuery;
    wwQryForeMonthFORE_ITEM_ID: TFMTBCDField;
    wwQryForeMonthFORE_CUST_ID: TFMTBCDField;
    wwQryForeMonthFORE_DTL_ID: TFMTBCDField;
    wwQryForeMonthARCUSTO_ID: TFMTBCDField;
    wwQryForeMonthWEEK: TFMTBCDField;
    wwQryForeMonthYEAR: TFMTBCDField;
    wwQryForeMonthQTY: TFMTBCDField;
    wwQryForeMonthPRICE: TFMTBCDField;
    wwQryForeMonthREQ_DATE: TDateTimeField;
    wwQryForeMonthSHIPPED: TFMTBCDField;
    wwQryForeMonthONORDER: TFMTBCDField;
    wwQryForeMonthUNCONSUMED: TFMTBCDField;
    wwQryForeMonthSHIP_TO_ID: TFMTBCDField;
    wwQryForeMonthship_to_attn: TStringField;
    wwQryForeMonthIs_Ship_To_Belongs_Arcusto: TStringField;
    wwQryForeWkID: TFMTBCDField;
    wwQryForeMonthID: TFMTBCDField;
    wwQryFore_DtlYEAR: TBCDField;
    wwQryForeWkKIND: TStringField;
    wwQryForeMonthKIND: TStringField;
    wwQryFore_CustKind: TStringField;
    PopupMenu2: TUniPopupMenu;
    Trace1: TUniMenuItem;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    wwQryFore_DtlDIVISION_ID: TBCDField;
    wwQryFore_DtlDivisionName: TStringField;
    wwDBComboDlgDivision: TUniEdit;
    PkDivision: TIQWebHPick;
    PkDivisionID: TBCDField;
    PkDivisionNAME: TStringField;
    PkDivisionEPLANT_ID: TBCDField;
    pnlSummary: TUniPanel;
    pgctrlSummary: TUniPageControl;
    TabSumWeekly: TUniTabSheet;
    Label1: TUniLabel;
    Bevel1: TUniPanel;
    gridForeWk: TIQUniGridControl;
    wwDBLookupComboShipToWeekly: TUniDBLookupComboBox;
    TabSumMonthly: TUniTabSheet;
    lblForeConsMonthly: TUniLabel;
    Bevel2: TUniPanel;
    gridForeMonth: TIQUniGridControl;
    wwDBLookupComboShipToMonthly: TUniDBLookupComboBox;
    wwQryFore_CustFore_Head_ID: TFloatField;
    wwDBComboDlgNote: TUniEdit;
    wwQryFore_DtlParentItemNo: TStringField;
    wwQryFore_DtlPARENT_ID: TBCDField;
    DDApply: TIQWebDropDownButton;
    PopupMenu3: TUniPopupMenu;
    UpdatehighlitedQuantity1: TUniMenuItem;
    UpdateTheseQuantities1: TUniMenuItem;
    wwQryForeMonthDIVISION_ID: TBCDField;
    wwQryForeWkDIVISION_ID: TBCDField;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure TblFore_DtlNewRecord(DataSet: TDataSet);
    procedure RefreshParentForm(DataSet: TDataSet);
    procedure TblFore_DtlBeforeInsert(DataSet: TDataSet);
    procedure CustomerPickList1Click(Sender: TObject);
    procedure TblFore_DtlBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TblFore_DtlQTYChange(Sender: TField);
    procedure wwQryFore_CustAfterInsert(DataSet: TDataSet);
    procedure gridForeWkUpdateFooter(Sender: TObject);
    procedure gridForeWkCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure PostAndRefreshParentsForm(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure NavQtyBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure PageControl1Change(Sender: TObject);
    procedure wwQryForeWkAfterOpen(DataSet: TDataSet);
    procedure wwQryForeWkBeforeClose(DataSet: TDataSet);
    procedure wwQryFore_CustBeforeOpen(DataSet: TDataSet);
    procedure wwQryFore_CustCalcFields(DataSet: TDataSet);
    procedure wwgridCustCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwQryFore_CustNewRecord(DataSet: TDataSet);
    procedure wwQryFore_DtlBeforeDelete(DataSet: TDataSet);
    procedure wwDBLookupComboShipToDropDown(Sender: TObject);
    procedure wwQryFore_DtlCalcFields(DataSet: TDataSet);
    procedure wwQryForeWkUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure wwQryFore_DtlUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    {procedure wwDBLookupComboShipToCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);}
    procedure wwQryFore_DtlSHIP_TO_IDChange(Sender: TField);
    procedure wwQryFore_DtlAfterEdit(DataSet: TDataSet);
    procedure Trace1Click(Sender: TObject);
    procedure wwDBComboDlgDivisionCustomDlg(Sender: TObject);
    procedure wwDBComboDlgDivisionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgNoteCustomDlg(Sender: TObject);
    procedure DDApplyClick(Sender: TObject);
    procedure UpdateTheseQuantities1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFore_Item : Real;
    FInit_Arcusto_ID: Real;
    FArinvt_ID : Real;
    FDataSet   : TDataSet;
    FMaxDate   : TDateTime;
    FMinDate   : TDateTime;
    IsConsumeByMonthly: Boolean;
    FForecastType: string;
    FLastShip_To_ID: Real;
    FFore_Head_ID: Real;
    FStandard_ID: Real;
    FMonth: Integer;
    FYear: Integer;
    FColCaption: string;

    procedure AssignForeItemIDFromArinvtID( AArinvt_ID: Real );
    procedure AssignUnitPrice( ADataSet: TDataSet; AForceUpdate: Boolean = False );
    function GetArinvt_ID: Real;
    procedure GetTotalByFields( var A: Variant; AQuery: TFDQuery );
    procedure PostCachedUpdate(DataSet: TDataSet);
    procedure AssignDisplayBasedOnConsumeBy;
    procedure AssignParams(AColCaption: string);
    procedure CheckDateBoundaries(DataSet: TDataSet);
    procedure SetColCaption(const Value: string);
    procedure SetDataSet(const Value: TDataSet);
    procedure SetArcusto_ID(const Value: Real);
    procedure SetForecastType(const Value: string);
    procedure SetFore_Head_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real read GetArinvt_ID;
    class procedure AssignUnitPrice_Ex( AArinvt_ID, AArcusto_ID, AQty: Real; var APrice: Real; ASysDate: TDateTime = 0; AShip_To_ID: Real = 0 );
    class procedure InitDateTime( AColCaption : string; var AMinDate, AMaxDate: TDateTime );
    property ColCaption: string write SetColCaption;
    property DataSet:TDataSet write SetDataSet;
    property Arcusto_ID:Real write SetArcusto_ID;
    property ForecastType: string write SetForecastType;
    property Fore_Head_ID: Real write SetFore_Head_ID;
  end;

procedure DoEditForecast(const AColCaption: string; ADataSet:TDataSet; AArcusto_ID:Real; AForecastType: string; AFore_Head_ID: Real );



implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.JumpConstants,
  IQMS.Common.Dialogs,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.Numbers,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.Jump,
  IQMS.Common.NLS,
  IQMS.Common.McShare,
  Variants,
  IQMS.Common.Miscellaneous,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //TR_Base,
  IQMS.Common.Controls,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //EditMemoStr,
  ForeShare;

procedure DoEditForecast(const AColCaption: string; ADataSet:TDataSet; AArcusto_ID:Real; AForecastType: string; AFore_Head_ID: Real );
var
  FrmEditForecast: TFrmEditForecast;
begin
  FrmEditForecast := TFrmEditForecast.Create(uniGUIApplication.uniApplication);
  with FrmEditForecast do
  begin
    Arcusto_ID      := AArcusto_ID;
    DataSet         := ADataSet;
    FArinvt_ID      := FDataSet.FieldByName('arinvt_id').asFloat;
    ForecastType    := AForecastType;
    Fore_Head_ID    := AFore_Head_ID;
    FStandard_ID    := SelectValueByID('standard_id', 'arinvt', FArinvt_ID );
    ColCaption      := AColCaption;
    ShowModal;
  end;
end;

procedure TFrmEditForecast.UniFormCreate(Sender: TObject);
begin

  IQSetTablesActive( TRUE, self );
  IsConsumeByMonthly:= SelectValueAsString('select fr_consume_monthly from params') = 'Y';


  // 10-09-2014 set the session fore_head_id. This will make the forecast views to look only at this fore_head_id
  ForeShare.AssignSessionForeHead_ID( FFore_Head_ID, FArinvt_ID, FMinDate, FMaxDate );

  Caption:= Format( '%s %s Forecast', [ FDataSet.FieldByName('itemno').asString, FColCaption ]);

  AssignForeItemIDFromArinvtID( FDataSet.FieldByName('arinvt_id').asFloat );

  updtFore_Dtl.DataSet:= wwQryFore_Dtl;

  wwQryForeMonth.Close;
  wwQryForeWk.Close;
  IQRegFormRead( self, [ self, pnlCust, wwgridCust, gridForeDtl ]);

  if FInit_Arcusto_ID > 0 then
     wwQryFore_Cust.Locate('arcusto_id', FInit_Arcusto_ID, []);

  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlSummary );

  PageControl1.ActivePage:= TabSheet1;
  // 10-09-2014 EIQ-4301 Add back Summary tab on Sales Forecasts - Populate with information
  // TabSheet2.TabVisible:= FForecastType = 'P';
  PageControl1Change( NIL );

  AssignDisplayBasedOnConsumeBy;
end;

procedure TFrmEditForecast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IQRegFormWrite( self, [ self, pnlCust, wwgridCust, gridForeDtl ]);

  {if combobox is dropped down - close it here before closing wwQryFore_Dtl otherwise AV}
  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] ForeEdit.pas(388): E2003 Undeclared identifier: 'CloseUp'}
  {wwDBLookupComboShipTo.CloseUp( FALSE );
  wwDBLookupCombo1.CloseUp( FALSE );
  wwDBLookupCombo2.CloseUp( FALSE );}

  {This will trigger IQRegFormWrite for appropriate wwdbgrids}
  //IQSetTablesActive( FALSE, self );

  {Sometimes on exit Delphi threw exception}
  updtForeSummary.DataSet:= NIL;
end;

procedure TFrmEditForecast.FormDestroy(Sender: TObject);
begin
  // reset the session fore_head_id. This will make the forecast views to look only at kind = P
  ForeShare.AssignSessionForeHead_ID( 0, 0, 0, 0 );
end;

function TFrmEditForecast.GetArinvt_ID: Real;
begin
  Result:= FDataSet.FieldByName('arinvt_id').asFloat;
end;

procedure TFrmEditForecast.AssignParams(AColCaption : string);
var
  sMM, sYY: string;
begin
  sMM:= GetToken( UpperCase( AColCaption ), '-', 1 );
  sYY:= GetToken( UpperCase( AColCaption ), '-', 2 );

  FMonth:= IQMonthStrToMonth( sMM );  {IQNLS}
  FYear:= StrToInt( sYY );

  InitDateTime( AColCaption, FMinDate, FMaxDate );
end;


class procedure TFrmEditForecast.InitDateTime( AColCaption : string; var AMinDate, AMaxDate: TDateTime );
var
  sMM, sYY: string;
  mm, yy: Integer;
  ADate  : TDateTime;
  AMonths: string;
begin
  {Parse Apr-1998 so FMinDate = Apr-01-1998 and FMaxDate = Apr-30-1998}
  sMM:= GetToken( UpperCase( AColCaption ), '-', 1 );
  sYY:= GetToken( UpperCase( AColCaption ), '-', 2 );

  // mm:= ( Pos( sMM, AMonths ) - 1) div 4 + 1;
  mm:= IQMonthStrToMonth( sMM );  {IQNLS}
  yy:= StrToInt( sYY );

  {Min and Max dates}
  if mm = 12 then
     AMaxDate:= EncodeDate( yy + 1, 1, 1) - 1
  else
     AMaxDate:= EncodeDate( yy, mm + 1, 1) - 1;

  AMaxDate:= Trunc(AMaxDate) + 86399/86400;
  AMinDate:= EncodeDate( yy, mm, 1);
end;

procedure TFrmEditForecast.AssignForeItemIDFromArinvtID( AArinvt_ID: Real );
begin
  FFore_Item:= SelectValueFmtAsFloat( 'select ID from fore_item where arinvt_id = %f and fore_head_id = %f', [ AArinvt_ID, FFore_Head_ID ]);
  if FFore_Item = 0 then
  begin
    FFore_Item:= GetNextID( 'FORE_ITEM' ) ;
    ExecuteCommandFmt('insert into fore_item( id, fore_head_id, arinvt_id) values(%f, %f, %f)', [FFore_Item, FFore_Head_ID, AArinvt_ID]);
  end;
end;

procedure TFrmEditForecast.AssignIDBeforePost(DataSet: TDataSet);
begin
  with wwQryFore_Cust do
  begin
    if (FInit_Arcusto_ID > 0) and (FieldByName('arcusto_id').asFloat > 0) and (FieldByName('arcusto_id').asFloat <> FInit_Arcusto_ID) then
       IQWarning(Format('Note!'#13#13'Forecast customer: %s. You selected: %s',
                        [ SelectValueFmtAsString('select company from arcusto where id = %f', [FInit_Arcusto_ID]),
                          wwQryFore_CustCompany.asString ]));
  end;
  IQAssignIDBeforePost( DataSet, 'FORE_CUST' );
end;

procedure TFrmEditForecast.TblFore_DtlBeforeInsert(DataSet: TDataSet);
begin
  wwQryFore_Cust.CheckBrowseMode;
  if wwQryFore_Cust.Eof and wwQryFore_Cust.Bof then
     raise Exception.Create('Please add customer before adding forecast details.'#13'Leave customer name blank if you want to enter blanket forecast');
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TFrmEditForecast.TblFore_DtlNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('REQ_DATE').asDateTime := FMinDate;

    if FindField('FORE_DTL_ID') <> NIL then
       FieldByName('FORE_DTL_ID').asFloat:= GetNextID('FORE_DTL')

    else if FindField('ID') <> NIL then
       FieldByName('ID').asFloat := GetNextID('FORE_DTL');

    FieldByName('FORE_CUST_ID').asFloat:= wwQryFore_CustID.asFloat;
  end;
end;

procedure TFrmEditForecast.RefreshParentForm(DataSet: TDataSet);
var
  YY, MM, DD: Word;
begin
  PostCachedUpdate( DataSet );
  DecodeDate( FMinDate, YY, MM, DD );
  PostMessage( TUniForm(Owner).Handle, iq_RefreshDataSets , YY, MM );
end;

procedure TFrmEditForecast.SetArcusto_ID(const Value: Real);
begin
  FInit_Arcusto_ID := Value;
end;

procedure TFrmEditForecast.SetColCaption(const Value: string);
begin
  FColCaption := Value;
  AssignParams( FColCaption );
end;

procedure TFrmEditForecast.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
end;

procedure TFrmEditForecast.SetForecastType(const Value: string);
begin
  FForecastType := Value;
end;

procedure TFrmEditForecast.SetFore_Head_ID(const Value: Real);
begin
  FFore_Head_ID := Value;
end;

procedure TFrmEditForecast.PostAndRefreshParentsForm(DataSet: TDataSet);
begin
  RefreshParentForm( DataSet );

  if DataSet = wwQryForeWk then
     RefreshDataSetByID( wwQryForeWk, 'FORE_DTL_ID' )

  else if DataSet = wwQryForeMonth then
     RefreshDataSetByID( wwQryForeMonth, 'FORE_DTL_ID' )
end;

procedure TFrmEditForecast.PostCachedUpdate(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates( [TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery( DataSet ).CancelUpdates;
      ABORT;
    end;
  end;
end;

procedure TFrmEditForecast.CustomerPickList1Click(Sender: TObject);
begin
  with PkArcusto do
    if Execute then
    begin
      wwQryFore_Cust.Edit;
      wwQryFore_CustARCUSTO_ID.asFloat:= GetValue('id');
    end;
end;

procedure TFrmEditForecast.CheckDateBoundaries(DataSet: TDataSet);
var
  AYear: Integer;
  AMonth: Integer;
begin
  if not ((FMinDate <= DataSet.FieldByName('REQ_DATE').asDateTime) and (DataSet.FieldByName('REQ_DATE').asDateTime <= FMaxDate)) then
     raise Exception.CreateFmt('Selected date must be between %s and %s', [ DateToStr(FMinDate), DateToStr(FMaxDate)]);

  if IsConsumeByMonthly then
  begin
    AYear := Trunc(SelectValueFmtAsFloat('select IQCalendar.YearOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]));
    AMonth:= Trunc(SelectValueFmtAsFloat('select IQCalendar.MonthOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]));

    IQAssert((FMonth = AMonth) and (AYear = FYear),
             'Selected date belongs to the next year according to accounting calendar. Back up to the end of the previous week and try again.');
  end;
end;

procedure TFrmEditForecast.TblFore_DtlBeforePost(DataSet: TDataSet);
var
  ADuplicatesFound: Boolean;
  ADuplicatesErrText: string;
begin
  CheckDateBoundaries(DataSet);

  if DataSet.FieldByName('Is_Ship_To_Belongs_Arcusto').asString = 'N' then
     raise Exception.Create('Ship To does not belong to selected customer');

  DataSet.FieldByName('WEEK').ReadOnly:= FALSE;
  DataSet.FieldByName('WEEK').asFloat := SelectValueFmtAsFloat('select IQCalendar.WeekOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]);
  DataSet.FieldByName('WEEK').ReadOnly:= TRUE;

  DataSet.FieldByName('YEAR').ReadOnly:= FALSE;
  DataSet.FieldByName('YEAR').asFloat := SelectValueFmtAsFloat('select IQCalendar.YearOf( to_date(''%s'', ''MM/DD/YYYY'' )) from dual', [ FormatDateTime('MM/DD/YYYY', DataSet.FieldByName('REQ_DATE').asDateTime) ]);
  DataSet.FieldByName('YEAR').ReadOnly:= TRUE;

  {enforce uniqueness}
  if IsConsumeByMonthly then
     begin
       {avoid same DAY when consumed monthly}
       ADuplicatesFound:= SelectValueFmtAsFloat('select 1 from fore_dtl where fore_cust_id = %f and id <> %f  '+
                                    '   and req_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'') '+
                                    '   and NVL(division_id, 0) = %f and NVL(ship_to_id,0) = %f',
                                    [ Dataset.FieldByName('fore_cust_id').asFloat,
                                      Dataset.FieldByName('id').asFloat,
                                      FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('req_date').asDateTime ),
                                      Dataset.FieldByName('division_id').AsFloat,
                                      Dataset.FieldByName('ship_to_id').asFloat ]) = 1;
       ADuplicatesErrText:= 'Duplicated ''Required'' date'
     end
  else
     begin
       {avoid same WEEK when consumed weekly}
       ADuplicatesFound:= SelectValueFmtAsFloat('select 1 from fore_dtl where fore_cust_id = %f and id <> %f '+
                                    '   and year = %f and week = %f and NVL(division_id, 0) = %f and NVL(ship_to_id,0) = %f',
                                    [ Dataset.FieldByName('fore_cust_id').asFloat,
                                      Dataset.FieldByName('id').asFloat,
                                      Dataset.FieldByName('year').asFloat,
                                      Dataset.FieldByName('week').asFloat,
                                      Dataset.FieldByName('division_id').AsFloat,
                                      Dataset.FieldByName('ship_to_id').asFloat ]) = 1;
       ADuplicatesErrText:= 'Duplicated week'
     end;

  if ADuplicatesFound then
  begin
    if FForecastType = 'P' then
       raise Exception.Create( ADuplicatesErrText + ' - please choose another date' )
    else
       IQWarning( ADuplicatesErrText + ' - you will not be able to convert this to production forecast' )
  end;

  if Dataset.FieldByName('ship_to_id').asFloat = 0 then
     Dataset.FieldByName('ship_to_id').Clear;
end;

procedure TFrmEditForecast.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
     Close;
end;

procedure TFrmEditForecast.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmEditForecast.TblFore_DtlQTYChange(Sender: TField);
begin
  AssignUnitPrice( Sender.DataSet );
end;

procedure TFrmEditForecast.AssignUnitPrice( ADataSet: TDataSet; AForceUpdate: Boolean = False );
var
  APrice: Real;
  ASysDate: TDateTime;
begin
  ASysDate:= ADataSet.FieldByName('REQ_DATE').asDateTime;
  if ASysDate = 0 then
     ASysDate:= FMinDate;
  AssignUnitPrice_Ex( Arinvt_ID, wwQryFore_CustARCUSTO_ID.asFloat, ADataSet.FieldByName('QTY').asFloat, APrice, ASysDate, ADataSet.FieldByName('ship_to_id').asFloat );

  if AForceUpdate or ( APrice > 0 ) then
     ADataSet.FieldByName('PRICE').asFloat:= APrice;
end;

class procedure TFrmEditForecast.AssignUnitPrice_Ex( AArinvt_ID, AArcusto_ID, AQty: Real; var APrice: Real; ASysDate: TDateTime = 0; AShip_To_ID: Real = 0 );
type
  TPriceKind = (pkAKA, pkArinvt, pkDefault);
var
  nAkaId         : Real;
  nId            : Real;
  cIdField       : String;
  cTable         : String;
  APriceBreak    : Real;
  PriceKind      : TPriceKind;
  APer1000Table  : string;
  AcurrId        : Real;
  ACurrency_id   : Real;
  ARate          : Real;
  AShip_To_ID_Str: string;
  ACurrcode      :String;
  ANativeCurrcode :string;
begin
  ARate := 1;
  AcurrId := 0;
  if AArinvt_ID = 0 then  EXIT;

  if AShip_To_ID > 0 then
     AShip_To_ID_Str:= FloatToStr(AShip_To_ID)
  else
     AShip_To_ID_Str:= 'NULL';

  { Determine Unit Price Source - Arinvt or AKA }
  nAkaId := SelectValueFmtAsFloat('select id from aka where arcusto_id = %f and arinvt_id = %f '+
                      '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1',[ AArcusto_ID, AArinvt_ID, AShip_To_ID_Str]);

  if (nAkaId <> 0) and (SelectValueFmtAsFloat('select aka_id from aka_breaks where aka_id = %f', [nAkaId]) <> 0) then
     begin
        PriceKind    := pkAKA;
        nId          := nAkaID;
        cIdField     := 'AKA_ID';
        cTable       := 'AKA_BREAKS';
        APer1000Table:= 'AKA';
     end

  else if SelectValueFmtAsFloat('select arinvt_id from arinvt_breaks where arinvt_id = %f and NVL(buying, ''N'') = ''N''', [ AArinvt_ID ]) > 0 then
     begin
        if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
        begin
          AcurrId := GetEplantNativeCurrencyId; {in McShare.pas}
          ANativeCurrcode := SelectValueFmtAsString('select curr_code from currency where id = %f', [AcurrId]);

          if SelectValueFmtAsFloat('select id from arinvt_breaks where arinvt_id = %f and currency_id = %f and NVL(buying, ''N'') = ''Y'' ' +
                       'and sysdate between NVL(effect_date, sysdate - 36500) and NVL(deactive_date, sysdate + 36500)',
                          [AArinvt_ID, AcurrId]) = 0 then
             AcurrId := 0;
        end;

        PriceKind    := pkARINVT;
        nId          := AArinvt_ID;
        cIdField     := 'ARINVT_ID';
        cTable       := 'ARINVT_BREAKS';
        APer1000Table:= 'ARINVT'
     end
  else
     begin
       PriceKind     := pkDefault;
       nID           := AArinvt_ID;
       APer1000Table := 'ARINVT';
     end;

  if SelectValueAsString('select multicurrency from iqsys') = 'Y' then
     begin
       ACurrency_id := SelectValueFmtAsFloat('select currency_id from aka where id = %f', [nAkaId]);
       if ACurrency_id = 0 then
       begin
          ACurrency_id := SelectValueFmtAsFloat('select currency_id from arcusto where id = %f', [AArcusto_ID]);
          ACurrcode    := SelectValueFmtAsString('select curr_code from currency where id = %f', [ACurrency_id]);
          if ANativeCurrcode <> '' then
            ACurrency_id := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s''', [ACurrcode, ANativeCurrcode])
          else
            ACurrency_id := SelectValueFmtAsFloat('select id from currency where curr_code = ''%s'' and native_curr = ''%s''', [ACurrcode, ACurrcode]);
       end;

       ARate := SelectValueFmtAsFloat('select multicurrency.getfxRate(%f) from dual', [ACurrency_id]);

//       AcurrId := GetEplantNativeCurrencyId; {in McShare.pas}
//
//       if SelectValueFmtAsString('select curr_code from currency where id = %f', [AcurrId])  =
//          SelectValueFmtAsString('select curr_code from currency where id = %f', [ACurrency_id]) then
//       begin
//          ARate := 1;
//          ACurrency_id := 0;
//       end
//       else
//       begin
//         ARate := SelectValueFmtAsFloat('select spot_rate from currency where id = %f', [ACurrency_id]);
//         if ARate = 0 then
//            ARate := 1;
//       end;
     end
  else
     begin
       ACurrency_id := 0;
       ARate := 1;
     end;

  case PriceKind of
    pkAKA, pkArinvt:
       APriceBreak:= GetPriceBreak( AQty, nID, cIdField, cTable, 'N', ACurrency_id, ASysDate );
    pkDefault:
       APriceBreak:= SelectValueFmtAsFloat('select std_price from arinvt where id = %f', [ nID ]);
  end;


  { Per 1000 }
  if SelectValueFmtAsString('select price_per_1000 from %s where id = %f', [ APer1000Table, nID ]) = 'Y' then
     APrice:= (APriceBreak / 1000)*ARate
  else
     APrice:= APriceBreak*ARate;
end;

procedure TFrmEditForecast.wwQryFore_CustAfterInsert(DataSet: TDataSet);
begin
  if FInit_Arcusto_ID > 0 then
     DataSet.FieldByName('arcusto_id').asFloat:= FInit_Arcusto_ID;
end;

procedure TFrmEditForecast.gridForeWkUpdateFooter(Sender: TObject);
var
  A: Variant;
begin
  with (Sender as TIQUniGridControl) do
  try
    { TODO -oSanketG -cWebConvert : Need to find alternative for OnUpdateFooter in TIQUniGridControl }
    //OnUpdateFooter:= NIL;
    if not (Sender as TIQUniGridControl).DataSource.DataSet.Active then
       EXIT;

    GetTotalByFields( A, (Sender as TIQUniGridControl).DataSource.DataSet as TFDQuery );

    { TODO -oSanketG -cWebConvert : Need to find alternative for ColumnByName in TIQUniGridControl }
    {ColumnByName('qty').FooterValue       := Format('%.0f',  [ DtoF(A[ 0 ])  ]);
    ColumnByName('unconsumed').FooterValue:= Format('%.0f',  [ DtoF(A[ 3 ])  ]);

    if not IsConsumeByMonthly then
    begin
    ColumnByName('shipped').FooterValue:= Format('%.0f',  [ DtoF(A[ 1 ]) ]);
    ColumnByName('onorder').FooterValue:= Format('%.0f',  [ DtoF(A[ 2 ]) ]);
    end}
  finally
    { TODO -oSanketG -cWebConvert : Need to find alternative for OnUpdateFooter in TIQUniGridControl }
    //OnUpdateFooter:= gridForeWkUpdateFooter;
  end;
end;

procedure TFrmEditForecast.GetTotalByFields( var A: Variant; AQuery: TFDQuery );
var
  BM : TBookMark;
  h  : TPanelMesg;
begin
  A:= VarArrayOf([ 0.0, 0.0, 0.0, 0.0 ]);  { Forecast, Shipped, OnOrder, UnConsumed }
  h:= hPleaseWait('Calculating totals ...');

  with AQuery do
  try
    BM:= BookMark;
    DisableControls;
    First;
    while not Eof do
    begin
      A[ 0 ]:= A[ 0 ] + FieldByName('QTY').asFloat;
      A[ 3 ]:= A[ 3 ] + FieldByName('Unconsumed').asFloat;
      if not IsConsumeByMonthly then
      begin
         A[ 1 ]:= A[ 1 ] + FieldByName('Shipped').asFloat;
         A[ 2 ]:= A[ 2 ] + FieldByName('OnOrder').asFloat;
      end;
      Next;
    end;
  finally
    BookMark:= BM;
    h.Free;
    EnableControls;
  end;
end;

procedure TFrmEditForecast.gridForeWkCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.FieldName = 'SHIP_TO_ID' then
     ABrush.Color:= clBtnFace

  else if Field.ReadOnly then
     ABrush.Color:= clBtnFace

  else if (wwQryFore_DtlPARENT_ID.asFloat > 0) then
     begin
        ABrush.Color:= iIIf( FStandard_ID > 0, clBlue, clYellow );
        AFont.Color := iIIf( FStandard_ID > 0, clWhite, clBlack );
     end;

  if CompareText(Field.FieldName, 'ship_to_attn') = 0 then
  begin
    if wwQryFore_DtlIs_Ship_To_Belongs_Arcusto.asString = 'N' then
       AFont.Color:= clRed;
  end;
end;


procedure TFrmEditForecast.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditForecast.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmEditForecast.NavQtyBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  h: TPanelMesg;
begin
  if Button = nbRefresh then
  try
     h:= hPleaseWait('Refreshing ...');
     { TODO -oSanketG -cWebConvert : Need to revisit }
     {if NavQty.DataSource.DataSet = wwQryForeWk then
        RefreshDataSetByID( wwQryForeWk, 'FORE_DTL_ID' )
     else
        RefreshDataSetByID( NavQty.DataSource.DataSet );
     ABORT;}
  finally
     h.Free;
  end;
end;

procedure TFrmEditForecast.PageControl1Change(Sender: TObject);
var
  DS: TDataSource;
  h: TPanelMesg;
begin
  h:= hPleaseWait('Accessing Forecast Data ...');
  try
    {Next Active DataSource}
    if PageControl1.ActivePage = TabSheet1 then
       DS:= wwSrcFore_Dtl
    else
       begin
         if IsConsumeByMonthly then
            DS:= wwSrcForeMonth
         else
            DS:= wwSrcForeWk
       end;

    {Close current}
    { TODO -oSanketG -cWebConvert : Need to revisit }
    {if Assigned( NavQty.DataSource ) then
       NavQty.DataSource.DataSet.Close;}

    {Reopen}
    ReopenA( DS.DataSet );
    { TODO -oSanketG -cWebConvert : Need to revisit }
    //NavQty.DataSource:= DS;

  finally
    h.Free;
  end;
end;

procedure TFrmEditForecast.wwQryForeWkAfterOpen(DataSet: TDataSet);
begin
  if DataSet = wwQryForeWk then
     IQRegFormRead( self, [ gridForeWk ])
  else if DataSet = wwQryForeMonth then
     IQRegFormRead( self, [ gridForeMonth ])
  else
     IQRegFormRead( self, [ gridForeDtl ])
end;

procedure TFrmEditForecast.wwQryForeWkBeforeClose(DataSet: TDataSet);
begin
  if DataSet = wwQryForeWk then
     IQRegFormWrite( self, [ gridForeWk ])
  else if DataSet = wwQryForeMonth then
     IQRegFormWrite( self, [ gridForeMonth ])
  else
     IQRegFormWrite( self, [ gridForeDtl ])
end;

procedure TFrmEditForecast.wwQryFore_CustBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do
//    ParamByName('fore_item_id').asFloat:= FFore_Item;
  AssignQueryParamValue(DataSet, 'fore_item_id', FFore_Item);
end;

procedure TFrmEditForecast.wwQryFore_CustCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  wwQryFore_CustArinvt_ID.asFloat:= FArinvt_ID;
  wwQryFore_CustDate1.asDateTime := FMinDate;
  wwQryFore_CustDate2.asDateTime := FMaxDate;

  if wwQryFore_CustARCUSTO_ID.asFloat = 0 then
  begin
    wwQryFore_CustCustNo.asString := 'N/A';
    wwQryFore_CustCompany.asString:= 'Non specific ( blanket forecast )';
  end;

  wwQryFore_CustKind.asString:= FForecastType;
  wwQryFore_CustFore_Head_ID.asFloat:= FFore_Head_ID;
end;

procedure TFrmEditForecast.wwgridCustCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and (Field = wwQryFore_CustID) then
     ABrush.Color:= clBtnFace;
end;

procedure TFrmEditForecast.wwQryFore_CustNewRecord(DataSet: TDataSet);
begin
  with wwQryFore_Cust do
  begin
    if FieldByName('id').asFloat = 0 then
       FieldByName('id').asFloat:= GetNextID('FORE_CUST');
    FieldByName('fore_item_id').asFloat:= FFore_Item;
  end;
end;

procedure TFrmEditForecast.wwQryFore_DtlBeforeDelete(DataSet: TDataSet);
var
  ACount:Integer;
begin
  ACount := Trunc(SelectValueFmtAsFloat('select count(id) from fore_dtl_edi where fore_cust_id = %f', [wwQryFore_CustID.asFloat]));
  if ACount <> 0 then
    raise exception.Create('This forecast is being controlled by EDI. Therefore delete only at the customer level.');

end;

procedure TFrmEditForecast.wwDBLookupComboShipToDropDown(Sender: TObject);
begin
  with QryShip_To do
  begin
    Close;
//    ParamByName('arcusto_id').asFloat:= wwQryFore_CustARCUSTO_ID.asFloat;
//    ParamByName('disp_all').asFloat  := 0;
    AssignQueryParamValue(QryShip_To, 'arcusto_id', wwQryFore_CustARCUSTO_ID.asFloat);
    AssignQueryParamValue(QryShip_To, 'disp_all'  , 0);
    Open;
  end;

  { TODO -oSanketG -cWebConvert : Need to find alternative for LookupValue, PerformSearch in TUniDBLookupComboBox }
  {with TUniDBLookupComboBox(Sender) do if Assigned(DataSource) then
    if (DataSource.DataSet.FieldByName('SHIP_TO_ID').asFloat > 0) then
    begin
      LookupValue:= SelectValueByID( 'attn', 'ship_to', wwQryFore_DtlSHIP_TO_ID.asFloat );
      PerformSearch;
    end;}
end;

{procedure TFrmEditForecast.wwDBLookupComboShipToCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  with QryShip_To do
  begin
    Close;
//    ParamByName('arcusto_id').asFloat:= wwQryFore_CustARCUSTO_ID.asFloat;
//    ParamByName('disp_all').asFloat  := 1;
    AssignQueryParamValue(QryShip_To, 'arcusto_id', wwQryFore_CustARCUSTO_ID.asFloat);
    AssignQueryParamValue(QryShip_To, 'disp_all'  , 1);
    Open;
  end;
end;
}

procedure TFrmEditForecast.wwQryFore_DtlCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Is_Ship_To_Belongs_Arcusto').asString:= '';

  if (DataSet.FieldByName('SHIP_TO_ID').asFloat > 0) then
  begin
    if SelectValueByID('arcusto_id', 'ship_to', DataSet.FieldByName('SHIP_TO_ID').asFloat ) = wwQryFore_CustARCUSTO_ID.asFloat then
       DataSet.FieldByName('Is_Ship_To_Belongs_Arcusto').asString:= 'Y'
    else
       DataSet.FieldByName('Is_Ship_To_Belongs_Arcusto').asString:= 'N';

    DataSet.FieldByName('ship_to_attn').asString:= SelectValueByID( 'attn', 'ship_to', DataSet.FieldByName('SHIP_TO_ID').asFloat );
  end;

  if wwQryFore_DtlPARENT_ID.asFloat > 0 then
     wwQryFore_DtlParentItemNo.asString:= SelectValueFmtAsString('select a.itemno                                       '+
                                                       '  from fore_dtl d, fore_cust c, fore_item i, arinvt a '+
                                                       ' where d.id = %f                                      '+
                                                       '   and d.fore_cust_id = c.id                          '+
                                                       '   and c.fore_item_id = i.id                          '+
                                                       '   and i.arinvt_id = a.id                             ',
                                                       [ wwQryFore_DtlPARENT_ID.asFloat ]);
end;

procedure TFrmEditForecast.AssignDisplayBasedOnConsumeBy;
begin
  case IsConsumeByMonthly of
    TRUE:
      begin
        pgctrlSummary.ActivePage:= TabSumMonthly;
        updtForeSummary.DataSet := wwQryForeMonth;
      end;

    FALSE:
      begin
        pgctrlSummary.ActivePage:= TabSumWeekly;
        updtForeSummary.DataSet := wwQryForeWk;
      end;
  end;
end;

procedure TFrmEditForecast.wwQryForeWkUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  updtForeSummary.Apply( ARequest, AAction, AOptions );

  {bde is loosing this field - correct it manually}
  ExecuteCommandFmt('update fore_dtl set ship_to_id = %s where id = %f',
            [ IIf( ASender.FieldByName('ship_to_id').asString = '', 'NULL', ASender.FieldByName('ship_to_id').asString ),
              ASender.FieldByName('id').asFloat ]);

  AAction := eaApplied;
end;

procedure TFrmEditForecast.wwQryFore_DtlUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  updtFore_Dtl.Apply( ARequest, AAction, AOptions );

  {bde is loosing this field - correct it manually}
  if ARequest in [arInsert, arUpdate ] then
  begin
     ExecuteCommandFmt('update fore_dtl set ship_to_id = %s, division_id = %s where id = %f',
               [ IQMS.Common.StringUtils.FloatToStr0asNull( ASender.FieldByName('ship_to_id').asFloat, 'null' ),
                 IQMS.Common.StringUtils.FloatToStr0asNull( ASender.FieldByName('division_id').asFloat, 'null' ),
                 ASender.FieldByName('id').asFloat ]);
  end;

  AAction := eaApplied;
end;


procedure TFrmEditForecast.wwQryFore_DtlSHIP_TO_IDChange(Sender: TField);
begin
  if FLastShip_To_ID <> Sender.AsFloat then
  begin
    MessageBeep(0);
    FLastShip_To_ID:= Sender.AsFloat;
    AssignUnitPrice( Sender.DataSet );
  end;
end;

procedure TFrmEditForecast.wwQryFore_DtlAfterEdit(DataSet: TDataSet);
begin
  FLastShip_To_ID:= DataSet.FieldByName('ship_to_id').asFloat;
end;

procedure TFrmEditForecast.Trace1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //DoShowTrace( self, 'FORE_DTL', wwQryFore_DtlID.asFloat ); {TR_Base.pas}
end;

procedure TFrmEditForecast.wwDBComboDlgDivisionCustomDlg(Sender: TObject);
begin
  IQAssert( wwQryFore_CustARCUSTO_ID.asFloat = 0, 'Division assignment is only applicable to non specific (blanket forecast)' );  // only blanket forecast
  IQAssert( SelectValueByID('standard_id', 'arinvt', Arinvt_ID) = 0, 'Division assignment is only applicable to purchased materials' );  // only purchased items for now

  with PkDivision do
    if Execute then
    begin
      wwQryFore_Dtl.Edit;
      wwQryFore_DtlDIVISION_ID.asFloat:= GetValue('ID');
    end;
end;

procedure TFrmEditForecast.wwDBComboDlgDivisionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    wwQryFore_Dtl.Edit;
    wwQryFore_DtlDIVISION_ID.Clear;
    Key:= 0;
  end;
end;

procedure TFrmEditForecast.wwDBComboDlgNoteCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= wwQryFore_DtlNOTE1.asString;
  { TODO -oSanketG -cWebConvert : Need to revisit }
  (*if DoEditMemoStr( self, S, 2000, 'Note' ) then    {EditMemoStr.pas}
  begin
    wwQryFore_Dtl.Edit;
    wwQryFore_DtlNOTE1.asString:= S;
  end;*)
end;

procedure TFrmEditForecast.DDApplyClick(Sender: TObject);
begin
  if not (wwQryFore_Dtl.State in [dsEdit, dsInsert]) then wwQryFore_Dtl.Edit;
  AssignUnitPrice(wwQryFore_Dtl, True);
  wwQryFore_Dtl.Post;
end;

procedure TFrmEditForecast.UpdateTheseQuantities1Click(Sender: TObject);
begin
  wwQryFore_Dtl.First;
  while not wwQryFore_Dtl.eof do
  begin
    if not (wwQryFore_Dtl.State in [dsEdit, dsInsert]) then wwQryFore_Dtl.Edit;
    AssignUnitPrice(wwQryFore_Dtl, True);
    wwQryFore_Dtl.Post;
    wwQryFore_Dtl.Next;
  end;
end;


end.

