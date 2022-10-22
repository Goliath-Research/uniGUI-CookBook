unit crm_addcustomer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.QuickAddBase,
  Data.DB,
  MaskUtils,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniPageControl, System.Classes;

type
  TFrmCrmAddCustomer = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1TER_ID: TBCDField;
    Table1CUSTNO: TStringField;
    Table1CUST_GROUP: TStringField;
    Table1COMPANY: TStringField;
    Table1ADDR1: TStringField;
    Table1ADDR2: TStringField;
    Table1ADDR3: TStringField;
    Table1CITY: TStringField;
    Table1STATE: TStringField;
    Table1COUNTRY: TStringField;
    Table1ZIP: TStringField;
    Table1PHONE_NUMBER: TStringField;
    Table1EXT: TStringField;
    Table1FAX_NUMBER: TStringField;
    Table1PRIME_CONTACT: TStringField;
    Table1CUST_SINCE: TDateTimeField;
    Table1YTD_SALES: TBCDField;
    Table1TERRITORY: TStringField;
    Table1INDUSTRY: TStringField;
    Table1FINANCE_CHARGE: TStringField;
    Table1TERMS_ID: TBCDField;
    Table1CREDIT_LIMIT: TBCDField;
    Table1STATUS_ID: TStringField;
    Table1STATUS_DATE: TDateTimeField;
    Table1STATEMENTS: TStringField;
    Table1CUSER1: TStringField;
    Table1CUSER2: TStringField;
    Table1CUSER3: TStringField;
    Table1NUSER1: TFMTBCDField;
    Table1NUSER2: TFMTBCDField;
    Table1NUSER3: TFMTBCDField;
    Table1COMM_PCNT: TFMTBCDField;
    Table1SOURCE: TStringField;
    Table1TAX_CODES_ID: TBCDField;
    Table1SALESPEOPLE_ID: TBCDField;
    Table1NOTE: TStringField;
    Table1DISCOUNT: TBCDField;
    Table1ECODE: TStringField;
    Table1EID: TBCDField;
    Table1EDATE_TIME: TDateTimeField;
    Table1ECOPY: TStringField;
    Table1CUST_TYPE_ID: TBCDField;
    Table1CUSER4: TStringField;
    Table1CUSER5: TStringField;
    Table1CUSER6: TStringField;
    Table1NUSER4: TFMTBCDField;
    Table1NUSER5: TFMTBCDField;
    Table1CURRENCY_ID: TBCDField;
    Table1AUTOINVOICE_TECHNIQUE: TStringField;
    Table1PS_DATE_ON_INVOICE: TStringField;
    Table1COMMISSIONS_ID: TBCDField;
    Table1GLYEAR_ID: TBCDField;
    Table1HIGHEST_BAL_BUCKET: TBCDField;
    Table1USE_USA_MASK: TStringField;
    Table1STATEMENT_DATE: TBCDField;
    Table1LAST_FINANCE_CHARGE_DATE: TDateTimeField;
    Table1MIN_CHANGE_INTERVAL: TBCDField;
    Table1ALERTMSG: TStringField;
    Table1CRM_PROSPECT: TStringField;
    sbtnCustomerCreditCards: TUniSpeedButton;
    PZipCode: TUniPopupMenu;
    SelectZipCode1: TUniMenuItem;
    ScrollBox1: TUniScrollBox;
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft: TUniPanel;
    Label14: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    Label1: TUniLabel;
    Label11: TUniLabel;
    Label9: TUniLabel;
    PnlClient: TUniPanel;
    Panel3: TUniPanel;
    sbtnLookupZipCode: TUniSpeedButton;
    PnlEditCtrls: TUniPanel;
    dbeCustno: TUniDBEdit;
    dbeCompany: TUniDBEdit;
    dbeAddr1: TUniDBEdit;
    dbeAddr2: TUniDBEdit;
    dbeAddr3: TUniDBEdit;
    dbeCity: TUniDBEdit;
    cmbState: TUniDBComboBox;
    dbeZip: TUniDBEdit;
    cmbCountry: TUniDBComboBox;
    dbchkUSAmaskCustomer: TUniDBCheckBox;
    dbeTelephone: TUniDBEdit;
    dbeExt: TUniDBEdit;
    dbeFax: TUniDBEdit;
    dbeContact: TUniDBEdit;
    cmbStatus: TUniDBComboBox;
    chkQuickCopy: TUniCheckBox;
    Bevel1: TUniPanel;
    Table1PRIME_CONTACT_EMAIL: TStringField;
    lblPrimeContactEmail: TUniLabel;
    dbePrimeContactEmail: TUniEdit;
    SR: TIQWebSecurityRegister;
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnCustomerCreditCardsClick(Sender: TObject);
    procedure sbtnLookupZipCodeClick(Sender: TObject);
    procedure SelectZipCode1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure cmbCountryChange(Sender: TObject);
    procedure dbePrimeContactEmailCustomDlg(Sender: TObject);
    procedure dbePrimeContactEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
  private
    { Private declarations }
    procedure QuickCopyShipToBillTo;
    procedure CheckUniqueCustomerNumber;
    procedure AdjustControls;
    procedure CheckSecurityCanEdit(const ASilent: Boolean = False);
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.EmailUtils,
  iqcc,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Regional,
  zipcode;

