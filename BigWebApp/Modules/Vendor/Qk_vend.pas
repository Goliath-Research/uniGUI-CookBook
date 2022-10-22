unit Qk_vend;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.QuickAddBase,
  Data.DB,
  Vcl.Buttons,
  Vcl.Menus,
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
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, uniPageControl,
  System.Classes;

type
  TQuickAddVendor = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1VENDORNO: TStringField;
    Table1COMPANY: TStringField;
    Table1ATTN: TStringField;
    Table1ADDR1: TStringField;
    Table1ADDR2: TStringField;
    Table1ADDR3: TStringField;
    Table1CITY: TStringField;
    Table1STATE: TStringField;
    Table1COUNTRY: TStringField;
    Table1ZIP: TStringField;
    Table1PHONE_NUMBER: TStringField;
    Table1FAX_NUMBER: TStringField;
    Table1CREDIT_LIMIT: TBCDField;
    Table1TERMS_ID: TBCDField;
    Table1YTD_PURCHASES: TBCDField;
    Table1FED_TAX_ID: TStringField;
    Table1CUSER1: TStringField;
    Table1CUSER2: TStringField;
    Table1CUSER3: TStringField;
    Table1NUSER1: TFMTBCDField;
    Table1NUSER2: TFMTBCDField;
    Table1GL_ACCT: TStringField;
    Table1TAXRATE: TFMTBCDField;
    Table1QA_RATING: TStringField;
    Table1VEN_RATING: TStringField;
    Table1GLACCT_ID_EXP: TBCDField;
    Table1PRIME_CONTACT: TStringField;
    Table1STATUS_ID: TStringField;
    Table1E_MAIL_ADDR: TStringField;
    PZipCode: TUniPopupMenu;
    SelectZipCode1: TUniMenuItem;
    ScrollBox1: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
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
    PnlClient02: TUniPanel;
    PnlRightButtons: TUniPanel;
    sbtnSelectZipCode: TUniSpeedButton;
    PnlEditCtrls: TUniPanel;
    edVendNo: TUniDBEdit;
    edComp: TUniDBEdit;
    edAddr1: TUniDBEdit;
    edAddr2: TUniDBEdit;
    edAddr3: TUniDBEdit;
    edCity: TUniDBEdit;
    edZip: TUniDBEdit;
    edCountry: TUniDBComboBox;
    edPhone: TUniDBEdit;
    edFax: TUniDBEdit;
    edContact: TUniDBEdit;
    dbcStatus: TUniDBComboBox;
    Bevel1: TUniPanel;
    edState: TUniDBComboBox;
    Table1USE_USA_MASK: TStringField;
    chkUseUSAMask: TUniDBCheckBox;
    Label91: TUniLabel;
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure SelectZipCode1Click(Sender: TObject);
    procedure sbtnSelectZipCodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure PnlEditCtrlsResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edCountryChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckMask;
    procedure CheckUniqueVendorNumber;
    { TODO : 'AdjustControls'  is not to be converted }
    //procedure AdjustControls;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}


uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Regional,
  vendor_rscstr,
  zipcode;

procedure TQuickAddVendor.FormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
  { TODO : 'AdjustControls'  is not to be converted }
  //AdjustControls;
  IQMS.Common.Regional.LoadCountries(edCountry);
end;

procedure TQuickAddVendor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TQuickAddVendor.Table1NewRecord(DataSet: TDataSet);
begin
  inherited; // nothing
  DataSet.FieldByName('VENDORNO').AsString := NextVendorNumber;
  DataSet.FieldByName('Status_ID').AsString := 'Active';
end;

procedure TQuickAddVendor.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if Showing then
    CheckMask;
end;

procedure TQuickAddVendor.DoGetTelephoneText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString,
    Table1USE_USA_MASK.AsString = 'Y'); // pas
end;

procedure TQuickAddVendor.CheckMask;
begin
  try
    DataSource1.OnDataChange := nil;
    with edPhone.DataSource.DataSet do
      if (Trim(UpperCase(edCountry.Text)) = 'USA') or
        (Trim(UpperCase(edCountry.Text)) = 'CANADA') or
        (Trim(UpperCase(edCountry.Text)) = '') then
        begin
          FieldByName('PHONE_NUMBER').EditMask := '!999-000-0000;1;';
          FieldByName('FAX_NUMBER').EditMask := '!999-000-0000;1;';
        end
      else
        begin
          FieldByName('PHONE_NUMBER').EditMask := '';
          FieldByName('FAX_NUMBER').EditMask := '';
        end;
  finally
    DataSource1.OnDataChange := DataSource1DataChange;
  end;
