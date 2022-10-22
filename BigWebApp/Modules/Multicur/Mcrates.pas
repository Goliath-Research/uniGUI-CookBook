unit MCRates;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Menus,
  Vcl.Buttons,
  Mask,
  Wwtable,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  Vcl.Wwquery,
  IQMS.WebVcl.Search,
  wwcheckbox,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmMCrates = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Print1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    SrcCurrency: TDataSource;
    tblCurrency: TFDTable;
    SrcCurrPost: TDataSource;
    sbSearch: TUniSpeedButton;
    sbToggle: TUniSpeedButton;
    tblCurrencyID: TBCDField;
    tblCurrencyCURR_CODE: TStringField;
    tblCurrencyDESCRIP: TStringField;
    tblCurrencyGLVALUE: TStringField;
    tblCurrencySPOT_RATE: TFMTBCDField;
    tblCurrencyCURR_SYMBOL: TStringField;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;                      
    PrinterSetupDialog1: TPrinterSetupDialog;
    Print2: TUniMenuItem;
    PrinterSetUp1: TUniMenuItem;
    About1: TUniMenuItem;
    PKCurrency: TIQWebHPick;
    PKCurrencyID: TBCDField;
    PKCurrencyCURR_CODE: TStringField;
    PKCurrencyDESCRIP: TStringField;
    PKCurrencySPOT_RATE: TFMTBCDField;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    Toggle1: TUniMenuItem;
    N2: TUniMenuItem;
    New1: TUniMenuItem;
    Contents1: TUniMenuItem;
    tblCurrencyNATIVE_CURR: TStringField;
    PKCurrencyNATIVE_CURR: TStringField;
    PopupMenu1: TUniPopupMenu;
    Trace1: TUniMenuItem;
    QryCurrPost: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryCurrPostID: TBCDField;
    QryCurrPostCURRENCY_ID: TBCDField;
    QryCurrPostBALSHEET_RATE: TFMTBCDField;
    QryCurrPostGLPERIODS_ID: TBCDField;
    QryCurrPostGLPERIOD: TBCDField;
    QryCurrPostSTART_DATE: TDateTimeField;
    QryCurrPostEND_DATE: TDateTimeField;
    tblCurrencyUSE_DAILY_RATE: TStringField;
    Options1: TUniMenuItem;
    SpotRateHistory1: TUniMenuItem;
    N3: TUniMenuItem;
    SpotRateHistory2: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    PnlCurrencyPcCarrier: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    sbCurrency: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label4: TUniLabel;
    Label3: TUniLabel;
    Label6: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    PnlClient02: TUniPanel;
    cbCurrCodeForm: TUniDBComboBox;
    edDescrip: TUniDBEdit;
    dbCurSymbol: TUniDBEdit;
    edSpotRate: TUniDBEdit;
    eGlValue: TUniDBEdit;
    wwNative: TUniDBComboBox;
    wwCheckBox1: TUniCheckBox;
    tabGrid: TUniTabSheet;
    gridCurrency: TIQUniGridControl;
    cbCurCodeGrid: TUniDBComboBox;
    cbNatCurCodeGrid: TUniDBComboBox;
    PC2: TUniPageControl;
    TabRate: TUniTabSheet;
    TabLang: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    wwDBPeriod: TUniEdit;
    Panel4: TUniPanel;
    IQSearch2: TIQUniGridControl;
    Panel5: TUniPanel;
    SrcLang: TDataSource;
    QryLang: TFDQuery;
    UpdateSQL2: TFDUpdateSQL;
    QryLangID: TBCDField;
    wwDBLang: TUniDBComboBox;
    QryLangCURRENCY_ID: TBCDField;
    QryLangLANGUAGE_CODE: TStringField;
    QryLangDESCRIP: TStringField;
    N4: TUniMenuItem;
    Initializemulticurrency1: TUniMenuItem;
    procedure sbToggleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblCurrencyBeforePost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure Print2Click(Sender: TObject);
    procedure PrinterSetUp1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure cbCurrCodeFormCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure cbCurrCodeFormEnter(Sender: TObject);
    procedure sbSearchClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure PKCurrencyIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure Trace1Click(Sender: TObject);
    procedure QryCurrPostBeforeEdit(DataSet: TDataSet);
    procedure QryCurrPostBeforePost(DataSet: TDataSet);
    procedure wwDBPeriodCustomDlg(Sender: TObject);
    { TODO -oBantuK -cWEB_CONVERT : A separate Navigation bar is not required as UniDBGrid has its own.
    procedure navCurrPostBeforeAction(Sender: TObject;
      Button: TNavigateBtn);}
    procedure SpotRateHistory1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryLangBeforeEdit(DataSet: TDataSet);
    procedure QryLangBeforePost(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : A separate Navigation bar is not required as UniDBGrid has its own.
    procedure DBNavLangBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure Initializemulticurrency1Click(Sender: TObject);
    procedure QryLangNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FCode:String;
  public
    { Public declarations }
  end;

procedure DoMultiCurrencyModal;
procedure DoMultiCurrency;

implementation

{$R *.DFM}

uses
  IQMS.Common.Period,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  //WEB_CONVERT IQSecIns,
  IQMS.Common.StringUtils,
  IQMS.Common.McRscstr,
  MCSpotRateHist,
  IQMS.Common.TRBase;

procedure DoMultiCurrency;
begin
  with TFrmMCrates.Create(UniGuiApplication.UniApplication) do Show;
end;

procedure DoMultiCurrencyModal;
begin
//  if SelectValueAsString('select FX_SEGMENT_NAME from iqsys') = '' then
//    raise Exception.Create('No G/L Account Structure Foreign Currency Segment Name assigned'#13 +
//                           'Pleace use Setup to assign.');
  with TFrmMCrates.Create(UniGuiApplication.UniApplication) do
    ShowModal;
end;

procedure TFrmMCrates.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel1, gridCurrency]);
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
end;

