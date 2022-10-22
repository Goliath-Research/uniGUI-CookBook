unit QPriceBreaks;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Mask,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  uniEdit, uniDBEdit, Vcl.Controls;

type
  TFrmQuotePriceBreaks = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel6: TUniPanel;
    Bevel3: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Panel1: TUniPanel;
    PnlLeft02: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    rbPercent: TUniRadioButton;
    rbFlatAmount: TUniRadioButton;
    Panel9: TUniPanel;
    EdPr: TUniDBNumberEdit;
    DTDate: TUniDateTimePicker;
    EdIn: TUniDBNumberEdit;
    wwDBSpinEditFlatAmount: TUniDBNumberEdit;
    PnlLeft03: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    QryQinvt: TFDQuery;
    SrcQinvt: TDataSource;
    QryQinvtID: TBCDField;
    QryQinvtITEMNO: TStringField;
    QryQinvtREV: TStringField;
    QryQinvtDESCRIP: TStringField;
    QryQinvtCLASS: TStringField;
    QryQinvtDESCRIP2: TStringField;
    Panel7: TUniPanel;
    Panel17: TUniPanel;
    Label4: TUniLabel;
    GridBreaks: TIQUniGridControl;
    SrcBreaks: TDataSource;
    QryBreaks: TFDQuery;
    QryBreaksQINVT_ID: TBCDField;
    QryBreaksQUAN: TBCDField;
    QryBreaksQPRICE: TFMTBCDField;
    QryBreaksPRICE_DATE: TDateTimeField;
    QryBreaksEFFECT_DATE: TDateTimeField;
    QryBreaksDEACTIVE_DATE: TDateTimeField;
    QryBreaksID: TBCDField;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    Fincr:Real;
    FDate:TDateTime;
    FPrecision:Integer;
    procedure ProcessInventory;
    procedure ProcessPriceBreak;
  public
    { Public declarations }
  end;

procedure DoQPriceBreaks(AId:Real);

implementation
{$R *.dfm}
uses
  cust_rscstr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;


procedure DoQPriceBreaks(AId:Real);
var
  LFrmQuotePriceBreaks : TFrmQuotePriceBreaks;
begin
  LFrmQuotePriceBreaks := TFrmQuotePriceBreaks.Create(UniGUIApplication.UniApplication);
  LFrmQuotePriceBreaks.QryQinvt.Locate('ID', AId, []);
  LFrmQuotePriceBreaks.Show;
end;

procedure TFrmQuotePriceBreaks.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  DTDate.Datetime := Date;
  IQRegFormRead( self, [self, PnlLeft03, GridBreaks]);
end;

procedure TFrmQuotePriceBreaks.BtnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmQuotePriceBreaks.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmQuotePriceBreaks.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmQuotePriceBreaks.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQuotePriceBreaks.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmQuotePriceBreaks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLeft03, GridBreaks]);
end;

procedure TFrmQuotePriceBreaks.BtnOkClick(Sender: TObject);
begin
  if not IqConfirmYN(cust_rscstr.cTXT0000042 {'Update prices?'}) then
     Exit;

  if rbPercent.Checked then
  try
    FIncr := 1 + EdIn.Value/100;
  except
    raise exception.create(cust_rscstr.cTXT0000043);  // The Increment Percentage is invalid
  end;

  if rbFlatAmount.Checked then
     FIncr:= wwDBSpinEditFlatAmount.Value;
  FDate := Trunc(DTDate.Datetime);

  FPrecision := Trunc(EdPr.Value);
  if FPrecision < 0 then
    raise exception.create(cust_rscstr.cTXT0000045);  // 'Precision must not be negative'

  if FPrecision > 6 then
    raise exception.create(cust_rscstr.cTXT0000046);  // 'Precision must not be negative'

  ProcessInventory;

  IQInformation(cust_rscstr.cTXT0000047);             // 'Update completed.

end;

procedure TFrmQuotePriceBreaks.ProcessInventory;
var
  I:Integer;
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwdbgrid
  if IqSearch1.wwdbgrid.SelectedList.Count = 0 then
    raise exception.Create(cust_rscstr.cTXT0000048);  // 'Please select records.'

  with IqSearch1.wwdbgrid, IqSearch1.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[I]);
    ProcessPriceBreak;
  end;   }
end;

procedure TFrmQuotePriceBreaks.ProcessPriceBreak;
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

    ExecuteCommandFmt('insert into %s (%s, quan, qprice, effect_date, price_date) ' +
              ' select %s, quan, %s, To_Date(''%s'', ''MM/DD/RRRR''), To_Date(''%s'', ''MM/DD/RRRR HH24:MI'') from %s where id = %f',
              [ ATableName,
                AFieldName,
                AFieldName,
                IQFormat( AExpr, [ FIncr, FPrecision ]),
                FormatDateTime('mm/dd/yyyy', FDate),
                FormatDateTime('mm/dd/yyyy hh:nn', APriceDate),
                ATableName,
                ABreak_ID ]);

    ExecuteCommandFmt('update %s set deactive_date = To_Date(''%s'', ''MM/DD/RRRR'') where id = %f',
              [ ATableName,
                FormatDateTime('mm/dd/yyyy', FDate),
                ABreak_ID ]);

  end;

begin
  AQry := QryBreaks;
  ATable := 'QINVT_QTY_BREAKS';
  AField := 'QINVT_ID';

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

end.
