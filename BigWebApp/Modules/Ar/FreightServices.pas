unit FreightServices;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Hpick,
  Data.DB,
  Vcl.wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFreightServices = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    N2: TUniMenuItem;
    ToggleFormTable1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    sbtnToggleView: TUniSpeedButton;
    SBSearch: TUniSpeedButton;
    NavMain: TUniDBNavigator;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabGrid: TUniTabSheet;
    GridFreightServices: TIQUniGridControl;
    TabForm: TUniTabSheet;
    PnlFormCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlFormLeft: TUniPanel;
    lblPassword: TUniLabel;
    lblName: TUniLabel;
    lblUsername: TUniLabel;
    lblURL: TUniLabel;
    PnlFormClient: TUniPanel;
    dbeWebServiceURL: TUniDBEdit;
    dbeWebServiceUserName: TUniDBEdit;
    cmbWebServiceProvider: TUniEdit;
    wwSrcFreightCarrier: TDataSource;
    wwQryFreightCarrier: TFDQuery;
    dbeWebServicePassword: TUniDBEdit;
    PkWebServices: TIQWebHPick;
    cmbWebServiceProviderGrid: TUniEdit;
    PkFreightCarrier: TIQWebHPick;
    IQAbout1: TIQWebAbout;
    wwQryFreightCarrierID: TBCDField;
    wwQryFreightCarrierPASSWORD: TStringField;
    wwQryFreightCarrierUSERNAME: TStringField;
    wwQryFreightCarrierFRIEGHT_CARRIER_TYPE: TBCDField;
    wwQryFreightCarrierCARRIER: TStringField;
    wwQryFreightCarrierURL: TStringField;
    PkWebServicesFREIGHT_CARRIER_TYPE: TFMTBCDField;
    PkWebServicesCARRIER: TStringField;
    PkWebServicesURL: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    PkFreightCarrierID: TBCDField;
    PkFreightCarrierDESCRIP: TStringField;
    PkFreightCarrierURL: TStringField;
    wwQryFreightCarrierAPI_KEY: TStringField;
    wwQryFreightCarrierACCOUNT_NO: TStringField;
    wwQryFreightCarrierIS_TEST_MODE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbWebServiceProviderCustomDlg(Sender: TObject);
    function SelectWebSrvcProvider(var ACarrierID: Integer;
      var ACarrierName: string; var ACarrierURL: string): Boolean;
    procedure cmbWebServiceProviderGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbWebServiceProviderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DoClearWebSvcClick(Sender: TObject);
    procedure Startup;
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure ToggleFormTable1Click(Sender: TObject);
    { TODO -oBantuK -cWEB_CONVERT : Compile time with TNavigateBtn compoenent
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure wwQryFreightCarrierAfterPost(DataSet: TDataSet);
    procedure wwQryFreightCarrierAfterDelete(DataSet: TDataSet);
    procedure wwQryFreightCarrierBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoApplyUpdates(DataSet: TDataSet);
  public
    { Public declarations }
  end;

procedure DoFreightServices;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  System.SysUtils,
  System.Variants;

{ TFrmFreightServices }

procedure DoFreightServices;
var
  LFrm: TFrmFreightServices;
begin
  LFrm:= TFrmFreightServices.Create(uniGUIApplication.UniApplication);
  LFrm.ShowModal;
end;

procedure TFrmFreightServices.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.CenterForm(Self);}
  IQMS.Common.RegFrm.IQRegFormRead(Self, []);
  Startup;
end;

procedure TFrmFreightServices.FormShow(Sender: TObject);
begin
  if wwQryFreightCarrier.Active then
    wwQryFreightCarrier.Close;

  wwQryFreightCarrier.Open;
end;

procedure TFrmFreightServices.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } );
end;

procedure TFrmFreightServices.Startup;
begin
  cmbWebServiceProviderGrid.Visible := False;

  AdjustPageControlToParent(pcMain); // IQMS.Common.Controls.pas
   IQMS.Common.Screen.ApplySystemFont(Self);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlFormClient);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlFormClient);
end;

