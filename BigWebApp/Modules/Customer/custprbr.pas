unit CustPrBr;

interface

uses
  MainModule,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  System.Classes,
  System.SysUtils,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  Vcl.Grids,
  Winapi.Windows,
  Data.DB,
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
  uniPageControl, IQUniGrid, uniGUIFrame, uniDBEdit;


type
  TAdjMode = (amNone, amIncrement, amManual );

  TFrmCustPriceBrk = class(TUniForm)
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
    QryAka_Breaks: TFDQuery;
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
    QryAka_BreaksAKA_ID: TBCDField;
    QryAka_BreaksQUAN: TBCDField;
    QryAka_BreaksQPRICE: TFMTBCDField;
    QryAka_BreaksPRICE_DATE: TDateTimeField;
    QryAka_BreaksEFFECT_DATE: TDateTimeField;
    QryAka_BreaksDEACTIVE_DATE: TDateTimeField;
    QryAka_BreaksID: TBCDField;
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
    QryAka_BreaksCOMMENT1: TStringField;
    QryArinvt_BreaksCOMMENT1: TStringField;
    QryArinvtAKA_ITEMNO: TStringField;
    QryArinvtAKA_DESCRIP: TStringField;
    QryArinvtAKA_REV: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    Panel10: TUniPanel;
    sbtnToggleHide: TUniSpeedButton;
    QryArinvtPK_HIDE: TStringField;
    QryArinvtSHIP_TO_ID: TStringField;
    QryArinvtSHIP_TO_ATTN: TStringField;
    QryArinvtSHIP_TO_CITY: TStringField;
    QryArinvtAKA_KIND: TStringField;
    pgctrlMode: TUniPageControl;
    tabIncrement: TUniTabSheet;
    tabManual: TUniTabSheet;
    Panel6: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Panel11: TUniPanel;
    Splitter3: TUniSplitter;
    Panel12: TUniPanel;
    Label8: TUniLabel;
    Panel13: TUniPanel;
    dtManualAdjDate: TUniDateTimePicker;
    Splitter4: TUniSplitter;
    UpdateSQLAkaBreaks: TFDUpdateSQL;
    UpdateSQLArinvtBreaks: TFDUpdateSQL;
    Panel14: TUniPanel;
    sbtnToggleHideArinvtBreaks: TUniSpeedButton;
    sbtnToggleHideAkaBreaks: TUniSpeedButton;
    Panel15: TUniPanel;
    EdCurrncy: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    PKCurrency: TIQWebHPick;
    PKCurrencyCURR_CODE: TStringField;
    QryArinvt_BreaksCURR_CODE: TStringField;
    Label7: TUniLabel;
    QryArinvt_BreaksCURRENCY_ID: TBCDField;
    QryArinvt_BreaksBUYING: TStringField;
    QryArinvtARINVT_GROUP_DESCRIP: TStringField;
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
    procedure pgctrlModeChange(Sender: TObject);
    procedure ApplyUpdate(DataSet: TDataSet);
    { TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryArinvt_BreaksBeforePost(DataSet: TDataSet);
    procedure QryAka_BreaksBeforePost(DataSet: TDataSet);
    procedure QryArinvt_BreaksNewRecord(DataSet: TDataSet);
    procedure QryAka_BreaksNewRecord(DataSet: TDataSet);
    procedure sbtnToggleHideArinvtBreaksClick(Sender: TObject);
    procedure QryArinvt_BreaksBeforeOpen(DataSet: TDataSet);
    procedure QryAka_BreaksBeforeOpen(DataSet: TDataSet);
    procedure GridArinvtCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure QryArinvt_BreaksUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryAka_BreaksUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryArinvt_BreaksFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sbtnSearchClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArcusto_ID: Real;
    Fincr:Real;
    FDate:TDateTime;
    FPrecision:Integer;
    FComment:String;
    FCurrencyId:Real;
    FCurrencyCode:String;

    procedure ProcessInventory;
    procedure ProcessPriceBreak;
    procedure AssignAdjustmentMode;
    function GetAdjustmentMode: TAdjMode;

    function GetInvPriceBreakDS: TFDQuery;
    { TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure SetId(const Value: Real);
    property InvPriceBreakDS: TFDQuery read GetInvPriceBreakDS;
    procedure SetCurrencyId(aCurrCode:String);
  public
    { Public declarations }
    property Id : Real write SetId;
  end;



procedure DoShowCustPriceBrks(AId:Real);

implementation

uses
  cust_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;



{$R *.DFM}

procedure DoShowCustPriceBrks(AId:Real);
var
  FrmCustPriceBrk: TFrmCustPriceBrk;
begin
  FrmCustPriceBrk := TFrmCustPriceBrk.Create(uniGUIApplication.UniApplication);
  FrmCustPriceBrk.Id := AId;
  FrmCustPriceBrk.Show();
end;

procedure TFrmCustPriceBrk.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustPriceBrk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative for IQSearch1.wwDbGrid }
  //IQRegFormWrite( self, [self, gridaka, gridarinvt, PnlLeft03, PnlLeft01, PnlLeft02, IQSearch1.wwDbGrid]);
end;

procedure TFrmCustPriceBrk.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCustPriceBrk.QryArinvtAfterScroll(DataSet: TDataSet);
begin
  if QryArinvtTYPE.asString = 'AKA' then
    pcBreaks.ActivePage := TabAka
  else
    pcBreaks.ActivePage := TabArinvt;

  pcBreaks.Visible := TRUE;
end;

procedure TFrmCustPriceBrk.BtnOkClick(Sender: TObject);
begin

  if not IqConfirmYN(cust_rscstr.cTXT0000042 {'Update prices?'}) then
     Exit;

  FComment:= edComment.text;

  if rbPercent.Checked then
  try
    FIncr := 1 + EdIn.Value/100;
  except
    raise exception.create(cust_rscstr.cTXT0000043);  // The Increment Percentage is invalid
  end;

  if rbFlatAmount.Checked then
     FIncr:= wwDBSpinEditFlatAmount.Value;

  { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative property for Date in TUniDateTimePicker}
  //FDate := Trunc(DTDate.Date);

  // 01-27-2011 Inventory pricing maint - allow effective date prior to today  SCR 1779
  // if Trunc(FDate) < Trunc(SelectValueAsFloat('select Trunc(sysdate) from dual')) then
  //   // 'Effective date cannot be earlier than today'
  //   raise exception.create(cust_rscstr.cTXT0000044);

  FPrecision := Trunc(EdPr.Value);
  if FPrecision < 0 then
    raise exception.create(cust_rscstr.cTXT0000045);  // 'Precision must not be negative'

  if FPrecision > 6 then
    raise exception.create(cust_rscstr.cTXT0000046);  // 'Precision must not be negative'

  ProcessInventory;
  IQInformation(cust_rscstr.cTXT0000047);             // 'Update completed.
end;

procedure TFrmCustPriceBrk.ProcessInventory;
var
  I:Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative for IQSearch1.wwDbGrid.SelectedList }
  {if IqSearch1.wwdbgrid.SelectedList.Count = 0 then
    raise exception.Create(cust_rscstr.cTXT0000048);  // 'Please select records.'

  with IqSearch1.wwdbgrid, IqSearch1.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[I]);
    ProcessPriceBreak;
  end; }
