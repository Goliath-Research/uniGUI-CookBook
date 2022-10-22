unit qk_importer;

interface

uses
  Winapi.Windows,
  IQMS.Common.QuickAddBase,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.Controls,
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
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniPageControl, System.Classes, Vcl.Controls, Vcl.Forms;

type
  TQuickAddImporter = class(TQuickAddBase)
    SR: TIQWebSecurityRegister;
    PnlLeft: TUniPanel;
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
    Label9: TUniLabel;
    Label11: TUniLabel;
    Panel3: TUniPanel;
    sbtnLookupZipCode: TUniSpeedButton;
    PnlEditBoxes: TUniPanel;
    dbeImporter: TUniDBEdit;
    dbeAddr1: TUniDBEdit;
    dbeAddr2: TUniDBEdit;
    dbeAddr3: TUniDBEdit;
    dbeCity: TUniDBEdit;
    dbcState: TUniDBComboBox;
    dbeZip: TUniDBEdit;
    cbCountry: TUniDBComboBox;
    dbchkUSAmaskCustomer: TUniDBCheckBox;
    dbeTelephone: TUniDBEdit;
    dbeExt: TUniDBEdit;
    dbeFax: TUniDBEdit;
    dbeContact: TUniDBEdit;
    dbeAccount: TUniDBEdit;
    Label1: TUniLabel;
    Table1ID: TBCDField;
    Table1ATTN: TStringField;
    Table1ADDR1: TStringField;
    Table1ADDR2: TStringField;
    Table1ADDR3: TStringField;
    Table1CITY: TStringField;
    Table1STATE: TStringField;
    Table1COUNTRY: TStringField;
    Table1ZIP: TStringField;
    Table1PHONE_NUMBER: TStringField;
    Table1EXT: TStringField;
    Table1FAX: TStringField;
    Table1PRIME_CONTACT: TStringField;
    Table1NOTES: TStringField;
    Table1USE_USA_MASK: TStringField;
    Table1EPLANT_ID: TBCDField;
    Table1SHIP_TIME: TBCDField;
    Table1EIN: TStringField;
    Table1ACCOUNT_NUMBER: TStringField;
    dbeEIN: TUniDBEdit;
    Label14: TUniLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TQuickAddImporter.FormCreate(Sender: TObject);
begin
  inherited;
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TQuickAddImporter'
  CenterForm(Self); // IQMS.Common.Controls.pas }
end;

end.
