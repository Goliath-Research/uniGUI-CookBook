unit shipman_edit_third_party;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmShipmanThirdParty = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    tblThirdParty: TFDTable;
    tblThirdPartyID: TBCDField;
    tblThirdPartyATTN: TStringField;
    tblThirdPartyADDR1: TStringField;
    tblThirdPartyADDR2: TStringField;
    tblThirdPartyADDR3: TStringField;
    tblThirdPartyCITY: TStringField;
    tblThirdPartySTATE: TStringField;
    tblThirdPartyCOUNTRY: TStringField;
    tblThirdPartyZIP: TStringField;
    tblThirdPartyPHONE_NUMBER: TStringField;
    tblThirdPartyEXT: TStringField;
    tblThirdPartyFAX: TStringField;
    tblThirdPartyPRIME_CONTACT: TStringField;
    tblThirdPartyNOTES: TStringField;
    tblThirdPartyUSE_USA_MASK: TStringField;
    tblThirdPartyEPLANT_ID: TBCDField;
    tblThirdPartySHIP_TIME: TBCDField;
    tblThirdPartyACCOUNT_NUMBER: TStringField;
    srcThirdParty: TDataSource;
    PnlEditBoxes: TUniPanel;
    dbeThirdParty: TUniDBEdit;
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
    Panel4: TUniPanel;
    sbtnLookupZipCode: TUniSpeedButton;
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
    Panel5: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    PKThirdParty: TIQWebHPick;
    PKThirdPartyATTN: TStringField;
    PKThirdPartyADDR1: TStringField;
    PKThirdPartyADDR2: TStringField;
    PKThirdPartyEPLANT_ID: TBCDField;
    PKThirdPartyCITY: TStringField;
    PKThirdPartySTATE: TStringField;
    PKThirdPartyZIP: TStringField;
    PKThirdPartyCOUNTRY: TStringField;
    PKThirdPartyCOUNTRY_CODE: TStringField;
    PKThirdPartyID: TBCDField;
    PKThirdPartyADDR3: TStringField;
    PKThirdPartySHIP_TIME: TBCDField;
    PKThirdPartyPHONE_NUMBER: TStringField;
    PKThirdPartyEXT: TStringField;
    PKThirdPartyFAX: TStringField;
    PKThirdPartyPRIME_CONTACT: TStringField;
    PKThirdPartyACCOUNT_NUMBER: TStringField;
    sbtnSearch: TUniSpeedButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tblThirdPartyBeforePost(DataSet: TDataSet);
    procedure sbtnLookupZipCodeClick(Sender: TObject);
    procedure tblThirdPartyNewRecord(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
  private
    procedure SetID(const Value: Real);
    { Private declarations }
  public
    property ID : Real write SetID;
    { Public declarations }
  end;

  procedure DoEditThirdParty(AID: Real);

implementation

uses
  IQMS.Common.DataLib,
  zipcode,
  IQMS.Common.Miscellaneous;

{$R *.dfm}
procedure DoEditThirdParty(AID: Real);
var
  LFrmShipmanThirdParty : TFrmShipmanThirdParty;
begin
  LFrmShipmanThirdParty := TFrmShipmanThirdParty.Create(UniGUIApplication.UniApplication);
  LFrmShipmanThirdParty.Show;

end;

procedure TFrmShipmanThirdParty.btnOKClick(Sender: TObject);
begin
  if (tblThirdParty.State in [dsInsert, dsEdit]) then
    tblThirdParty.Post;
  Close;
end;

procedure TFrmShipmanThirdParty.btnCancelClick(Sender: TObject);
begin
  if (tblThirdParty.State in [dsInsert, dsEdit]) then
    tblThirdParty.Cancel;
  Close;
end;

procedure TFrmShipmanThirdParty.tblThirdPartyBeforePost(DataSet: TDataSet);
begin
  IQAssert(tblThirdPartyACCOUNT_NUMBER.AsString <> '', 'Account number required.');
end;

procedure TFrmShipmanThirdParty.tblThirdPartyNewRecord(DataSet: TDataSet);
begin
  // 04/04/2012
  tblThirdPartyID.AsFloat := GetNextID('THIRD_PARTY');
  CheckApplyUSAMask(tblThirdPartyUSE_USA_MASK);
end;

procedure TFrmShipmanThirdParty.sbtnLookupZipCodeClick(Sender: TObject);
begin
   if ( tblThirdParty.State in [ dsEdit, dsInsert ] ) then
      tblThirdParty.Post;
   tblThirdParty.Refresh; // prevents BDE locking violation
   // Select zip code from picklist for VENDOR record
   GetZipCodeDBLookup(tblThirdPartyCITY, tblThirdPartySTATE, tblThirdPartyZIP, tblThirdPartyCOUNTRY, TRUE, TRUE ); // zipcode.pas
   tblThirdParty.Refresh; // prevents BDE locking violation

end;

procedure TFrmShipmanThirdParty.sbtnSearchClick(Sender: TObject);
begin
  if (PkThirdParty.Execute) then
  begin
    tblThirdParty.Locate('ID', PkThirdParty.GetValue('ID'), []);
  end;
end;

procedure TFrmShipmanThirdParty.SetID(const Value: Real);
begin
  tblThirdParty.Open;
  tblThirdParty.Locate('ID', Value, []);
end;

end.
