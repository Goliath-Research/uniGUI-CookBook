unit shipman_edit_importer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniCheckBox,
  uniDBCheckBox,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniBitBtn,
  uniSpeedButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmShipmanEditImporter = class(TUniForm)
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
    Label1: TUniLabel;
    Label14: TUniLabel;
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
    dbeEIN: TUniDBEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    tblImporter: TFDTable;
    tblImporterID: TBCDField;
    tblImporterATTN: TStringField;
    tblImporterADDR1: TStringField;
    tblImporterADDR2: TStringField;
    tblImporterADDR3: TStringField;
    tblImporterCITY: TStringField;
    tblImporterSTATE: TStringField;
    tblImporterCOUNTRY: TStringField;
    tblImporterZIP: TStringField;
    tblImporterPHONE_NUMBER: TStringField;
    tblImporterEXT: TStringField;
    tblImporterFAX: TStringField;
    tblImporterPRIME_CONTACT: TStringField;
    tblImporterNOTES: TStringField;
    tblImporterUSE_USA_MASK: TStringField;
    tblImporterEPLANT_ID: TBCDField;
    tblImporterSHIP_TIME: TBCDField;
    tblImporterEIN: TStringField;
    tblImporterACCOUNT_NUMBER: TStringField;
    srcImporter: TDataSource;
    Panel4: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tblImporterBeforePost(DataSet: TDataSet);
    procedure sbtnLookupZipCodeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetAID(AID:Real);
  public
    property ID: Real write SetAID;
    { Public declarations }
  end;

  procedure DoEditImporter( AID: Real);

implementation
uses
  IQMS.Common.Miscellaneous,
  zipcode;

{$R *.dfm}
procedure DoEditImporter(AID: Real);

var
  FrmShipmanEditImporter : TFrmShipmanEditImporter;
begin
  FrmShipmanEditImporter := TFrmShipmanEditImporter.Create(uniGUIApplication.UniApplication);
  with FrmShipmanEditImporter do
   begin
      ID:=AID;
      Show;
   end;
end;

procedure TFrmShipmanEditImporter.btnOKClick(Sender: TObject);
begin
  if (tblImporter.State in [dsInsert, dsEdit]) then
    tblImporter.Post;
  Close;
end;

procedure TFrmShipmanEditImporter.btnCancelClick(Sender: TObject);
begin
  if (tblImporter.State in [dsInsert, dsEdit]) then
    tblImporter.Cancel;
  Close;
end;

procedure TFrmShipmanEditImporter.tblImporterBeforePost(DataSet: TDataSet);
begin
  IQAssert(tblImporterACCOUNT_NUMBER.AsString <> '', 'Account number required.');
end;

procedure TFrmShipmanEditImporter.sbtnLookupZipCodeClick(Sender: TObject);
begin
   if ( tblImporter.State in [ dsEdit, dsInsert ] ) then
      tblImporter.Post;
   tblImporter.Refresh; // prevents BDE locking violation
   // Select zip code from picklist for VENDOR record
   GetZipCodeDBLookup(tblImporterCITY, tblImporterSTATE, tblImporterZIP, tblImporterCOUNTRY, TRUE, TRUE ); // zipcode.pas
   tblImporter.Refresh; // prevents BDE locking violation
end;

procedure TFrmShipmanEditImporter.SetAID(AID: Real);
begin
  tblImporter.Open;
  tblImporter.Locate('ID', AID, []);
end;

end.