procedure TFrmMCrates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1, gridCurrency]);
end;

procedure TFrmMCrates.sbToggleClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(PC);

{12/02/2008 Remmed these lines (Byron).  Each time the button is clicked,
 the form moves.  It is more efficient to use the IQCTRL method above.}
{
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    IQRegFormWrite( self, [self, Panel1, gridCurrency]);
    gridCurrency.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    gridCurrency.DataSource  := SrcCurrency;
    PC.ActivePage := TabGrid;
    IQRegFormRead( self, [self, Panel1, gridCurrency]);
  end; }
end;

procedure TFrmMCrates.tblCurrencyBeforePost(DataSet: TDataSet);
begin
  with tblCurrency do
  begin
    if Trim(FieldByName('CURR_CODE').asString) = '' then
       // 'Please enter a valid currency code.'
       raise Exception.Create(cTXT0000004);

    if SelectValueFmtAsFloat('select count(id) from currency where curr_code =  ''%s'' and native_curr = ''%s'' and id <> %f',
       [Trim(tblCurrencyCURR_CODE.asString),
        Trim(tblCurrencyNATIVE_CURR.asString),
        tblCurrencyID.asFloat]) <> 0 then
        raise Exception.Create(cTXT0000015);


    if FieldByName('SPOT_RATE').asFloat < 0.000001 then
       // 'Please enter a spot rate.'
       raise Exception.Create(cTXT0000005);

    if (SelectValueAsString('select multicurrency from iqsys') = 'Y') and
       (SelectValueAsFloat('select currency_id from iqsys') = FieldByName('ID').asFloat) and
       (FieldByName('SPOT_RATE').asFloat <> 1) then
       {'This currency has been selected as your native currency in
         System Parameters, under Regional Settings.  The spot rate
         for your native currency must be a value of 1.'#13#13 +
        'If you wish to change the spote rate to a value other than 1,
         you must first select a different native currency in System
         Parameters.'}
        raise Exception.Create(cTXT0000006);
  end;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmMCrates.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMCrates.Print2Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmMCrates.PrinterSetUp1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmMCrates.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmMCrates.cbCurrCodeFormCloseUp(Sender: TUniDBComboBox; Select: Boolean);
begin
  with tblCurrency do
  begin
    if not(State in [dsEdit, dsInsert]) then
       Edit;

    FieldByName('DESCRIP').asString := Copy(TUniDBComboBox(Sender).Text, 1, Pos('(', TUniDBComboBox(Sender).Text) - 1);
    if FieldByName('DESCRIP').asString <> FCode then
       FieldByName('CURR_SYMBOL').asString := '';
  end;
//    if (Trim(FieldByName('DESCRIP').asString) = '') and (Trim(TwwDBComboBox(Sender).Text) <> '') then
end;

procedure TFrmMCrates.cbCurrCodeFormEnter(Sender: TObject);
begin
  FCode := tblCurrency.FieldByName('DESCRIP').asString;
end;

procedure TFrmMCrates.sbSearchClick(Sender: TObject);
begin
  with PKCurrency do
  if Execute then
    TblCurrency.Locate('ID', GetValue('ID'), [])
  else Abort;
end;

procedure TFrmMCrates.New1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : A separate Navigation bar is not required as UniDBGrid has its own.
  navCurrency.BtnClick(nbInsert);}