procedure TFrmFreightServices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, []);
end;

procedure TFrmFreightServices.SBSearchClick(Sender: TObject);
var
  AFreightCarrierID: Integer;
begin
  with PkFreightCarrier do
    if Execute then
    begin
      AFreightCarrierID := System.Variants.VarAsType(GetValue('ID'), varInteger);
      if AFreightCarrierID > 0 then
        wwQryFreightCarrier.Locate('ID', AFreightCarrierID, []);
    end
    else
      System.SysUtils.Abort;
end;

procedure TFrmFreightServices.ToggleFormTable1Click(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmFreightServices.wwQryFreightCarrierAfterDelete(DataSet: TDataSet);
begin
  DoApplyUpdates(DataSet);
end;

procedure TFrmFreightServices.wwQryFreightCarrierAfterPost(DataSet: TDataSet);
begin
  DoApplyUpdates(DataSet);
end;

procedure TFrmFreightServices.wwQryFreightCarrierBeforePost(DataSet: TDataSet);
begin
  if (wwQryFreightCarrierFRIEGHT_CARRIER_TYPE.AsFloat = 0) then
  begin
    IQError('Must select a freight carrier service.');
    Abort;
  end;
end;

procedure TFrmFreightServices.cmbWebServiceProviderCustomDlg(Sender: TObject);
var
  ACarrierID: Integer;
  ACarrierName: string;
  ACarrierURL: string;
begin
  if SelectWebSrvcProvider(ACarrierID, ACarrierName, ACarrierURL) then
  begin
    if not(wwQryFreightCarrier.State in [dsEdit, dsInsert]) then
      wwQryFreightCarrier.Edit;

    wwQryFreightCarrierFRIEGHT_CARRIER_TYPE.AsInteger := ACarrierID;
    wwQryFreightCarrierCARRIER.AsString := ACarrierName;
    wwQryFreightCarrierURL.AsString := ACarrierURL;
  end;
end;

function TFrmFreightServices.SelectWebSrvcProvider(var ACarrierID: Integer;
  var ACarrierName: string; var ACarrierURL: string): Boolean;
begin
  Result := False;
  ACarrierID := 0;
  with PkWebServices do
    if Execute then
    begin
      ACarrierID := System.Variants.VarAsType(GetValue('FREIGHT_CARRIER_TYPE'),
        varInteger);
      ACarrierName := System.Variants.VarToStr(GetValue('CARRIER'));
      ACarrierURL := System.Variants.VarToStr(GetValue('URL'));
      Result := ACarrierID > 0;
    end;
end;

procedure TFrmFreightServices.cmbWebServiceProviderGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    DoClearWebSvcClick(nil);
end;

procedure TFrmFreightServices.cmbWebServiceProviderKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    DoClearWebSvcClick(nil);
end;

procedure TFrmFreightServices.DoApplyUpdates(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;
end;

procedure TFrmFreightServices.DoClearWebSvcClick(Sender: TObject);
begin
  if not(wwQryFreightCarrier.State in [dsEdit, dsInsert]) then
    wwQryFreightCarrier.Edit;

  wwQryFreightCarrierFRIEGHT_CARRIER_TYPE.Clear;
  wwQryFreightCarrierCARRIER.Clear;
  wwQryFreightCarrierURL.Clear;
end;

procedure TFrmFreightServices.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFreightServices.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(Self.HelpContext);
end;

{ TODO -oBantuK -cWEB_CONVERT : Compile time with TNavigateBtn compoenent
procedure TFrmFreightServices.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbRefresh) then
  begin
    wwQryFreightCarrier.Close;
    wwQryFreightCarrier.Open;
    Abort;
  end;
end;}

procedure TFrmFreightServices.New1Click(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'BtnClick'
  NavMain.BtnClick(nbInsert);}
end;

procedure TFrmFreightServices.sbtnToggleViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmFreightServices.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFreightServices.BtnOkClick(Sender: TObject);
begin
  if wwQryFreightCarrier.State in [dsEdit, dsInsert] then
    wwQryFreightCarrier.Post;
  Close;
end;

end.
