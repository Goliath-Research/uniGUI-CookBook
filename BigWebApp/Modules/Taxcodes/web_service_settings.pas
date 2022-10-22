unit web_service_settings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  IQMS.WebVcl.Hpick,
  vcl.wwdatsrc,
  IQMS.WebVcl.About,
  vcl.Wwdatainspector,
  Vcl.Buttons,
  FireDAC.Stan.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, Vcl.Grids;

type
  TFrmTaxWebServiceSettings = class(TUniForm)
    pnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    pnlNav: TUniPanel;
    NavMain: TUniDBNavigator;
    wwDataInspector1: TwwDataInspector;
    IQAbout1: TIQWebAbout;
    MainMenu1: TUniMainMenu;
    MenuItem1: TUniMenuItem;
    MenuItem2: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcAvalaraSettings: TDataSource;
    PKEplant: TIQWebHPick;
    PKEplantID: TFloatField;
    PKEplantNAME: TStringField;
    SR: TIQWebSecurityRegister;
    QryAvalaraSettings: TFDQuery;
    QryAvalaraSettingsSOURCE_NAME: TStringField;
    QryAvalaraSettingsEPLANT_ID: TFMTBCDField;
    QryAvalaraSettingsENABLED: TStringField;
    QryAvalaraSettingsSERVICE_URL: TStringField;
    QryAvalaraSettingsACCOUNT: TStringField;
    QryAvalaraSettingsLICENSE_KEY: TStringField;
    QryAvalaraSettingsCOMPANY_CODE: TStringField;
    QryAvalaraSettingsDEFAULT_TAX_CLASS: TStringField;
    QryAvalaraSettingsTAX_CLASS_ID: TFMTBCDField;
    dbeDefaultTaxClass: TUniEdit;
    PkTaxClass: TIQWebHPick;
    PkTaxClassID: TBCDField;
    PkTaxClassCODE: TStringField;
    PkTaxClassDESCRIPTION: TStringField;
    PkTaxClassINFORMATION: TStringField;
    sbtnCopyFromDefault: TUniSpeedButton;
    QryAvalaraSettingsREQUEST_TIMEOUT: TFMTBCDField;
    sbtnWebConsole: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    JumptoAvaTaxAdminConsole1: TUniMenuItem;
    Options1: TUniMenuItem;
    CustomerUsageTypes1: TUniMenuItem;
    QryAvalaraSettingsLOGGING_ENABLED: TStringField;
    sbtnTestSettings: TUniSpeedButton;
    InventoryTaxClasses1: TUniMenuItem;
    QryAvalaraSettingsDOC_COMMIT: TStringField;
    QryAvalaraSettingsUSE_UPC_CODE: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAvalaraEnabledClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryAvalaraSettingsAfterPost(DataSet: TDataSet);
    procedure QryAvalaraSettingsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbeDefaultTaxClassKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDefaultTaxClassCustomDlg(Sender: TObject);
    procedure sbtnCopyFromDefaultClick(Sender: TObject);
    procedure sbtnWebConsoleClick(Sender: TObject);
    procedure JumptoAvaTaxAdminConsole1Click(Sender: TObject);
    procedure CustomerUsageTypes1Click(Sender: TObject);
    procedure sbtnTestSettingsClick(Sender: TObject);
    procedure InventoryTaxClasses1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetControls;
    procedure CopyFromDefaultTo(AEplantId: Real);
    procedure DeleteEPlant;
    procedure InsertEPlant;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTaxWebServiceSettings;

implementation

uses
  Avalara,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  IQSecIns, }
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  tax_classes, }
  tax_usage_types;

{$R *.dfm}

procedure DoTaxWebServiceSettings;
begin
  TFrmTaxWebServiceSettings.Create(UniApplication).ShowModal;
end;

procedure TFrmTaxWebServiceSettings.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTaxWebServiceSettings.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaxWebServiceSettings.BtnOkClick(Sender: TObject);
begin

    Close;
end;

