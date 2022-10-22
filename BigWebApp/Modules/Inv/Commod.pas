unit Commod;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
//  Mask,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  Vcl.Menus,
//  Vcl.Buttons,
  IQMS.WebVcl.UDComboBox,
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
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmCommodities = class(TUniForm)
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    SrcCommod: TDataSource;
    QryCommod: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    PkGlacct: TIQWebHPick;
    QryCommodID: TBCDField;
    QryCommodDESCRIP: TStringField;
    QryCommodSUR_RATE: TFMTBCDField;
    QryCommodACT_RATE: TFMTBCDField;
    QryCommodGLACCT_ID: TBCDField;
    QryCommodACCT: TStringField;
    PkGlacctID: TBCDField;
    PkGlacctACCT: TStringField;
    PkGlacctEPLANT_ID: TBCDField;
    PkGlacctDESCRIP: TStringField;
    QryCommodPROCEDURE_TO_RUN: TStringField;
    PkProc: TIQWebHPick;
    PkProcOBJECT_NAME: TStringField;
    QryCommodPROPAGATE_COMM: TStringField;
    Contents1: TUniMenuItem;
    PnlCarrier: TUniPanel;
    pcMain: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    cmbGridGLAccount: TUniEdit;
    cmbGridOracleProc: TUniEdit;
    sbtnSearchPackages: TUniSpeedButton;
    sbtnToggleView: TUniSpeedButton;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    PkCommod: TIQWebHPick;
    PkCommodID: TBCDField;
    PkCommodDESCRIP: TStringField;
    PkCommodSUR_RATE: TFMTBCDField;
    PkCommodACT_RATE: TFMTBCDField;
    PkCommodGLACCT_ID: TBCDField;
    PkCommodPROCEDURE_TO_RUN: TStringField;
    PkCommodPROPAGATE_COMM: TStringField;
    PkCommodUNIT_WEIGHT: TBCDField;
    PkCommodCODE: TStringField;
    PkCommodMFG_COUNTRY: TStringField;
    PkCommodUOM: TStringField;
    PkCommodUNIT_PRICE: TFMTBCDField;
    QryCommodUNIT_WEIGHT: TBCDField;
    QryCommodCODE: TStringField;
    QryCommodMFG_COUNTRY: TStringField;
    QryCommodUOM: TStringField;
    QryCommodUNIT_PRICE: TFMTBCDField;
    PGLAccount: TUniPopupMenu;
    POraclProc: TUniPopupMenu;
    Select1: TUniMenuItem;
    N2: TUniMenuItem;
    Clear1: TUniMenuItem;
    Select2: TUniMenuItem;
    N3: TUniMenuItem;
    Clear2: TUniMenuItem;
    QryCommodUOM_WEIGHT: TStringField;
    cmbGridUOM: TIQWebUDComboBox;
    cmbGridCountry: TUniDBComboBox;
    PnlFormViewScrollCarrier: TUniPanel;
    sbFormView: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    lblDescription: TUniLabel;
    lblSurRate: TUniLabel;
    lblActualRate: TUniLabel;
    lblGLAcct: TUniLabel;
    lblStoredProcedure: TUniLabel;
    lblUnitWt: TUniLabel;
    lblCode: TUniLabel;
    lblMFGCountry: TUniLabel;
    lblUOM: TUniLabel;
    lblUnitValue: TUniLabel;
    Label1: TUniLabel;
    PnlClient02: TUniPanel;
    lblWeightUOM: TUniLabel;
    dbeDescrip: TUniDBEdit;
    dbeSurRate: TUniDBEdit;
    dbeActualRate: TUniDBEdit;
    dbeUnitWeight: TUniDBEdit;
    dbeCode: TUniDBEdit;
    dbeUnitPrice: TUniDBEdit;
    cmbGLAccount: TUniEdit;
    cbmOraclProc: TUniEdit;
    chkPropagateComm: TUniDBCheckBox;
    cmbUOM: TIQWebUDComboBox;
    cmbCountry: TUniDBComboBox;
    dbeMFGCountryCode: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoSelectGLAccount(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DoApplyUpdates(DataSet: TDataSet);
    procedure QryCommodBeforePost(DataSet: TDataSet);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure cmbGridGLAccountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DoSelectOracleProcedure(Sender: TObject);
    procedure cmbGridOracleProcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PkCommodIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure QryCommodNewRecord(DataSet: TDataSet);
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure DoClearGLAccount(Sender: TObject);
    procedure DoClearOracleProcedure(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCommodityID: Real;
    procedure SetCommodityID(const Value: Real);
    function GetCommodityID: Real;
  public
    { Public declarations }
    property CommodityID: Real read GetCommodityID write SetCommodityID;
  end;

procedure DoCommodities(ACommodityID: Real = 0);


implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  shipman_region;

procedure DoCommodities(ACommodityID: Real);
var
  frm: TFrmCommodities;
begin
  frm := TFrmCommodities.Create(uniGUIApplication.UniApplication);
  frm.CommodityID := ACommodityID;
  frm.Show;
end;


procedure TFrmCommodities.UniFormCreate(Sender: TObject);
begin
{ TODO -oLema : TUniControl can not accept child controls }
//  cmbGridGLAccount.Parent   := IqSearch1.DBGrid;
  cmbGridGLAccount.Visible := False;
{ TODO -oLema : TUniControl can not accept child controls }
//  cmbGridOracleProc.Parent   := IqSearch1.DBGrid;
  cmbGridOracleProc.Visible := False;
{ TODO -oLema : TUniControl can not accept child controls }
//  cmbGridUOM.Parent   := IqSearch1.DBGrid;
  cmbGridUOM.Visible := False;
{ TODO -oLema : TUniControl can not accept child controls }
//  cmbGridCountry.Parent   := IqSearch1.DBGrid;
  cmbGridCountry.Visible := False;

{ TODO -oLema : Incompatible type in CenterForm }
//  IQMS.Common.Controls.CenterForm(Self); // initial center

  IQRegFormRead( self, [ self,PnlLeft01 ]); // IQMS.Common.RegFrm.pas
  QryCommod.Open;

{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.ResizeNavBar(Nav); // ensure symmetry after SR applies

{ TODO -oLema : The following hides the tabs of pcMain.}
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain,1);

  // load the country codes; we only have to do this once
  // NOTE:  We load it with the "multiple" option; meaning, for "multiple" countries
  //        of manufacture, the code should be "XX"
  shipman_region.LoadCountryCodes(cmbCountry, TRUE {Multiple}); // shipman_common.pas
  shipman_region.LoadCountryCodes(cmbGridCountry, TRUE {Multiple}); // shipman_common.pas

end;



procedure TFrmCommodities.FormShow(Sender: TObject);
var
   i, w: Integer;
begin
  // Locate record
  if CommodityID > 0 then
     QryCommod.Locate( 'ID', CommodityID, [] )
  else
      try
         Search1Click( NIL );
      except on E:EAbort do
         Close1Click(nil);
//         PostMessage( Handle, wm_Command, Close1.Command, 0 );   // Call "Exit"
      end;

{ TODO -oLema : getting AV with VertScrollBar.Position }
//  sbFormView.VertScrollBar.Position := 0;

  // fix up controls that are alRight
  w := PnlClient02.ClientWidth - 4;
  for i := 0 to PnlClient02.ControlCount - 1 do
   if (PnlClient02.Controls[i].Align in [alRight]) then
      PnlClient02.Controls[i].Width := w;

end;


procedure TFrmCommodities.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self,PnlLeft01 ]);
end;