end;

procedure TQuickAddVendor.Table1AfterPost(DataSet: TDataSet);
begin
  ExecuteCommandFmt(
    'insert into remit_to (                 '#13 +
    '       vendor_id,                      '#13 +
    '       attn,                           '#13 +
    '       addr1,                          '#13 +
    '       addr2,                          '#13 +
    '       addr3,                          '#13 +
    '       city,                           '#13 +
    '       state,                          '#13 +
    '       zip,                            '#13 +
    '       country,                        '#13 +
    '       phone_number,                   '#13 +
    '       fax_number)                     '#13 +
    ' select id,                            '#13 +
    '        company,                       '#13 +
    '        addr1,                         '#13 +
    '        addr2,                         '#13 +
    '        addr3,                         '#13 +
    '        city,                          '#13 +
    '        state,                         '#13 +
    '        zip,                           '#13 +
    '        country,                       '#13 +
    '        phone_number,                  '#13 +
    '        fax_number                     '#13 +
    '   from vendor                         '#13 +
    '  where id = %d                        ',
    [Table1.FieldByName('ID').AsLargeInt]);
end;

procedure TQuickAddVendor.SelectZipCode1Click(Sender: TObject);
begin
  if (Table1.State in [dsEdit, dsInsert]) then
    Table1.Post;
  Table1.Refresh; // prevents BDE locking violation
  SelectZipCodeDB(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY);
  // zipcode.pas

  // GetZipCodeDBLookup(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY, TRUE, TRUE ); // zipcode.pas
  Table1.Refresh; // prevents BDE locking violation

  // Lookup VENDOR zipcode
  // GetZipCodeDBLookup(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY, TRUE, FALSE ); // zipcode.pas
end;

procedure TQuickAddVendor.sbtnSelectZipCodeClick(Sender: TObject);
begin
  if (Table1.State in [dsEdit, dsInsert]) then
    Table1.Post;
  Table1.Refresh; // prevents BDE locking violation
  // Select zip code from picklist for VENDOR record
  GetZipCodeDBLookup(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY, TRUE,
    TRUE); // zipcode.pas
  Table1.Refresh; // prevents BDE locking violation
end;

procedure TQuickAddVendor.CheckUniqueVendorNumber;
begin
  // Vendor Number is unique?
  if IsFoundParam(
    'SELECT id FROM vendor WHERE TRIM(vendorno)= TRIM(:VENDORNO) AND id <> :ID',
    ['VENDORNO;STRING', 'ID;INT64'],
    [Table1VENDORNO.AsString, Table1ID.AsLargeInt]) then
    begin
      ModalResult := mrNone;
      // 'The Vendor Number you entered is already used.  Please enter a different Vendor Number.'
      raise Exception.Create(vendor_rscstr.cTXT0000016);
    end;
end;

procedure TQuickAddVendor.Table1BeforePost(DataSet: TDataSet);
begin
  CheckUniqueVendorNumber;
  inherited;
end;

{ TODO : 'AdjustControls'  is not to be converted }
{procedure TQuickAddVendor.AdjustControls;
var
  i, w: Integer;
begin
  w := PnlEditCtrls.ClientWidth - 2;
  for i := 0 to PnlEditCtrls.ControlCount - 1 do
    if (PnlEditCtrls.Controls[i].Align in [alRight]) then
      with PnlEditCtrls.Controls[i] do
        Width := w;

  ScrollBox1.VertScrollBar.Position := 0;
end;     }

procedure TQuickAddVendor.PnlEditCtrlsResize(Sender: TObject);
begin
  AdjustControlsWidthBasedOnParent(PnlEditCtrls,
    [edVendNo, edComp, edAddr1, edAddr2, edAddr3, edCity, edState, edZip,
    edCountry,
    edPhone, edFax, edContact, dbcStatus],
    4);
end;

procedure TQuickAddVendor.FormShow(Sender: TObject);
begin
  inherited;
  PnlEditCtrlsResize(nil);
end;

procedure TQuickAddVendor.edCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(edState, edCountry);
end;

end.