procedure TFrmTaxWebServiceSettings.chkAvalaraEnabledClick(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmTaxWebServiceSettings.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmTaxWebServiceSettings.CustomerUsageTypes1Click(Sender: TObject);
begin
  DoTaxUsageTypes;
end;

procedure TFrmTaxWebServiceSettings.dbeDefaultTaxClassCustomDlg(
  Sender: TObject);
var
  AId:Real;
begin
  with PkTaxClass do
  if Execute then
  begin
    AId := GetValue('ID');
    if not (QryAvalaraSettings.State in [dsEdit, dsInsert]) then
      QryAvalaraSettings.edit;
    QryAvalaraSettingsTAX_CLASS_ID.asFloat := AId;
    QryAvalaraSettingsDEFAULT_TAX_CLASS.asString := GetValue('CODE');
  end
end;

procedure TFrmTaxWebServiceSettings.dbeDefaultTaxClassKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TUniEdit) then with Sender as TUniEdit do
  begin
    QryAvalaraSettings.Edit;
    QryAvalaraSettingsTAX_CLASS_ID.Clear;
    QryAvalaraSettingsDEFAULT_TAX_CLASS.Clear;
    Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmTaxWebServiceSettings.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTaxWebServiceSettings.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTaxWebServiceSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmTaxWebServiceSettings.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}
end;

{
procedure TFrmTaxWebServiceSettings.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        RefreshDataSetByID( QryAvalaraSettings, 'eplant_id' );
        ABORT;
      end;
    nbInsert : InsertEPlant;
    nbDelete : DeleteEPlant;
  end;
end;}

procedure TFrmTaxWebServiceSettings.InsertEPlant;
begin
  with PKEplant do
    if Execute then
    begin
      ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
        'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_HAS_SETTINGS, ''Y'', %.0f); end;',
      [DToF(GetValue('ID'))]);
      CopyFromDefaultTo( GetValue('ID'));
      Reopen( QryAvalaraSettings );
      QryAvalaraSettings.Locate('eplant_id', GetValue('ID'), []);
    end;

  ABORT;
end;

procedure TFrmTaxWebServiceSettings.InventoryTaxClasses1Click(Sender: TObject);
begin
//  DoTaxClasses(self);   {tax_classes}
end;

procedure TFrmTaxWebServiceSettings.JumptoAvaTaxAdminConsole1Click(
  Sender: TObject);
begin
  sbtnWebConsole.Click;
end;

procedure TFrmTaxWebServiceSettings.DeleteEPlant;
begin
  IQAssert( QryAvalaraSettingsEPLANT_ID.asFloat > 0, 'Cannot delete System Default parameters.' );
  try
    if not IQConfirmYN('Delete record?') then
       EXIT;
    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_HAS_SETTINGS, ''N'', %.0f); end;',
      [QryAvalaraSettingsEPLANT_ID.asFloat]);
    Reopen( QryAvalaraSettings );
    QryAvalaraSettings.Locate('eplant_id', 0, []); {to solve weird datainspector display problem}
  finally
    ABORT;
  end;
end;