procedure TFrmCommodities.DoSelectGLAccount(Sender: TObject);
begin
  with PkGlacct do
  if execute then
  begin
    if not (QryCommod.state in [dsEdit, dsInsert]) then QryCommod.Edit;
      QryCommodGLACCT_ID.asFloat := GetValue('ID');
      QryCommodACCT.asString := GetValue('ACCT');
  end;
end;

procedure TFrmCommodities.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCommodities.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCommodities.DoApplyUpdates(DataSet: TDataSet);
begin
{
  try
    QryCommod.DataBase.ApplyUpdates( [ QryCommod ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      Reopen(QryCommod);
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmCommodities.QryCommodBeforePost(DataSet: TDataSet);
begin
  if QryCommodID.asFloat = 0 then
    QryCommodID.asFloat := GetNextID('COMMODITIES');
  if QryCommodUOM_WEIGHT.IsNull then
     QryCommodUOM_WEIGHT.AsString := 'LBS'; // load default value, if null
  if QryCommodGLACCT_ID.AsFloat = 0 then
     raise Exception.Create(inv_rscstr.cTXT0000085 {'Please select a GL Account.'});

end;

procedure TFrmCommodities.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryCommodID.asFloat;
    QryCommod.Close;
    QryCommod.Open;
    QryCommod.Locate('ID', AId, []);
    Abort;
  end;
end;


procedure TFrmCommodities.cmbGridGLAccountKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    DoClearGLAccount(Sender); // see below
    Key:= 0;
  end;

end;

procedure TFrmCommodities.DoClearGLAccount(Sender: TObject);
begin
    if not (QryCommod.State in [dsEdit, dsInsert]) then
       QryCommod.Edit;
    QryCommodGLACCT_ID.Clear;
    QryCommodACCT.Clear;
end;

procedure TFrmCommodities.DoSelectOracleProcedure(Sender: TObject);
begin
  with PkProc do
  if execute then
  begin
    if not (QryCommod.state in [dsEdit, dsInsert]) then QryCommod.Edit;
    QryCommodPROCEDURE_TO_RUN.asString := GetValue('OBJECT_NAME');
  end;
end;

procedure TFrmCommodities.cmbGridOracleProcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    DoClearOracleProcedure(Sender); // see below
    Key:= 0;
  end;
end;

procedure TFrmCommodities.DoClearOracleProcedure(Sender: TObject);
begin
  if not (QryCommod.State in [dsEdit, dsInsert]) then
     QryCommod.Edit;
  QryCommodPROCEDURE_TO_RUN.Clear;
end;

procedure TFrmCommodities.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmCommodities.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCommodities.PkCommodIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TFrmCommodities.QryCommodNewRecord(DataSet: TDataSet);
var
   ACode: String;
begin
  // prepopulate the country code
  ACode := shipman_region.CountryCodeFor(SelectValueAsString('select country from iqsys where rownum < 2'));
  if ACode = '' then ACode := 'XX';
  QryCommodMFG_COUNTRY.AsString := ACode;
  QryCommodUOM_WEIGHT.AsString := 'LBS'; // currently a hard-coded value
end;

procedure TFrmCommodities.sbtnToggleViewClick(Sender: TObject);
begin
{ TODO -oLema : The Controls.TogglePageControl doesn't seem to work as expected}
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmCommodities.Search1Click(Sender: TObject);
begin
  with PkCommod do
   if Execute then
      begin
        if NewResultValue then
           QryCommod.Append
        else
           QryCommod.Locate('ID',GetValue('ID'),[]);
      end
   else System.SysUtils.Abort;
end;


procedure TFrmCommodities.SetCommodityID(const Value: Real);
begin
  FCommodityID := Value;
end;

function TFrmCommodities.GetCommodityID: Real;
begin
   Result := FCommodityID;
end;

end.

