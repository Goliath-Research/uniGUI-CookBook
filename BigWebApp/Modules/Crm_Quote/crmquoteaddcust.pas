unit crmquoteaddcust;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Qk_Cust,
  Data.DB,
  FireDAC.Comp.DataSet,
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
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  System.Classes,
  Vcl.wwdblook,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox, uniMainMenu, uniDBLookupComboBox, uniEdit, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBCheckBox, uniDBEdit, uniLabel, uniSplitter,
  uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniSpeedButton, uniPanel;

type
  TFrmCRMQuoteAddCustomer = class(TQuickAddCustomer)
    chkQuickCopy: TUniCheckBox;
    Table1CRM_PROSPECT: TStringField;
    Table1CUST_SINCE: TDateTimeField;
    Table1STATUS_DATE: TDateTimeField;
    procedure btnOKClick(Sender: TObject);
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  FrmCRMQuoteAddCustomer: TFrmCRMQuoteAddCustomer;}

implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dates,
  IQMS.Common.StringUtils;

procedure TFrmCRMQuoteAddCustomer.btnOKClick(Sender: TObject);
begin
  if chkQuickCopy.Checked then
  begin
    if (Table1.State in [dsEdit, dsInsert]) then
      Table1.Post;

    if Table1ID.AsLargeInt = 0 then
      // 'Could not create default "Ship To" and "Bill To" addresses.  Could not find customer ID.'
      raise Exception.Create(crm_rscstr.cTXT0001132);
    CreateShipTo(Table1ID.AsFloat, FALSE); // crmshare
    CreateBillTo(Table1ID.AsFloat, FALSE); // crmshare
  end;

  inherited;

end;

procedure TFrmCRMQuoteAddCustomer.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;

  with DataSet do
  begin
    FieldByName('ID').AsLargeInt := GetNextID('ARCUSTO');
    FieldByName('STATUS_ID').AsString := 'Quote'; // hard-code into database
    FieldByName('CRM_PROSPECT').AsString := 'Y';
    FieldByName('STATUS_DATE').AsDateTime := IQOracleAdjustedDate;
    FieldByName('CUST_SINCE').AsDateTime := IQOracleAdjustedDate;
  end;

end;

procedure TFrmCRMQuoteAddCustomer.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;

  // Customer Number entered?
  if (Table1CUSTNO.AsString = '') then
    // 'The Customer Number field is required.  Please enter a unique Customer Number.'
    raise Exception.Create(crm_rscstr.cTXT0000623);

  // Customer Number is unique?
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM arcusto WHERE TRIM(UPPER(custno)) = TRIM(UPPER(''%s'')) AND id <> %d',
    [FixStr(Table1CUSTNO.AsString), Table1ID.AsLargeInt]) = 1 then
    // 'The Customer Number you entered is already used.  Please enter a different Customer Number.'
    raise Exception.Create(crm_rscstr.cTXT0000624);

end;

end.