procedure TFrmTaxWebServiceSettings.QryAvalaraSettingsAfterPost(
  DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmTaxWebServiceSettings.QryAvalaraSettingsUpdateRecord(
  ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ARequest = arUpdate then
  begin
    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_ENABLED, ''%s'', %.0f); end;',
      [ASender.FieldByName('ENABLED').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_SERVICE_URL, ''%s'', %.0f); end;',
      [ASender.FieldByName('SERVICE_URL').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_ACCOUNT, ''%s'', %.0f); end;',
      [ASender.FieldByName('ACCOUNT').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_LICENSE_KEY, ''%s'', %.0f); end;',
      [ASender.FieldByName('LICENSE_KEY').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_COMPANY_CODE, ''%s'', %.0f); end;',
      [ASender.FieldByName('COMPANY_CODE').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_numeric_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_TAX_CLASS_ID, null, ''%s'', %.0f); end;',
      [ASender.FieldByName('TAX_CLASS_ID').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_numeric_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_TIMEOUT, null, ''%s'', %.0f); end;',
      [ASender.FieldByName('REQUEST_TIMEOUT').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_LOGGING_ENABLED, ''%s'', %.0f); end;',
      [ASender.FieldByName('LOGGING_ENABLED').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_DOC_COMMIT, ''%s'', %.0f); end;',
      [ASender.FieldByName('DOC_COMMIT').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);

    ExecuteCommandFmt('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_USE_UPC_CODE, ''%s'', %.0f); end;',
      [ASender.FieldByName('USE_UPC_CODE').asString,
       ASender.FieldByName('EPLANT_ID').asFloat]);
  end;

  AAction := eaApplied;
end;

procedure TFrmTaxWebServiceSettings.sbtnCopyFromDefaultClick(Sender: TObject);
begin
  IQAssert( QryAvalaraSettingsEPLANT_ID.asFloat > 0, 'Select EPlant column to copy over from the System Default parameters' );

  if not IQConfirmYN(Format('Copy System Default parameters to selected %s EPlant?', [ QryAvalaraSettingsSOURCE_NAME.AsString ])) then
     EXIT;

  CopyFromDefaultTo( QryAvalaraSettingsEPLANT_ID.asFloat );
  RefreshDataSetByID( QryAvalaraSettings, 'eplant_id' );
end;

procedure TFrmTaxWebServiceSettings.sbtnTestSettingsClick(Sender: TObject);
begin
  with TAvalaraGetTax.Create(self) do
    if Ping(QryAvalaraSettingsEPLANT_ID.asFloat) then
      IQConfirm('Success')
    else
      IQError('Connection test failed.');
end;

procedure TFrmTaxWebServiceSettings.sbtnWebConsoleClick(Sender: TObject);
begin
  ExecuteProgram( 'https://admin-avatax.avalara.net/login.aspx', SW_SHOWDEFAULT, '' ); {IQMisc}
end;

procedure TFrmTaxWebServiceSettings.CopyFromDefaultTo(AEplantId: Real);
begin
    ExecuteCommandFmt('begin '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_ENABLED, '+
      'iqsys3_settings.get_avalara_enabled(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_SERVICE_URL, '+
      'iqsys3_settings.get_avalara_service_url(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_ACCOUNT, '+
      'iqsys3_settings.get_avalara_account(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_LICENSE_KEY, '+
      'iqsys3_settings.get_avalara_license_key(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_COMPANY_CODE, '+
      'iqsys3_settings.get_avalara_company_code(0), %f); '#10#13 +
    'iqsys3_settings.update_numeric_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_TAX_CLASS_ID, null, '+
      'iqsys3_settings.get_avalara_tax_class_id(0), %f); '#10#13 +
    'iqsys3_settings.update_numeric_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_TIMEOUT, null, '+
      'iqsys3_settings.get_avalara_timeout(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_LOGGING_ENABLED, '+
      'iqsys3_settings.get_avalara_logging_enabled(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_DOC_COMMIT, '+
      'iqsys3_settings.get_avalara_doc_commit(0), %f); '#10#13 +
    'iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_USE_UPC_CODE, '+
      'iqsys3_settings.get_avalara_use_upc_code(0), %f); '#10#13 + 'end;',
      [AEplantId,AEplantId,AEplantId,AEplantId,AEplantId,AEplantId,AEplantId,AEplantId,AEplantId,AEplantId]);
end;

procedure TfrmTaxWebServiceSettings.SetControls;
begin
//   iqctrl.IQEnableControl([edtURL, edtAccount, edtLicenseKey], chkAvalaraEnabled.Checked);
end;

procedure TFrmTaxWebServiceSettings.UniFormCreate(Sender: TObject);
var
  AURL: String;
  ATimeout: Real;
begin
  AURL := SelectValueAsString('select iqsys3_settings.get_avalara_service_url from dual');
  if (AURL = '') then
    ExecuteCommand('begin iqsys3_settings.update_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_SERVICE_URL, ' +
      'iqsys3_settings.C_NAME_AVALARA_DEFAULT_URL, 0); end;');

  ATimeout := SelectValueAsFloat('select iqsys3_settings.get_avalara_timeout from dual');
  if (ATimeout = 0) then
    ExecuteCommand('begin iqsys3_settings.update_numeric_setting( ' +
      'iqsys3_settings.C_APP_AVALARA, iqsys3_settings.C_NAME_AVALARA_TIMEOUT, null,' +
      'iqsys3_settings.C_NAME_AVALARA_DEFAULT_TIMEOUT, 0); end;');

  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
end;

end.
