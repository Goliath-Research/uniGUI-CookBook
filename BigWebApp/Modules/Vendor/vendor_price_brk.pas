unit vendor_price_brk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  System.Variants,
//  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.Search,
//  Mask,
  Vcl.Menus,
  Vcl.DBCtrls,// Navigate Btn sets
  Data.DB,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Jump,
//  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniDBEdit,
  Vcl.Controls;

type
  TAdjMode = (amNone, amIncrement, amManual);

  TFrmVendorPriceBrk = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    PnlLeft03: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    IQSearch1: TIQUniGridControl;
    pcBreaks: TUniPageControl;
    TabArinvt: TUniTabSheet;
    TabAka: TUniTabSheet;
    GridAka: TIQUniGridControl;
    GridArinvt: TIQUniGridControl;
    QryArinvt: TFDQuery;
    SrcArinvt: TDataSource;
    QryArinvtID: TBCDField;
    QryArinvtTYPE: TStringField;
    QryArinvtITEMNO: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP2: TStringField;
    IQAbout1: TIQWebAbout;
    QryArinvtVendorsBreaks: TFDQuery;
    SrcAka_Breaks: TDataSource;
    QryArinvt_Breaks: TFDQuery;
    SrcArinvt_Breaks: TDataSource;
    QryArinvtAKA_ID: TFMTBCDField;
    QryArinvt_BreaksARINVT_ID: TBCDField;
    QryArinvt_BreaksQUAN: TBCDField;
    QryArinvt_BreaksQPRICE: TFMTBCDField;
    QryArinvt_BreaksPRICE_DATE: TDateTimeField;
    QryArinvt_BreaksEFFECT_DATE: TDateTimeField;
    QryArinvt_BreaksDEACTIVE_DATE: TDateTimeField;
    QryArinvt_BreaksID: TBCDField;
    QryArinvtVendorsBreaksQUAN: TBCDField;
    QryArinvtVendorsBreaksQPRICE: TFMTBCDField;
    QryArinvtVendorsBreaksPRICE_DATE: TDateTimeField;
    QryArinvtVendorsBreaksEFFECT_DATE: TDateTimeField;
    QryArinvtVendorsBreaksDEACTIVE_DATE: TDateTimeField;
    QryArinvtVendorsBreaksID: TBCDField;
    IQJumpInv: TIQWebJump;
    PopupMenu1: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    Contents1: TUniMenuItem;
    PnlLeft02: TUniPanel;
    PnlLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    Panel9: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    EdPr: TUniDBNumberEdit;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Panel16: TUniPanel;
    Panel17: TUniPanel;
    Label4: TUniLabel;
    Panel3: TUniPanel;
    Panel5: TUniPanel;
    Panel7: TUniPanel;
    Label5: TUniLabel;
    Panel8: TUniPanel;
    NavAka: TUniDBNavigator;
    DTDate: TUniDateTimePicker;
    EdIn: TUniDBNumberEdit;
    QryArinvtCODE: TStringField;
    rbPercent: TUniRadioButton;
    rbFlatAmount: TUniRadioButton;
    wwDBSpinEditFlatAmount: TUniDBNumberEdit;
    Label6: TUniLabel;
    edComment: TUniEdit;
    QryArinvtVendorsBreaksCOMMENT1: TStringField;
    QryArinvt_BreaksCOMMENT1: TStringField;
    QryArinvtAKA_ITEMNO: TStringField;
    QryArinvtAKA_DESCRIP: TStringField;
    QryArinvtAKA_REV: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    QryArinvtVendorsBreaksARINVT_VENDORS_ID: TBCDField;
    QryArinvtPK_HIDE: TStringField;
    Panel10: TUniPanel;
    sbtnToggleHide: TUniSpeedButton;
    Splitter4: TUniSplitter;
    Panel14: TUniPanel;
    pgctrlMode: TUniPageControl;
    tabIncrement: TUniTabSheet;
    tabManual: TUniTabSheet;
    Panel6: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Panel11: TUniPanel;
    Splitter3: TUniSplitter;
    Panel12: TUniPanel;
    Label8: TUniLabel;
    Panel13: TUniPanel;
    dtManualAdjDate: TUniDateTimePicker;
    pnlIncrease: TUniPanel;
    sbtnToggleHideArinvtBreaks: TUniSpeedButton;
    sbtnToggleHideAkaBreaks: TUniSpeedButton;
    UpdateSQLArinvtBreaks: TFDUpdateSQL;
    UpdateSQLArinvtVendorsBreaks: TFDUpdateSQL;
    SR: TIQWebSecurityRegister;
    Panel15: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    Label7: TUniLabel;
    EdCurrncy: TUniEdit;
    PKCurrency: TIQWebHPick;
    PKCurrencyCURR_CODE: TStringField;
    QryArinvt_BreaksCURR_CODE: TStringField;
    QryArinvt_BreaksCURRENCY_ID: TBCDField;
    QryArinvt_BreaksBUYING: TStringField;
    QryArinvtARINVT_GROUP_DESCRIP: TStringField;
    NavArinvt: TUniDBNavigator;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure QryArinvtAfterScroll(DataSet: TDataSet);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure AdjustDisplay(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure sbtnToggleHideClick(Sender: TObject);
    procedure QryArinvt_BreaksBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtVendorsBreaksBeforeOpen(DataSet: TDataSet);
    procedure pgctrlModeChange(Sender: TObject);
    procedure QryArinvtVendorsBreaksNewRecord(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryArinvt_BreaksBeforePost(DataSet: TDataSet);
    procedure sbtnToggleHideAkaBreaksClick(Sender: TObject);
    procedure QryArinvt_BreaksNewRecord(DataSet: TDataSet);
{ TODO -oLema : To find a workaround to CalcCellColors }
//    procedure GridAkaCalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure QryArinvt_BreaksFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FVendor_ID: Real;
    Fincr: Real;
    FDate: TDateTime;
    FPrecision: Integer;
    FComment: string;
    FCurrencyId: Real;
    FCurrencyCode: string;
    procedure ProcessInventory;
    procedure ProcessPriceBreak;

    procedure AssignAdjustmentMode;
    function GetAdjustmentMode: TAdjMode;

    function GetInvPriceBreakDS: TFDQuery;
    property InvPriceBreakDS: TFDQuery read GetInvPriceBreakDS;
    procedure SetCurrencyId(aCurrCode: string);
    procedure SetVendor_ID(const Value: Real);
    function GetVendor_ID:Real;
  public
    { Public declarations }
    property Vendor_ID: Real read GetVendor_ID write SetVendor_ID;
  end;

procedure DoShowVendorPriceBrks(AVendor_ID: Real);

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  vendor_rscstr,
  cust_rscstr;

procedure DoShowVendorPriceBrks(AVendor_ID: Real);
var
  frm : TFrmVendorPriceBrk;
  Anative_curr: string;
begin
  frm := TFrmVendorPriceBrk.Create(uniGUIApplication.UniApplication);
  frm.Vendor_ID := AVendor_ID;

  if frm.Vendor_ID <> 0 then
    frm.HelpContext := 16239
  else
    frm.HelpContext := 16294;

  frm.Show;
end;

procedure TFrmVendorPriceBrk.UniFormCreate(Sender: TObject);
begin
//
end;

procedure TFrmVendorPriceBrk.FormShow(Sender: TObject);
var
  Anative_curr: string;
begin
  AdjustPageControlToParent(pcBreaks); //iqctrl
  AdjustDisplay(nil);

  dtManualAdjDate.DateTime := Now;
  DTDate.DateTime := Now;

  if Vendor_ID > 0 then
    //vendor_rscstr.cTXT0000018 =
    //'Vendor (%s) price breaks'
    Caption := Format(vendor_rscstr.cTXT0000018,
      [SelectValueFmtAsString(
      'select RTrim(company) || '', '' || RTrim(vendorno) from vendor where id = %f',
      [Vendor_ID])]);

  QryArinvt.Close;
  QryArinvt.ParamByName('AID').Value := Vendor_ID;

  IQSetTablesActive(True, Self);

  pgctrlMode.ActivePageIndex := 0;
  pgctrlModeChange(nil);

  Panel15.Visible := SelectValueAsString(
    'select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y';

  FCurrencyId := 0;
  FCurrencyCode := '***';

  if Panel15.Visible then
  begin
    Anative_curr := SelectValueAsString(
      'select native_curr from eplant where id = misc.geteplantid');
    SetCurrencyId(Anative_curr);
  end;

  QryArinvt_Breaks.Filtered := Panel15.Visible;

  IQRegFormRead(self, [self, GridAka, GridArinvt, PnlLeft03, PnlLeft01, PnlLeft02]);
end;


procedure TFrmVendorPriceBrk.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmACCT{CHM}, iqhtmAR{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmVendorPriceBrk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, GridAka, GridArinvt, PnlLeft03, PnlLeft01, PnlLeft02]);
end;

procedure TFrmVendorPriceBrk.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendorPriceBrk.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmVendorPriceBrk.QryArinvtAfterScroll(DataSet: TDataSet);
begin
  if QryArinvtTYPE.AsString = 'ARINVT_VENDORS' then
    pcBreaks.ActivePage := TabAka
  else
    pcBreaks.ActivePage := TabArinvt;

  pcBreaks.Visible := True;
end;

procedure TFrmVendorPriceBrk.BtnOkClick(Sender: TObject);
begin
  if not IqConfirmYN(cust_rscstr.cTXT0000042 {'Update prices?'}) then
    Exit;

  FComment := edComment.text;

  if rbPercent.Checked then
    try
      Fincr := 1 + EdIn.Value / 100;
    except
      raise exception.Create(cust_rscstr.cTXT0000043); //The Increment Percentage is invalid
    end;

  if rbFlatAmount.Checked then
    Fincr := wwDBSpinEditFlatAmount.Value;

  FDate := Trunc(DTDate.DateTime);

  FPrecision := Trunc(EdPr.Value);

  if FPrecision < 0 then
    raise exception.Create(cust_rscstr.cTXT0000045); //'Precision must not be negative'

  if FPrecision > 6 then
    raise exception.Create(cust_rscstr.cTXT0000046); //'Precision must not be negative'

  ProcessInventory;

  IQInformation(cust_rscstr.cTXT0000047); //'Update completed.
end;

procedure TFrmVendorPriceBrk.ProcessInventory;
var
  I: Integer;
begin
  if IQSearch1.dbgrid.SelectedRows.Count = 0 then
    raise exception.Create(cust_rscstr.cTXT0000048); //'Please select records.'

  with IQSearch1.dbgrid, IQSearch1.dbgrid.datasource.DataSet do
    for I := 0 to SelectedRows.Count - 1 do
    begin
      GotoBookmark(SelectedRows.items[I]);
      ProcessPriceBreak;
    end;
end;

procedure TFrmVendorPriceBrk.ProcessPriceBreak;
var
  AQry: TFDQuery;
  APrice: Real;
  ATable, AField: string;
  APriceDate: TDateTime;

  procedure InsertPriceBreakBasedOn(ABreak_ID: Real; ATableName, AFieldName: string);
  var
    AExpr: string;
  begin
    if rbPercent.Checked then
      AExpr := 'Round(qprice * %.6f, %d)'
    else if rbFlatAmount.Checked then
      AExpr := 'Round(qprice + %.6f, %d)'
    else
      Exit;

    if ATableName = 'ARINVT_VENDORS_BREAKS' then
      ExecuteCommandFmt(
        'insert into %s (%s, quan, qprice, effect_date, price_date, comment1) ' +
        ' select %s, quan, %s, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR HH24:MI''), ''%s'' from %s where id = %f',
        [ATableName,
        AFieldName,
        AFieldName,
        IQFormat(AExpr, [Fincr, FPrecision]),
        FormatDateTime('mm/dd/yyyy', FDate),
        FormatDateTime('mm/dd/yyyy hh:nn', APriceDate),
        StrTran(FComment, '''', ''''''),
        ATableName,
        ABreak_ID])
    else
      ExecuteCommandFmt(
        'insert into %s (%s, quan, qprice, effect_date, price_date, comment1, buying, currency_id) ' +
        ' select %s, quan, %s, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR HH24:MI''), ''%s'', ''Y'', currency_id from %s where id = %f',
        [ATableName,
        AFieldName,
        AFieldName,
        IQFormat(AExpr, [Fincr, FPrecision]),
        FormatDateTime('mm/dd/yyyy', FDate),
        FormatDateTime('mm/dd/yyyy hh:nn', APriceDate),
        StrTran(FComment, '''', ''''''),
        ATableName,
        ABreak_ID]);

    ExecuteCommandFmt('update %s set deactive_date = To_Date(''%s'', ''MM/DD/RRRR'') where id = %f',
      [ATableName,
      FormatDateTime('mm/dd/yyyy', FDate),
      ABreak_ID]);

  end;

begin
  if QryArinvtTYPE.AsString = 'ARINVT_VENDORS' then
  begin
    AQry := QryArinvtVendorsBreaks;
    ATable := 'ARINVT_VENDORS_BREAKS';
    AField := 'ARINVT_VENDORS_ID';
  end
  else
  begin
    AQry := QryArinvt_Breaks;
    ATable := 'ARINVT_BREAKS';
    AField := 'ARINVT_ID';
  end;

  APriceDate := Now();

  with AQry do
  begin
    AQry.First;
    if Eof and Bof then
      Exit;
    while not Eof do
    begin
      InsertPriceBreakBasedOn(FieldByName('ID').AsLargeInt, ATable, AField);
      Next;
    end;
    AQry.Close;
    AQry.Open;
  end;
end;

procedure TFrmVendorPriceBrk.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendorPriceBrk.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmVendorPriceBrk.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(HelpContext);
end;

procedure TFrmVendorPriceBrk.AdjustDisplay(Sender: TObject);
begin
  IQEnableControl(EdIn, rbPercent.Checked);
  IQEnableControl(wwDBSpinEditFlatAmount, rbFlatAmount.Checked);
end;

procedure TFrmVendorPriceBrk.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AID', FVendor_ID);
  AssignQueryParamValue(DataSet, 'PK_HIDE', IIf(not sbtnToggleHide.Down, 1, 2));
end;

procedure TFrmVendorPriceBrk.sbtnToggleHideAkaBreaksClick(Sender: TObject);
begin
  Reopen(InvPriceBreakDS);
end;

procedure TFrmVendorPriceBrk.sbtnToggleHideClick(Sender: TObject);
begin
  Reopen(QryArinvt)
end;

procedure TFrmVendorPriceBrk.QryArinvtVendorsBreaksNewRecord(DataSet: TDataSet);
begin
  QryArinvtVendorsBreaksID.AsLargeInt := GetNextID('ARINVT_VENDORS_BREAKS');
  QryArinvtVendorsBreaksARINVT_VENDORS_ID.AsLargeInt := QryArinvtAKA_ID.AsLargeInt;
  QryArinvtVendorsBreaksEFFECT_DATE.AsDateTime := dtManualAdjDate.DateTime;
  QryArinvtVendorsBreaksPRICE_DATE.Clear;
  QryArinvtVendorsBreaksDEACTIVE_DATE.Clear;
end;

procedure TFrmVendorPriceBrk.QryArinvt_BreaksBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', QryArinvtID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'HIDE_INACTIVE',
    IIf(not sbtnToggleHideArinvtBreaks.Down, 0, 1));
end;

procedure TFrmVendorPriceBrk.QryArinvt_BreaksBeforePost(DataSet: TDataSet);
var
  ACurrencyId: Int64;
begin
  QryArinvt_BreaksARINVT_ID.AsLargeInt := QryArinvtID.AsLargeInt;
  QryArinvt_BreaksBUYING.AsString := 'Y';
  if Panel15.Visible then
  begin
    ACurrencyId := SelectValueFmtAsInt64(
      'select min(id) from currency where curr_code = ''%s''',
      [FCurrencyCode]);
    if ACurrencyId <> 0 then
    begin
      QryArinvt_BreaksCURRENCY_ID.AsLargeInt := ACurrencyId;
      QryArinvt_BreaksCURR_CODE.AsString := FCurrencyCode;
    end;
  end;
end;

procedure TFrmVendorPriceBrk.QryArinvt_BreaksNewRecord(DataSet: TDataSet);
begin
  QryArinvt_BreaksID.AsLargeInt := GetNextID('ARINVT_BREAKS');
  QryArinvt_BreaksARINVT_ID.AsLargeInt := QryArinvtID.AsLargeInt;
  QryArinvt_BreaksEFFECT_DATE.AsDateTime := dtManualAdjDate.DateTime;
  QryArinvt_BreaksPRICE_DATE.Clear;
  QryArinvt_BreaksDEACTIVE_DATE.Clear;
end;

procedure TFrmVendorPriceBrk.QryArinvtVendorsBreaksBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'AKA_ID', QryArinvt_BreaksID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'HIDE_INACTIVE',
    IIf(not sbtnToggleHideAkaBreaks.Down, 0, 1));
end;

procedure TFrmVendorPriceBrk.pgctrlModeChange(Sender: TObject);
begin
  AssignAdjustmentMode;
end;


procedure TFrmVendorPriceBrk.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;


function TFrmVendorPriceBrk.GetAdjustmentMode: TAdjMode;
begin
  if pgctrlMode.ActivePage = tabIncrement then
    Result := amIncrement
  else if pgctrlMode.ActivePage = tabManual then
    Result := amManual
  else
    Result := amNone
end;

function TFrmVendorPriceBrk.GetInvPriceBreakDS: TFDQuery;
begin
  if QryArinvtTYPE.AsString = 'ARINVT_VENDORS' then
    Result := QryArinvtVendorsBreaks
  else if QryArinvtTYPE.AsString = 'ARINVT' then
    Result := QryArinvt_Breaks
  else
    Result := nil;
end;


{
procedure TFrmVendorPriceBrk.GridAkaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  ASysDate: TDateTime;
begin
  ASysDate := SelectValueAsFloat('select trunc(sysdate) from dual');

  if Highlight then
    Exit;

  if not Assigned(InvPriceBreakDS) then
    Exit;

  with InvPriceBreakDS do
  begin
    if (FieldByName('DEACTIVE_DATE').IsNull or (Trunc(FieldByName('DEACTIVE_DATE').AsDateTime) >=
      ASysDate)) and
      (FieldByName('EFFECT_DATE').IsNull or (Trunc(FieldByName('EFFECT_DATE').AsDateTime) <=
      ASysDate)) then
    begin
      ABrush.Color := clWhite;
      AFont.Color := clBlack;
    end
    else
    begin
      ABrush.Color := clBtnFace;
      AFont.Color := clBlack;
    end;
  end;
end;
}

procedure TFrmVendorPriceBrk.AssignAdjustmentMode;
begin
  if Assigned(InvPriceBreakDS) then
    InvPriceBreakDS.Close;

  QryArinvtVendorsBreaks.CachedUpdates := (GetAdjustmentMode = amManual) and
    SR.ReadWrite['QryArinvtVendorsBreaks'];
  QryArinvt_Breaks.CachedUpdates := (GetAdjustmentMode = amManual) and
    SR.ReadWrite['QryArinvt_Breaks'];

  if GetAdjustmentMode = amManual then
  begin
    NavArinvt.VisibleButtons := NavArinvt.VisibleButtons + [nbInsert, nbDelete, nbPost, nbCancel,
      nbRefresh];
    NavAka.VisibleButtons := NavAka.VisibleButtons + [nbInsert, nbDelete, nbPost, nbCancel,
      nbRefresh];
  end
  else
  begin
    NavArinvt.VisibleButtons := NavArinvt.VisibleButtons - [nbInsert, nbDelete, nbPost, nbCancel,
      nbRefresh];
    NavAka.VisibleButtons := NavAka.VisibleButtons - [nbInsert, nbDelete, nbPost, nbCancel,
      nbRefresh];
  end;

{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.AutoSizeNavBar(NavArinvt);
//  IQMS.Common.Controls.AutoSizeNavBar(NavAka);

  if Assigned(InvPriceBreakDS) then
    Reopen(InvPriceBreakDS);
end;

procedure TFrmVendorPriceBrk.SetCurrencyId(aCurrCode: string);
begin
  if aCurrCode = '' then
    FCurrencyId := SelectValueAsFloat('select currency_id from iqsys where rownum < 2')
  else
  begin
    FCurrencyId := SelectValueFmtAsFloat('select min(id) from currency where curr_code = ''%s''',
      [aCurrCode]);
  end;
  FCurrencyCode := SelectValueFmtAsString('select curr_code from currency where id = %f',
    [FCurrencyId]);
  if FCurrencyCode = '' then
    FCurrencyCode := '***';
  EdCurrncy.ReadOnly := false;
  EdCurrncy.text := FCurrencyCode;
  EdCurrncy.ReadOnly := True;
  QryArinvt_Breaks.Close;
  QryArinvt_Breaks.Open;
end;

function TFrmVendorPriceBrk.GetVendor_ID: Real;
begin
  Result := FVendor_ID;
end;

procedure TFrmVendorPriceBrk.SetVendor_ID(const Value: Real);
begin
  FVendor_ID := Value;
end;

procedure TFrmVendorPriceBrk.SRAfterApply(Sender: TObject);
begin
{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.AutoSizeNavBar(NavArinvt);
//  IQMS.Common.Controls.AutoSizeNavBar(NavAka);
end;


procedure TFrmVendorPriceBrk.QryArinvt_BreaksFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  aCurrCode: string;
begin
  if (not Panel15.Visible) or (FCurrencyCode = '***') then
    Accept := True
  else
    Accept := (QryArinvt_BreaksCURR_CODE.AsString = FCurrencyCode);
end;

procedure TFrmVendorPriceBrk.sbtnSearchClick(Sender: TObject);
var
  aCurrCode: string;
begin
  with PKCurrency do
    if Execute then
    begin
      aCurrCode := System.Variants.VarAsType(GetValue('CURR_CODE'), varUInt64);
      SetCurrencyId(aCurrCode);
    end;
end;

end.