procedure TFrmCrmAddCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  AdjustControls;
  IQMS.Common.Regional.LoadCountries(cmbCountry);
  cmbCountryChange(cmbCountry);
end;

procedure TFrmCrmAddCustomer.FormShow(Sender: TObject);
begin
  inherited;
  IQRegFormRead(Self, [Self, PnlLeft]);
end;

procedure TFrmCrmAddCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.Controls.ClearComboBoxOfObjects(cmbState);
  IQMS.Common.Controls.ClearComboBoxOfObjects(cmbCountry);
  IQRegFormWrite(Self, [Self, PnlLeft]);
  inherited;
  Action := caFree;
end;

procedure TFrmCrmAddCustomer.Table1NewRecord(DataSet: TDataSet);
begin
  inherited;
  with DataSet as TFDTable do
    begin
      FieldByName('ID').AsFloat := GetNextID('ARCUSTO');
      FieldByName('CUSTNO').AsString := NextCustomerNumber;
      FieldByName('STATUS_ID').AsString := 'Active';
      FieldByName('CRM_PROSPECT').AsString := 'Y';
      FieldByName('STATUS_DATE').AsDateTime := IQOracleAdjustedDate;
      FieldByName('CUST_SINCE').AsDateTime := IQOracleAdjustedDate;
    end;

end;

procedure TFrmCrmAddCustomer.DoGetTelephoneText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString,
    Table1USE_USA_MASK.AsString = 'Y'); // pas
end;

procedure TFrmCrmAddCustomer.Table1BeforePost(DataSet: TDataSet);
begin
  // Check ability to post insert to customer record.
  CheckSecurityCanEdit;

  inherited;

  // Customer Number entered?
  if (Table1CUSTNO.AsString = '') then
    // 'The Customer Number field is required.  Please enter a unique Customer Number.'
    raise Exception.Create(crm_rscstr.cTXT0000623);

  // Customer Number is unique?
  CheckUniqueCustomerNumber;

  // Ensure state code is valid
  IQMS.Common.Regional.CheckClearStateCode(Table1STATE, cmbState);
end;

procedure TFrmCrmAddCustomer.CheckUniqueCustomerNumber;
begin
  // Customer Number is unique?
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM arcusto WHERE TRIM(custno)= TRIM(''%s'') AND id <> %d',
    [FixStr(Table1CUSTNO.AsString), Table1ID.AsLargeInt]) = 1 then
    begin
      ModalResult := mrNone;
      // 'The Customer Number you entered is already used.  Please enter a different Customer Number.'
      raise Exception.Create(crm_rscstr.cTXT0000624);
    end;
end;

procedure TFrmCrmAddCustomer.btnOKClick(Sender: TObject);
begin
  CheckSecurityCanEdit;

  CheckUniqueCustomerNumber;

  if chkQuickCopy.Checked then
    begin
      if Table1.State in [dsEdit, dsInsert] then
        Table1.Post;
      QuickCopyShipToBillTo;
    end;

  inherited;

