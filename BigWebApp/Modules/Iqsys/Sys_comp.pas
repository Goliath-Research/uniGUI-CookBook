unit Sys_comp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Hpick,
  Data.DB,
  Mask,
  Vcl.DBGrids,
  Vcl.Buttons,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmEditCompany = class(TUniForm)
    Panel8: TUniPanel;
    SBGridView: TUniSpeedButton;
    SBSearchPurch: TUniSpeedButton;
    NavCompany: TUniDBNavigator;
    PCShipTo: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label42: TUniLabel;
    Label43: TUniLabel;
    Label44: TUniLabel;
    Label45: TUniLabel;
    Label46: TUniLabel;
    Label47: TUniLabel;
    Label50: TUniLabel;
    Label51: TUniLabel;
    Label52: TUniLabel;
    DBShipComp: TUniDBEdit;
    DBShipAddr1: TUniDBEdit;
    DBShipAddr2: TUniDBEdit;
    DBShipCity: TUniDBEdit;
    DBShipZip: TUniDBEdit;
    DBShipPhone: TUniDBEdit;
    DBShipFax: TUniDBEdit;
    DBShipState: TUniDBEdit;
    DBShipEMail: TUniDBEdit;
    DBShipInternet: TUniDBEdit;
    DBShipCountry: TUniDBComboBox;
    SrcCompany: TDataSource;
    TblCompany: TFDTable;
    TblCompanyID: TBCDField;
    TblCompanyCOMPANY: TStringField;
    TblCompanyADDRESS1: TStringField;
    TblCompanyADDRESS2: TStringField;
    TblCompanyCITY: TStringField;
    TblCompanySTATE: TStringField;
    TblCompanyZIP: TStringField;
    TblCompanyCOUNTRY: TStringField;
    TblCompanyPHONE: TStringField;
    TblCompanyFAX: TStringField;
    TblCompanyEMAIL: TStringField;
    TblCompanyINTERNET: TStringField;
    PKShipTo: TIQWebHPick;
    PKShipToID: TBCDField;
    PKShipToCOMPANY: TStringField;
    PKShipToADDRESS1: TStringField;
    PKShipToADDRESS2: TStringField;
    PKShipToCITY: TStringField;
    PKShipToSTATE: TStringField;
    PKShipToZIP: TStringField;
    PKShipToCOUNTRY: TStringField;
    PKShipToPHONE: TStringField;
    PKShipToFAX: TStringField;
    PKShipToEMAIL: TStringField;
    PKShipToINTERNET: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    IQUserDefLabel1: TIQWebUserDefLabel;
    DBCode: TUniDBEdit;
    TblCompanyADDRESS3: TStringField;
    TblCompanyCODE: TStringField;
    Label1: TUniLabel;
    DBAddress3: TUniDBEdit;
    PopupUserDefLabel: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    TblCompanyUSE_USA_MASK: TStringField;
    DbChkBoxDefaultShiptToAddress: TUniDBCheckBox;
    Label83: TUniLabel;
    DBEdit25: TUniDBEdit;
    TblCompanySHIP_DEFAULT: TStringField;
    TblCompanyEPLANT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    PnlCarrier: TUniPanel;
    GridShipTo: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure cbDefAddClick(Sender: TObject);
    procedure TblCompanyBeforePost(DataSet: TDataSet);
    procedure SBGridViewClick(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure TblCompanyBeforeOpen(DataSet: TDataSet);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TblCompanyFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure SetID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    FId:Real;
    property ID : Real write SetID;
  end;

function DoEditCompany(nId:Real):Real;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  //IQSecIns,
  IQMS.WebVcl.SecurityManager;

function DoEditCompany(nId:Real):Real;
var
  LFrmEditCompany : TFrmEditCompany;
begin
  LFrmEditCompany := TFrmEditCompany.Create(UniGUIApplication.UniApplication);
  LFrmEditCompany.ID := nID;
  LFrmEditCompany.showModal;
  Result := LFrmEditCompany.FId;
end;

{constructor TFrmEditCompany.Create(nId:Real; AOwner:TComponent);
begin
  inherited Create(AOwner);
  FId := nId;
  IQMS.Common.Controls.AdjustPageControlToParent(PCShipTo);
  IQSetTablesActive( TRUE, self );
  GridShipTo.DataSource:= NIL;
  PCShipTo.ActivePage := TabForm;
  if  FId <> 0 then TblCompany.Locate('ID', nId, []);
end;  }

procedure TFrmEditCompany.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent(PCShipTo);
  IQSetTablesActive( TRUE, self );
  GridShipTo.DataSource:= NIL;
  PCShipTo.ActivePage := TabForm;
  if  FId <> 0 then TblCompany.Locate('ID', FId, []);
  IQRegFormRead( self, [ self, GridShipTo]);
  { TODO -oysingh -cWebConvert : Dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmEditCompany.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, GridShipTo]);
end;

procedure TFrmEditCompany.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditCompany.BtnOkClick(Sender: TObject);
begin
  TblCompany.CheckBrowseMode;
  FId:= TblCompany.FieldByName('ID').asFloat;
  Close;
end;

procedure TFrmEditCompany.SBSearchPurchClick(Sender: TObject);
begin
  with PkShipTo do
    if Execute then
      TblCompany.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmEditCompany.SetID(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmEditCompany.cbDefAddClick(Sender: TObject);
begin
  // try
  //   SrcCompany.OnDataChange := nil;
  //   TblCompany.CheckBrowseMode;
  //   if cbDefAdd.Checked then
  //     ExecuteCommandFmt('update iqsys set company_id = %f', [TblCompany.FieldByName('ID').asFloat]);
  // finally
  //   SrcCompany.OnDataChange := SrcCompanyDataChange;
  // end;
end;

procedure TFrmEditCompany.TblCompanyBeforePost(DataSet: TDataSet);
var
  AEPlant_ID: Real;
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}

  AEPlant_ID:= IIf( TblCompanyEPlant_ID.asFloat = 0, SecurityManager.EPlant_ID_AsFloat, TblCompanyEPlant_ID.asFloat );
  if TblCompanySHIP_DEFAULT.asString = 'Y' then
     ExecuteCommandFmt('update company set ship_default = ''N'' where ID <> %f and NVL(eplant_id, 0) = %f',
               [ TblCompanyID.asFloat, SecurityManager.EPlant_ID_AsFloat ]);
end;

procedure TFrmEditCompany.SBGridViewClick(Sender: TObject);
begin
  if (PCShipTo.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridShipTo.DataSource:= NIL;
    PCShipTo.ActivePage := TabForm;
  end
  else
  begin
    GridShipTo.DataSource:= SrcCompany;
    PCShipTo.ActivePage := TabGrid;
  end;
end;

procedure TFrmEditCompany.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmEditCompany.TblCompanyBeforeOpen(DataSet: TDataSet);
begin
//  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmEditCompany.DoGetTelephoneText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString, TblCompanyUSE_USA_MASK.AsString = 'Y'); // pas
end;

procedure TFrmEditCompany.TblCompanyFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := SelectValueFmtAsFloat('select misc.eplant_filter_include_nulls(%f) from dual', [TblCompanyEPLANT_ID.asFloat]) = 1;
end;

end.