end;

procedure TFrmCustPriceBrk.ProcessPriceBreak;
var
  AQry:TFDQuery;
  APrice:Real;
  ATable, AField:String;
  APriceDate: TDateTime;

  procedure InsertPriceBreakBasedOn( ABreak_ID: Real; ATableName, AFieldName: string );
  var
    AExpr: string;
  begin
    if rbPercent.Checked then
       AExpr:= 'Round(qprice * %.6f, %d)'
    else if rbFlatAmount.Checked then
       AExpr:= 'Round(qprice + %.6f, %d)'
    else
       EXIT;

    if ATableName = 'ARINVT_BREAKS' then
      ExecuteCommandFmt('insert into %s (%s, quan, qprice, effect_date, price_date, comment1, currency_id) ' +
                ' select %s, quan, %s, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR HH24:MI''), ''%s'', currency_id from %s where id = %f',
                [ ATableName,
                  AFieldName,
                  AFieldName,
                  IQFormat( AExpr, [ FIncr, FPrecision ]),
                  FormatDateTime('mm/dd/yyyy', FDate),
                  FormatDateTime('mm/dd/yyyy hh:nn', APriceDate),
                  StrTran(FComment, '''', ''''''),
                  ATableName,
                 ABreak_ID ])
    else
      ExecuteCommandFmt('insert into %s (%s, quan, qprice, effect_date, price_date, comment1) ' +
                ' select %s, quan, %s, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR HH24:MI''), ''%s'' from %s where id = %f',
                [ ATableName,
                  AFieldName,
                  AFieldName,
                  IQFormat( AExpr, [ FIncr, FPrecision ]),
                  FormatDateTime('mm/dd/yyyy', FDate),
                  FormatDateTime('mm/dd/yyyy hh:nn', APriceDate),
                  StrTran(FComment, '''', ''''''),
                  ATableName,
                 ABreak_ID ]);

    ExecuteCommandFmt('update %s set deactive_date = To_Date(''%s'', ''MM/DD/RRRR'') where id = %f',
              [ ATableName,
                FormatDateTime('mm/dd/yyyy', FDate),
                ABreak_ID ]);

  end;

begin
  if QryArinvtTYPE.asString = 'AKA' then
  begin
    AQry := QryAka_Breaks;
    ATable := 'AKA_BREAKS';
    AField := 'AKA_ID';
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
    if Eof and Bof then Exit;
    while not eof do
    begin
      InsertPriceBreakBasedOn( FieldByName('ID').asFloat, ATable, AField );
      Next;
    end;
    AQry.Close;
    AQry.Open;
  end;
end;

procedure TFrmCustPriceBrk.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustPriceBrk.JumptoInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmCustPriceBrk.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmAR{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCustPriceBrk.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmCustPriceBrk.AdjustDisplay(Sender: TObject);
begin
  IQEnableControl( EdIn, rbPercent.Checked );
  IQEnableControl( wwDBSpinEditFlatAmount, rbFlatAmount.Checked );
end;

procedure TFrmCustPriceBrk.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  QryArinvt.ParamByName('AID').Value := FArcusto_ID;
  QryArinvt.ParamByName('pk_hide').Value := IIf( not sbtnToggleHide.Down, 1, 2 );
end;

procedure TFrmCustPriceBrk.sbtnToggleHideClick(Sender: TObject);
begin
  Reopen(QryArinvt)
end;

procedure TFrmCustPriceBrk.QryAka_BreaksNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('aka_id').asFloat:= QryArinvtAKA_ID.asFloat;
  DataSet.FieldByName('effect_date').asDateTime:= dtManualAdjDate.DateTime;
  DataSet.FieldByName('price_date').Clear;
  DataSet.FieldByName('deactive_date').Clear;
end;

procedure TFrmCustPriceBrk.QryAka_BreaksUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//  DB_DataModule.GenericUpdateRecord( DataSet, UpdateKind, UpdateAction );      {MainModule.pas}
end;

procedure TFrmCustPriceBrk.pgctrlModeChange(Sender: TObject);
begin
  AssignAdjustmentMode;
end;

{ TODO -oSanketG -cWebConvert : Parser should replace the component TNavigateBtn into suitable UniGUI component }
{procedure TFrmCustPriceBrk.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;}

procedure TFrmCustPriceBrk.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmCustPriceBrk.QryAka_BreaksBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'aka_breaks');
end;


procedure TFrmCustPriceBrk.QryArinvt_BreaksBeforePost(DataSet: TDataSet);
var
  ACurrencyId:Real;
begin
  IQAssignIDBeforePost( DataSet, 'arinvt_breaks');
  QryArinvt_BreaksARINVT_ID.asFloat := QryArinvtID.asFloat;
  QryArinvt_BreaksBUYING.asString := 'N';
  if Panel15.Visible then
  begin
    ACurrencyId := SelectValueFmtAsFloat('select min(id) from currency where curr_code = ''%s''', [FCurrencyCode]);
    if ACurrencyId <> 0 then
    begin
      QryArinvt_BreaksCURRENCY_ID.asFloat := ACurrencyId;
      QryArinvt_BreaksCURR_CODE.asString := FCurrencyCode;
    end;
  end;
end;

procedure TFrmCustPriceBrk.QryArinvt_BreaksNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('arinvt_id').asFloat:= QryArinvtID.asFloat;
  DataSet.FieldByName('effect_date').asDateTime:= dtManualAdjDate.DateTime;
  DataSet.FieldByName('price_date').Clear;
  DataSet.FieldByName('deactive_date').Clear;
end;

procedure TFrmCustPriceBrk.QryArinvt_BreaksUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//  DB_DataModule.GenericUpdateRecord( DataSet, UpdateKind, UpdateAction );      {MainModule.pas}
end;

function TFrmCustPriceBrk.GetInvPriceBreakDS: TFDQuery;
begin
  if QryArinvtTYPE.asString = 'AKA' then
     Result:= QryAka_Breaks
  else if QryArinvtTYPE.asString = 'ARINVT' then
     Result:= QryArinvt_Breaks
  else
     Result:= nil;
end;

function TFrmCustPriceBrk.GetAdjustmentMode: TAdjMode;
begin
  if pgctrlMode.ActivePage = tabIncrement then
     Result:= amIncrement
  else if pgctrlMode.ActivePage = tabManual then
     Result:= amManual
  else
     Result:= amNone
end;

procedure TFrmCustPriceBrk.AssignAdjustmentMode;
begin
  if Assigned( InvPriceBreakDS  ) then
     InvPriceBreakDS.Close;

  //QryAka_Breaks.CachedUpdates   := (GetAdjustmentMode = amManual) and SR.ReadWrite['QryAka_Breaks'];
  //QryArinvt_Breaks.CachedUpdates:= (GetAdjustmentMode = amManual) and SR.ReadWrite['QryArinvt_Breaks'];

  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative for TNavigateBtn buttons nbInsert, nbDelete, nbPost, nbCancel}
  {if GetAdjustmentMode = amManual then
     begin
        NavArinvt.VisibleButtons:= NavArinvt.VisibleButtons + [ nbInsert, nbDelete, nbPost, nbCancel ];
        NavAka.VisibleButtons   := NavAka.VisibleButtons    + [ nbInsert, nbDelete, nbPost, nbCancel ];
     end
  else
     begin
        NavArinvt.VisibleButtons:= NavArinvt.VisibleButtons - [ nbInsert, nbDelete, nbPost, nbCancel ];
        NavAka.VisibleButtons   := NavAka.VisibleButtons    - [ nbInsert, nbDelete, nbPost, nbCancel ];
     end;}

  if Assigned( InvPriceBreakDS  ) then
     Reopen( InvPriceBreakDS )
end;

procedure TFrmCustPriceBrk.QryArinvt_BreaksBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('hide_inactive').Value := IIf( not sbtnToggleHideArinvtBreaks.Down, 0, 1 );
end;

procedure TFrmCustPriceBrk.QryAka_BreaksBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('hide_inactive').Value := IIf( not sbtnToggleHideAkaBreaks.Down, 0, 1 );
end;

procedure TFrmCustPriceBrk.sbtnToggleHideArinvtBreaksClick(Sender: TObject);
begin
  Reopen(InvPriceBreakDS);
end;

procedure TFrmCustPriceBrk.GridArinvtCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  ASysDate: TDateTime;
begin
  ASysDate:= SelectValueAsFloat('select trunc(sysdate) from dual');

  if Highlight then
     EXIT;

  if not Assigned(InvPriceBreakDS) then
     EXIT;

  with InvPriceBreakDS do
  begin
    if ((Trunc(FieldByName('DEACTIVE_DATE').asDateTime) = 0)  or (Trunc(FieldByName('DEACTIVE_DATE').asDateTime) >= ASysDate )) and
       ((Trunc(FieldByName('EFFECT_DATE').asDateTime) = 0)  or (Trunc(FieldByName('EFFECT_DATE').asDateTime) <= ASysDate )) then
     begin
        aBrush.Color := clWhite;
        aFont.Color := clBlack;
     end
     else
     begin
       aBrush.Color:= clBtnFace;
       aFont.Color := clBlack;
     end;
  end;
end;

procedure TFrmCustPriceBrk.SetCurrencyId(aCurrCode:String);
begin
  if aCurrCode = '' then
    FCurrencyId := SelectValueAsFloat('select currency_id from iqsys where rownum < 2')
  else
  begin
    FCurrencyId := SelectValueFmtAsFloat('select min(id) from currency where curr_code = ''%s''', [aCurrCode]);
  end;
  FCurrencyCode := SelectValueFmtAsString('select curr_code from currency where id = %f', [FCurrencyId]);
  if FCurrencyCode = '' then
    FCurrencyCode := '***';
  EdCurrncy.ReadOnly := false;
  EdCurrncy.Text := FCurrencyCode;
  EdCurrncy.ReadOnly := true;
  QryArinvt_Breaks.Close;
  QryArinvt_Breaks.Open;
end;

procedure TFrmCustPriceBrk.SetId(const Value: Real);
begin
  FArcusto_ID := Value;
end;

procedure TFrmCustPriceBrk.UniFormCreate(Sender: TObject);
begin

  AdjustPageControlToParent(pcBreaks); // iqctrl
  AdjustDisplay(nil);

  { TODO -oSanketG -cWebConvert : Need to revisit after finding the alternative property for Date in TUniDateTimePicker}
  dtManualAdjDate.DateTime:= Date;
  dtDate.DateTime:= Date;

  { TODO -oSanketG -cWebConvert : Need to revisit after finding alternative for IQSearch1.wwDbGrid }
  //IQRegFormRead( self, [self, gridaka, gridarinvt, PnlLeft03, PnlLeft01, PnlLeft02, IQSearch1.wwDbGrid]);
end;

procedure TFrmCustPriceBrk.UniFormShow(Sender: TObject);
var
  Anative_curr:String;
begin
   if FArcusto_ID > 0 then
     Caption := Format(cust_rscstr.cTXT0000041 {'Customer (%s) price breaks'},  [ SelectValueFmtAsString('select RTrim(company) || '', '' || RTrim(custno) from arcusto where id = %f', [FArcusto_ID])]);

  QryArinvt.Close;
  QryArinvt.ParamByName('AID').Value := FArcusto_ID;

  IQSetTablesActive( TRUE, self );

  pgctrlMode.ActivePageIndex:= 0;
  pgctrlModeChange( nil );

  Panel15.Visible := SelectValueAsString('select NVL(multicurrency, ''N'') from iqsys where rownum < 2') = 'Y';

  FCurrencyId := 0;
  FCurrencyCode := '***';

  if Panel15.Visible then
  begin
    Anative_curr := SelectValueAsString('select native_curr from eplant where id = misc.geteplantid');
    SetCurrencyId(Anative_curr);
  end;

  if QryArinvt_Breaks.Filter <> '' then
    QryArinvt_Breaks.Filtered := Panel15.Visible;

end;

procedure TFrmCustPriceBrk.QryArinvt_BreaksFilterRecord(DataSet: TDataSet;  var Accept: Boolean);
var
  ACurrCode:String;
begin
  if Assigned(Panel15) and (not Panel15.Visible) or (FCurrencyCode = '***') then
  begin
    Accept := True;
  end
  else
  begin
    Accept := (QryArinvt_BreaksCURR_CODE.asString = FCurrencyCode);
//    ACurrCode := SelectValueFmtAsString('select c.curr_code ' +
//                 '  from currency c,    ' +
//                 '       ARINVT_BREAKS a ' +
//                 ' where a.currency_id = c.id' +
//                 '   and a.id = %f', [QryArinvt_BreaksID.asFloat]);
//    Accept := (ACurrCode = FCurrencyCode);
  end;
end;

procedure TFrmCustPriceBrk.sbtnSearchClick(Sender: TObject);
var
  ACurrCode:String;
begin
  with PKCurrency do
  if Execute then
  begin
    ACurrCode := GetValue('CURR_CODE');
    SetCurrencyId(ACurrCode);
  end;
end;



end.

