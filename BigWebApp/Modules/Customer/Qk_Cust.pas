unit Qk_Cust;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQMS.Common.QuickAddBase,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwdblook,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  MainModule,
  _CountryLookupDataModule,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox, uniPageControl;

type
  TQuickAddCustomer = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1CUSTNO: TStringField;
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
    Table1STATUS_ID: TStringField;
    Table1USE_USA_MASK: TStringField;
    SR: TIQWebSecurityRegister;
    sbtnCustomerCreditCards: TUniSpeedButton;
    PZipCode: TUniPopupMenu;
    SelectZipCode1: TUniMenuItem;
    ScrollBox1: TUniScrollBox;
    PnlDisplay: TUniPanel;
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
    Label9: TUniLabel;
    Label11: TUniLabel;
    PnlClient: TUniPanel;
    Panel3: TUniPanel;
    sbtnLookupZipCode: TUniSpeedButton;
    PnlEditBoxes: TUniPanel;
    dbeCompany: TUniDBEdit;
    dbeAddr1: TUniDBEdit;
    dbeAddr2: TUniDBEdit;
    dbeAddr3: TUniDBEdit;
    dbeCity: TUniDBEdit;
    dbeZip: TUniDBEdit;
    dbchkUSAmaskCustomer: TUniDBCheckBox;
    dbeTelephone: TUniDBEdit;
    dbeExt: TUniDBEdit;
    dbeFax: TUniDBEdit;
    dbeContact: TUniDBEdit;
    dbcStatus: TUniDBComboBox;
    DBCustno: TUniDBEdit;
    Table1PRIME_CONTACT_EMAIL: TStringField;
    lblPrimeContactEmail: TUniLabel;
    dbePrimeContactEmail: TUniEdit;
    cbCountry: TUniDBLookupComboBox;
    Table1COUNTRY_ID: TBCDField;
    Table1STATE_ID: TBCDField;
    dbcState: TUniDBLookupComboBox;
    procedure Table1NewRecord(DataSet: TDataSet);
    procedure sbtnCustomerCreditCardsClick(Sender: TObject);
    procedure SelectZipCode1Click(Sender: TObject);
    procedure sbtnLookupZipCodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbePrimeContactEmailCustomDlg(Sender: TObject);
    procedure dbePrimeContactEmailClick(Sender: TObject);
    procedure cbCountryBeforeDropDown(Sender: TObject);
    procedure cbCountryCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
  private
    { Private declarations }
    procedure SetDefaultStatusID(const Value: string);
    function GetDefaultStatusID: string;
  protected
    DMLOCALE_Arcusto: TCountryLookupDataModule;
  public
    { Public declarations }
    property DefaultStatusID: string read GetDefaultStatusID write SetDefaultStatusID;
  end;

implementation

{$R *.DFM}


uses
  UniGuiApplication,
  IQMS.Common.EmailUtils,
  iqcc,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Regional.ControlUtils,
  IQMS.Common.RegFrm,
  zipcode;

procedure TQuickAddCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  { TODO -oBantuK -cWEB_CONVERT : Incompatible types: 'TForm' and 'TQuickAddCustomer'
  CenterForm(Self);} // IQMS.Common.Controls.pas
  IQRegFormRead(Self, [PnlLeft]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditBoxes);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlEditBoxes);

  DMLOCALE_Arcusto := TCountryLookupDataModule.Create(Self);
  DMLOCALE_Arcusto.Name := '';
end;

procedure TQuickAddCustomer.Table1NewRecord(DataSet: TDataSet);
begin
  inherited; { nothing }
  DataSet.FieldByName('CUSTNO').AsString := NextCustomerNumber;
  DataSet.FieldByName('Status_ID').AsString := DefaultStatusID;
end;

procedure TQuickAddCustomer.sbtnCustomerCreditCardsClick(Sender: TObject);
begin
  inherited; { nothing }

  with Table1 do
  begin
    if State in [dsInsert, dsEdit] then
      Post;
    // pass ARCUSTO_ID
    iqcc.CC_DoShowCustCreditCards(Table1ID.AsFloat); // iqcc
  end;
end;

procedure TQuickAddCustomer.SelectZipCode1Click(Sender: TObject);
begin
  // Select zip code from picklist for ARCUSTO record
  SelectZipCodeDB(Table1CITY, Table1STATE,
    Table1ZIP, Table1COUNTRY, FALSE); // zipcode.pas
end;

function TQuickAddCustomer.GetDefaultStatusID: string;
begin
  if dbcStatus.Text = '' then
    Result := dbcStatus.Items.Strings[0] // 'Active'
  else
    Result := dbcStatus.Text;
end;

procedure TQuickAddCustomer.SetDefaultStatusID(const Value: string);
var
  AStatusID: string;
begin
  AStatusID := Value;
  if AStatusID = '' then
    AStatusID := dbcStatus.Items.Strings[0]; // 'Active'
  if (dbcStatus.Text <> AStatusID) then
  begin
    if (dbcStatus.Items.IndexOf(AStatusID) = - 1) then
      dbcStatus.Items.Add(AStatusID);
    if not (Table1.State in [dsEdit, dsInsert]) then
      Table1.Edit;
    dbcStatus.ItemIndex := dbcStatus.Items.IndexOf(AStatusID);
    Table1STATUS_ID.AsString := dbcStatus.Text;
  end;
end;

procedure TQuickAddCustomer.sbtnLookupZipCodeClick(Sender: TObject);
begin
  if (Table1.State in [dsEdit, dsInsert]) then
    Table1.Post;
  Table1.Refresh; // prevents BDE locking violation
  GetZipCodeDBLookup(Table1CITY, Table1STATE, Table1ZIP, Table1COUNTRY, TRUE, TRUE); // zipcode.pas
  Table1.Refresh; // prevents BDE locking violation
end;

procedure TQuickAddCustomer.dbePrimeContactEmailClick(Sender: TObject);
begin
  IQMS.Common.EmailUtils.DoEMailClick(Sender);
end;

procedure TQuickAddCustomer.dbePrimeContactEmailCustomDlg(Sender: TObject);
begin
  IQMS.Common.EmailUtils.PromptAssignEmailField(Table1PRIME_CONTACT_EMAIL);
end;

procedure TQuickAddCustomer.DoGetTelephoneText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, Table1USE_USA_MASK.AsString = 'Y'); // pas
end;

procedure TQuickAddCustomer.cbCountryBeforeDropDown(Sender: TObject);
begin
  // 08/15/2016 (Byron, EIQ-9872 Convert Country and State Lists to Oracle Tables)
  IQMS.Regional.ControlUtils.FilterInactive(Sender as TUniDBLookupComboBox, TRUE);
end;

procedure TQuickAddCustomer.cbCountryCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  // 08/15/2016 (Byron, EIQ-9872 Convert Country and State Lists to Oracle Tables)
  IQMS.Regional.ControlUtils.FilterInactive(Sender as TUniDBLookupComboBox, FALSE);

  // Ensure the COUNTRY_ID is applied to the dataset so that
  // filtering by STATE can occur.
  FillTable.FieldByName('COUNTRY_ID').Value :=
    LookupTable.FieldByName('ID').Value;

  if Assigned(DMLOCALE_Arcusto) then
    DMLOCALE_Arcusto.SyncLookupDataSets(
      Table1COUNTRY_ID.AsLargeInt,
      Table1STATE_ID.AsLargeInt);
end;

end.