end;

procedure TFrmCrmAddCustomer.QuickCopyShipToBillTo;
var
  AArcustoID: Real;
begin
  AArcustoID := Table1ID.AsFloat;
  if AArcustoID = 0 then
    // 'Could not create default "Ship To" and "Bill To" addresses.  Could not find customer ID.'
    raise Exception.Create(crm_rscstr.cTXT0001132);
  CreateShipTo(AArcustoID, FALSE); // iqlib
  CreateBillTo(AArcustoID, FALSE); // iqlib
end;

procedure TFrmCrmAddCustomer.CheckSecurityCanEdit(const ASilent: Boolean = False);
begin
  if not SR.Enabled['btnOk'] or
    not SR.Visible['btnOk'] then
    begin
      if not ASilent then
        // crm_rscstr.cTXT0001952 = 'Access denied.  Cannot add customer.';
        raise Exception.Create(crm_rscstr.cTXT0001952)
      else
        System.SysUtils.Abort;
    end;
end;

procedure TFrmCrmAddCustomer.sbtnCustomerCreditCardsClick(Sender: TObject);
begin
  // Check ability to post insert to customer record.
  CheckSecurityCanEdit;

  with Table1 do
    begin
      if (State in [dsInsert, dsEdit]) then
        Post;

      iqcc.CC_DoShowCustCreditCards(Table1ID.AsFloat); // iqcc.pas
    end;
end;

procedure TFrmCrmAddCustomer.sbtnLookupZipCodeClick(Sender: TObject);
begin
  // Check ability to post insert to customer record.
  CheckSecurityCanEdit;

  if (Table1.State in [dsEdit, dsInsert]) then
    Table1.Post;

  GetZipCodeDBLookup(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY, TRUE,
    FALSE); // zipcode.pas
end;

procedure TFrmCrmAddCustomer.SelectZipCode1Click(Sender: TObject);
begin
  // Check ability to post insert to customer record.
  CheckSecurityCanEdit;

  SelectZipCodeDB(Table1CITY, Table1STATE,
    Table1ZIP, Table1COUNTRY, FALSE); // zipcode.pas
end;

procedure TFrmCrmAddCustomer.SRAfterApply(Sender: TObject);
begin
  // inherited; // nothing

  // There is no point in enable the following if the user cannot
  // edit the data.
  IQMS.Common.Controls.IQEnableControl([SelectZipCode1, sbtnLookupZipCode,
    sbtnCustomerCreditCards], SR.Enabled['btnOk'] and SR.Visible['btnOk'],
    SR);
//  dbePrimeContactEmail.ShowButton := SR.Enabled['dbePrimeContactEmail'] and
//    SR.Enabled['btnOk'] and SR.Visible['btnOk'];
end;

procedure TFrmCrmAddCustomer.AdjustControls;
begin
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlEditCtrls);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditCtrls);
//  ScrollBox1.VertScrollBar.Position := 0;
end;

procedure TFrmCrmAddCustomer.cmbCountryChange(Sender: TObject);
begin
  inherited;
  IQMS.Common.Regional.LoadStateCombo(cmbState, cmbCountry);
end;

procedure TFrmCrmAddCustomer.dbePrimeContactEmailClick(Sender: TObject);
begin
  CheckSecurityCanEdit(True);
  IQMS.Common.EmailUtils.DoEMailClick(Sender);
end;

procedure TFrmCrmAddCustomer.dbePrimeContactEmailCustomDlg(Sender: TObject);
begin
  CheckSecurityCanEdit;
  IQMS.Common.EmailUtils.PromptAssignEmailField(Table1PRIME_CONTACT_EMAIL);
end;

procedure TFrmCrmAddCustomer.Table1AfterPost(DataSet: TDataSet);
begin
  inherited;
  // 11/02/2010 Prevent error, "Couldn't perform the edit because another user changed the record."
  Table1.Refresh;
end;

end.