end;

procedure TFrmMCrates.PKCurrencyIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmMCrates.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmAcct{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmMCrates.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1120008 );
end;

procedure TFrmMCrates.Trace1Click(Sender: TObject);
begin
  DoShowTrace('CURRENCY', tblCurrencyID.asFloat );     {IQMS.Common.TRBase.pas}
end;

procedure TFrmMCrates.QryCurrPostBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmMCrates.QryCurrPostBeforePost(DataSet: TDataSet);
begin
  with tblCurrency do
  begin
    if tblCurrencyID.asFloat = 0 then
       // 'Please create a currency record before attempting to add details.'
      raise Exception.Create(cTXT0000007);

    if Trim(FieldByName('CURR_CODE').asString) = '' then
       // 'Please enter a valid currency code.'
       raise Exception.Create(cTXT0000004);

    if FieldByName('SPOT_RATE').asFloat < 0.000001 then
       // 'Please enter a spot rate.'
       raise Exception.Create(cTXT0000005);

    if (SelectValueAsString('select multicurrency from iqsys') = 'Y') and
       (SelectValueAsFloat('select currency_id from iqsys') = FieldByName('ID').asFloat) and
       (FieldByName('SPOT_RATE').asFloat <> 1) then
       {'This currency has been selected as your native currency in
         System Parameters, under Regional Settings.  The spot rate
         for your native currency must be a value of 1.'#13#13 +
        'If you wish to change the spote rate to a value other than 1,
         you must first select a different native currency in System
         Parameters.'}
        raise Exception.Create(cTXT0000006);
  end;

  if QryCurrPost.State in [ dsInsert ] then
    QryCurrPostID.asFloat := GetNextID('CURRENCYPOST');

  QryCurrPostCURRENCY_ID.asFloat := tblCurrencyID.asFloat;

end;



procedure TFrmMCrates.wwDBPeriodCustomDlg(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod;   {in IQMS.Common.Period.pas}
  if AId <> 0 then
  begin
    if not (QryCurrPost.State in [dsEdit, dsInsert]) then QryCurrPost.Edit;
    with TFDQuery.Create(self) do
    try
      QryCurrPostEND_DATE.ReadOnly := False;
      QryCurrPostSTART_DATE.ReadOnly := False;

      Connection := UniMainModule.FDConnection1;
      Sql.Add(IqFormat('select period, start_date, end_date from glperiods where id = %f', [AId]));
      Open;
      QryCurrPostGLPERIODS_ID.asFloat  := AId;
      QryCurrPostGLPERIOD.asFloat      := FieldByName('period').asFloat;
      QryCurrPostEND_DATE.asDateTime   := FieldByName('end_date').asDateTime;
      QryCurrPostSTART_DATE.asDateTime := FieldByName('start_date').asDateTime;
    finally
      QryCurrPostEND_DATE.ReadOnly := True;
      QryCurrPostSTART_DATE.ReadOnly := True;
      Free;
    end;
  end;

end;

{ TODO -oBantuK -cWEB_CONVERT : A separate Navigation bar is not required as UniDBGrid has its own.
procedure TFrmMCrates.navCurrPostBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId :Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryCurrPostID.asFloat;
    QryCurrPost.Close;
    QryCurrPost.Open;
    QryCurrPost.Locate('ID', AId, []);
    Abort;
  end;
end;}

procedure TFrmMCrates.SpotRateHistory1Click(Sender: TObject);
begin
  tblCurrency.CheckBrowseMode;
  if tblCurrencyID.asFloat = 0 then Exit;
  DoHistSpotRate; {in MCSpotRateHist.pas}
end;

procedure TFrmMCrates.FormShow(Sender: TObject);
begin
  IQSetTablesActive( True, self);
  //gridCurrency.DataSource:= NIL;
  PC.ActivePage := TabForm;
  PC2.ActivePage := TabRate;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add('select * from glacct_def where group_name = (select FX_SEGMENT_NAME from iqsys)');
    Open;
    tblCurrency.FieldByName('glvalue').editmask := Format('%s;1; ', [Repl('0', FieldByName('group_length').asInteger)]);
  finally
    Free;
  end;
  try
    sbSearchClick(NIL);      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
     // System.SysUtils.ABORT;
    end;
  end;

  wwDBPeriod.Parent  := IqSearch1.DBGrid;
  wwDBPeriod.Visible := False;

  wwDBLang.Parent  := IqSearch2.DBGrid;
  wwDBLang.Visible := False;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'EditControlOptions'
  IqSearch1.DBGrid.EditControlOptions := [ecoDisableDateTimePicker, ecoSearchOwnerForm];}

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'EnsureSecurityInspectorOnTopOf'
  EnsureSecurityInspectorOnTopOf( self );}
