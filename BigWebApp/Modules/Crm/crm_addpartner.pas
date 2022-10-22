unit crm_addpartner;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  IQMS.Common.QuickAddBase,
  Data.DB,
  Vcl.Buttons,
  Vcl.Menus,
  MaskUtils,
  MainModule,
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
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniPageControl, System.Classes, Vcl.Controls;

type
  TQuickAddPartner = class(TQuickAddBase)
    Table1ID: TBCDField;
    Table1PARTNERNO: TStringField;
    Table1PARTNER_GROUP: TStringField;
    Table1COMPANY: TStringField;
    Table1PRIME_CONTACT: TStringField;
    Table1ADDR1: TStringField;
    Table1ADDR2: TStringField;
    Table1ADDR3: TStringField;
    Table1CITY: TStringField;
    Table1STATE: TStringField;
    Table1ZIP: TStringField;
    Table1COUNTRY: TStringField;
    Table1PHONE_NUMBER: TStringField;
    Table1EXT: TStringField;
    Table1FAX_NUMBER: TStringField;
    Table1WEB_SITE_URL: TStringField;
    Table1INDUSTRY: TStringField;
    Table1CREATED: TDateTimeField;
    Table1USE_USA_MASK: TStringField;
    PZipCode: TUniPopupMenu;
    SelectZipCode1: TUniMenuItem;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
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
    Splitter1: TUniSplitter;
    Label9: TUniLabel;
    edtPartnerNo: TUniDBEdit;
    edComp: TUniDBEdit;
    edAddr1: TUniDBEdit;
    edAddr2: TUniDBEdit;
    edAddr3: TUniDBEdit;
    edCity: TUniDBEdit;
    cmbState: TUniDBComboBox;
    edZip: TUniDBEdit;
    edPhone: TUniDBEdit;
    edFax: TUniDBEdit;
    edContact: TUniDBEdit;
    sbtnLookupZipCode: TUniSpeedButton;
    cmbCountry: TUniDBComboBox;
    chkUseUSAMask: TUniDBCheckBox;
    procedure sbtnLookupZipCodeClick(Sender: TObject);
    procedure SelectZipCode1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbStateDropDown(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cmbCountryChange(Sender: TObject);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}


uses
  crm_activity_dblib,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Regional,
  zipcode;

procedure TQuickAddPartner.FormCreate(Sender: TObject);
begin
  inherited;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient01);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlClient01);
  IQMS.Common.Regional.LoadCountries(cmbCountry);
  cmbCountryChange(cmbCountry);
end;

procedure TQuickAddPartner.FormShow(Sender: TObject);
begin
  inherited;

  IQRegFormRead(Self, [Self, PnlLeft01]); // IQMS.Common.RegFrm.pas
end;

procedure TQuickAddPartner.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead(Self, [Self, PnlLeft01]); // IQMS.Common.RegFrm.pas
  inherited;
  Action := caFree;
end;

procedure TQuickAddPartner.sbtnLookupZipCodeClick(Sender: TObject);
var
  ACity, AState, ACountry: String;
begin
  if zipcode.GetZipCodeLookup(edZip.Text, { var } ACity, AState, ACountry) then
    begin
      if not (Table1.State in [dsEdit, dsInsert]) then
        Table1.Edit;
      Table1CITY.AsString := ACity;
      Table1STATE.AsString := AState;
      Table1COUNTRY.AsString := ACountry;
    end;
end;

procedure TQuickAddPartner.SelectZipCode1Click(Sender: TObject);
begin
  SelectZipCodeDB(Table1CITY, Table1STATE,
    Table1ZIP, Table1COUNTRY, FALSE); // zipcode.pas
end;

procedure TQuickAddPartner.Table1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if (Trim(Table1PARTNERNO.AsString) = '') then
    begin
      if Self.Visible and edtPartnerNo.Visible and edtPartnerNo.CanFocus then
        edtPartnerNo.SetFocus;
      // crm_rscstr.cTXT0000611 =
      // 'The Partner Number field is required.  Please enter a unique Partner Number.'
      raise Exception.Create(crm_rscstr.cTXT0000611);
    end;

  // Validation
  crm_activity_dblib.CheckUniquePartnerNumber(Table1PARTNERNO.AsString,
    Table1ID.AsFloat);

end;

procedure TQuickAddPartner.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  if (Table1.State in [dsBrowse]) then
    IQMS.Common.Regional.LoadStateCombo(cmbState, cmbCountry);
end;

procedure TQuickAddPartner.DoGetTelephoneText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString,
    Table1USE_USA_MASK.AsString = 'Y'); // pas
end;

procedure TQuickAddPartner.cmbCountryChange(Sender: TObject);
begin
  inherited;
  IQMS.Common.Regional.LoadStateCombo(cmbState, cmbCountry);
end;

procedure TQuickAddPartner.cmbStateDropDown(Sender: TObject);
begin
  // inherited; // nothing
  // IQMS.Common.Regional.LoadStateCombo(cmbState,cmbCountry);
end;

end.
