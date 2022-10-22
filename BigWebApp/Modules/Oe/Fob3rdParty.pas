unit Fob3rdParty;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFobThirdParty = class(TUniForm)
    SrcFob: TDataSource;
    PnlToolbar: TUniPanel;
    Panel4: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Grid: TIQUniGridControl;
    PnlFormView: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label36: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    Label39: TUniLabel;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label56: TUniLabel;
    Label42: TUniLabel;
    PnlClient02: TUniPanel;
    dbeShipCompany: TUniDBEdit;
    dbeShipAddr1: TUniDBEdit;
    dbeShipAddr2: TUniDBEdit;
    dbeShipAddr3: TUniDBEdit;
    dbeShipCity: TUniDBEdit;
    dbcShipState: TUniDBComboBox;
    dbeShipCountry: TUniDBComboBox;
    dbeShipZIP: TUniDBEdit;
    PnlClient03: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label57: TUniLabel;
    Label58: TUniLabel;
    Label59: TUniLabel;
    Label65: TUniLabel;
    PnlClient04: TUniPanel;
    dbchkUSAmaskShipTo: TUniDBCheckBox;
    dbeShipPhone: TUniDBEdit;
    dbeShipFax: TUniDBEdit;
    dbeShipToExtension: TUniDBEdit;
    dbeShipContact: TUniDBEdit;
    Nav: TUniDBNavigator;
    SBSearch: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryFOB: TFDQuery;
    QryFOBATTN: TStringField;
    QryFOBADDR1: TStringField;
    QryFOBADDR2: TStringField;
    QryFOBADDR3: TStringField;
    QryFOBCITY: TStringField;
    QryFOBSTATE: TStringField;
    QryFOBCOUNTRY: TStringField;
    QryFOBZIP: TStringField;
    QryFOBPHONE_NUMBER: TStringField;
    QryFOBEXT: TStringField;
    QryFOBFAX: TStringField;
    QryFOBPRIME_CONTACT: TStringField;
    QryFOBID: TBCDField;
    QryFOBUSE_USA_MASK: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    PkThirdParty: TIQWebHPick;
    PkThirdPartyID: TBCDField;
    PkThirdPartyATTN: TStringField;
    PkThirdPartyADDR1: TStringField;
    PkThirdPartyADDR2: TStringField;
    PkThirdPartyADDR3: TStringField;
    PkThirdPartyCITY: TStringField;
    PkThirdPartySTATE: TStringField;
    PkThirdPartyCOUNTRY: TStringField;
    PkThirdPartyZIP: TStringField;
    PkThirdPartyPHONE_NUMBER: TStringField;
    PkThirdPartyEXT: TStringField;
    PkThirdPartyFAX: TStringField;
    PkThirdPartyPRIME_CONTACT: TStringField;
    New1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeShipCountryChange(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryFOBBeforePost(DataSet: TDataSet);
    procedure SBGridViewClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TUniDBNavigator does not contain a member named BtnClick
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    procedure PkThirdPartyIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QryFOBNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshQryFOB;
  public
    { Public declarations }
  end;

procedure Do3rdPartyBilling();

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Regional;

procedure Do3rdPartyBilling();
var
  LFrmFobThirdParty : TFrmFobThirdParty;
begin
    LFrmFobThirdParty := TFrmFobThirdParty.Create(UniGUIApplication.UniApplication);
    LFrmFobThirdParty.ShowModal;
end;

procedure TFrmFobThirdParty.UniFormCreate(Sender: TObject);
begin
  inherited;
  New1.Visible := false;
  PC.ActivePage := TabForm;
  QryFOB.Open;
  IQMS.Common.Regional.LoadCountries(dbeShipCountry);
  dbeShipCountryChange(dbeShipCountry);
  try
    SBSearchClick(NIL); // activate search speed button
  except
    on E: EAbort do
      begin
        //PostMessage(Handle, wm_Command, Exit1.Command, 0); { Call "Exit" }
        // System.SysUtils.ABORT;
      end;
  end;
end;

procedure TFrmFobThirdParty.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, Grid]);
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
end;

procedure TFrmFobThirdParty.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Grid]);
end;

procedure TFrmFobThirdParty.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFobThirdParty.dbeShipCountryChange(Sender: TObject);
begin
  IQMS.Common.Regional.LoadStateCombo(dbcShipState, dbeShipCountry);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmFobThirdParty.NavBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    begin
      RefreshQryFOB;
      Abort;
    end;
end;   }

procedure TFrmFobThirdParty.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFobThirdParty.New1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TUniDBNavigator does not contain a member named BtnClick
  Nav.BtnClick(nbInsert);  }
end;

procedure TFrmFobThirdParty.QryFOBBeforePost(DataSet: TDataSet);
begin
  if QryFOBID.asFloat = 0 then
    QryFOBID.asFloat := GetNextID('FOB_THIRD_PARTY');
end;

procedure TFrmFobThirdParty.QryFOBNewRecord(DataSet: TDataSet);
begin
  CheckApplyUSAMask(QryFOBUSE_USA_MASK);
end;

procedure TFrmFobThirdParty.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) then
    begin
      PC.ActivePage := TabForm;
    end
  else
    begin
      PC.ActivePage := TabGrid;
    end;
end;

procedure TFrmFobThirdParty.SBSearchClick(Sender: TObject);
var
  aId: Real;
begin
  with PkThirdParty do
    if Execute then
      begin
        aId := GetValue('ID');
        QryFOB.Locate('ID', aId, []);
      end
    else
      Abort;
end;

procedure TFrmFobThirdParty.RefreshQryFOB;
var
  aId: Real;
begin
  aId := QryFOBID.asFloat;
  QryFOB.Close;
  QryFOB.Open;
  QryFOB.Locate('ID', aId, []);
end;

procedure TFrmFobThirdParty.PkThirdPartyIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  PostMessage(Handle, wm_Command, New1.Command, 0);
end;

procedure TFrmFobThirdParty.DoGetTelephoneText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := FormatTelephoneText(Sender.AsString,
    QryFOBUSE_USA_MASK.AsString = 'Y');
end;

end.