end;

procedure TFrmMCrates.QryLangBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmMCrates.QryLangBeforePost(DataSet: TDataSet);
begin
  with tblCurrency do
  begin
    if tblCurrencyID.asFloat = 0 then
       // 'Please create a currency record before attempting to add details.'
      raise Exception.Create(cTXT0000007);

    if Trim(FieldByName('CURR_CODE').asString) = '' then
       // 'Please enter a valid currency code.'
       raise Exception.Create(cTXT0000004);

    if FieldByName('SPOT_RATE').asFloat < 0.000001 then
       // 'Please enter a spot rate.'
       raise Exception.Create(cTXT0000005);

  end;

  if QryLangID.asFloat = 0 then
    QryLangID.asFloat := GetNextID('CURRENCY_LANGUAGE');

  QryLangCURRENCY_ID.asFloat := tblCurrencyID.asFloat;


end;

procedure TFrmMCrates.QryLangNewRecord(DataSet: TDataSet);
begin
    ClearFieldValues(DataSet);
end;

{ TODO -oBantuK -cWEB_CONVERT : A separate Navigation bar is not required as UniDBGrid has its own.
procedure TFrmMCrates.DBNavLangBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId :Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryLangID.asFloat;
    QryLang.Close;
    QryLang.Open;
    QryLang.Locate('ID', AId, []);
    Abort;
  end;
end;}

procedure TFrmMCrates.Initializemulticurrency1Click(Sender: TObject);
var
  AQry:TFDQuery;
  ACount:Real;
begin
  if not IqConfirmYN(cTXT0000012) then exit;
  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.Sql.Add('select TABLE_NAME from all_tab_columns ' +
                 ' where column_name = ''CURRENCY_ID''   ' +
                 '  and table_name not like ''V_%''      ' +
                 '  and table_name not like ''C_%''      ' +
                 '  and table_name <> ''IQSYS''          ' +
                 '  and data_type = ''NUMBER'' ');
    AQry.Open;
    while not AQry.Eof do
    begin
      ACount := SelectValueFmtAsFloat('select count(*) from %s where currency_id is not null', [AQry.FieldByName('TABLE_NAME').asString]);
      if ACount <> 0 then Break;
      AQry.Next;
    end;
  finally
    AQry.Free;
  end;

  if ACount <> 0 then
    if not IqConfirmYN(cTXT0000013) then exit;

  ExecuteCommand('begin UPDATE_CURRENCY_ID.populate_currency; end;');

  IQInformation( cTXT0000014 );
end;



end.






