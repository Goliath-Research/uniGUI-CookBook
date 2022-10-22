unit iqsys_ccsettings;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  Mask,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniGUIFrame, IQUniGrid;

type
  { TFrmCCSettings }
  TFrmCCSettings = class(TUniForm)
    PnlMain: TUniPanel;
    PnlToolbar: TUniPanel;
    PnlPcCarrier: TUniPanel;
    pcMain: TUniPageControl;
    TabFormView: TUniTabSheet;
    TabGridView: TUniTabSheet;
    NavMain: TUniDBNavigator;
    SrcAccount: TDataSource;
    QryAccount: TFDQuery;
    QryAccountGATEWAY: TBCDField;
    QryAccountBANKINFO_DTL_ID: TBCDField;
    QryAccountCHANGE_SETTLEMENT: TStringField;
    QryAccountAUTOADJUST_SETTLEMENT: TStringField;
    QryAccountDESCRIPTION: TStringField;
    QryAccountEPLANT_ID: TBCDField;
    QryAccountCURRENCY_ID: TBCDField;
    QryAccountARCHIVED: TStringField;
    QryAccountID: TBCDField;
    QryAccountIS_DEFAULT: TStringField;
    QryAccountACCOUNT_NUMBER: TStringField;
    QryAccountACCOUNT_DESCRIPTION: TStringField;
    QryAccountEPLANT_NAME: TStringField;
    QryBankInfoDtl: TFDQuery;
    PMain: TUniPopupMenu;
    MerchantAccountSettings1: TUniMenuItem;
    Grid: TIQUniGridControl;
    QryAccountGATEWAY_DESCRIP: TStringField;
    Panel2: TUniPanel;
    shpArchived: TUniPanel;
    QryCurrency: TFDQuery;
    QryCurrencyID: TBCDField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyDESCRIP: TStringField;
    QryCurrencyNATIVE_CURR: TStringField;
    QryBankInfoDtlACCOUNT_NUMBER: TStringField;
    QryBankInfoDtlDESCRIPTION: TStringField;
    QryBankInfoDtlID: TBCDField;
    PnlStandardButtons: TUniPanel;
    sbtnToggleTableFormView: TUniSpeedButton;
    sbtnFilter: TUniSpeedButton;
    PnlEncryptionButton: TUniPanel;
    Bevel2: TUniPanel;
    sbtnEncryption: TUniSpeedButton;
    IQScrollBox1: TUniScrollBox;
    PnlCCLeft03: TUniPanel;
    Splitter12: TUniSplitter;
    PnlCCLeft01: TUniPanel;
    Label87: TUniLabel;
    lblCCBankID: TUniLabel;
    lblDescription: TUniLabel;
    lblCurrency: TUniLabel;
    PnlCCClient02: TUniPanel;
    cmbCCGateway: TUniDBComboBox;
    btnCCAccountSettings: TUniBitBtn;
    cmbCCBankID: TUniDBLookupComboBox;
    dbeDescription: TUniDBEdit;
    chkDefault: TUniDBCheckBox;
    chkArchived: TUniDBCheckBox;
    cmbCurrency: TUniDBLookupComboBox;
    btnAdvanced: TUniBitBtn;
    Advanced1: TUniMenuItem;
    QryBankInfoDtlEPLANT_ID: TBCDField;
    dbeMerchantName: TUniDBEdit;
    lblMerchantName: TUniLabel;
    QryAccountMERCHANT_NAME: TStringField;
    PnlCreditCardLists: TUniPanel;
    Bevel1: TUniPanel;
    sbtnCreditCardTypes: TUniSpeedButton;
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure DoApplyUpdates(DataSet: TDataSet);
    procedure QryAccountBeforeDelete(DataSet: TDataSet);
    procedure QryAccountUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryAccountNewRecord(DataSet: TDataSet);
    procedure sbtnEncryptionClick(Sender: TObject);
    procedure cmbCCGatewayChange(Sender: TObject);
    procedure QryAccountGATEWAYChange(Sender: TField);
    procedure MerchantAccountSettings1Click(Sender: TObject);
    procedure cmbCCBankIDBeforeDropDown(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnToggleTableFormViewClick(Sender: TObject);
    procedure SrcAccountDataChange(Sender: TObject; Field: TField);
    procedure QryAccountIS_DEFAULTChange(Sender: TField);
    procedure QryAccountAfterCancel(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure QryAccountBeforePost(DataSet: TDataSet);
    procedure cmbCurrencyBeforeDropDown(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure Advanced1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure cmbCCBankIDCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbCCBankIDDropDown(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure sbtnCreditCardTypesClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    private
      { Private declarations }
      FEPlantID: Real;
      FGatewayChanged: Boolean;
      FIsDefaultChanged: Boolean;
      FCanChangeBankID: Boolean;
      FEncryptionButtonEnabled: Boolean;
      FPrepared: Boolean;
    FCardTypesButtonEnabled: Boolean;
      procedure SetControls;
      procedure CheckResetGatewaySettings(const AShowWarning: Boolean);
      function GetEncryptionButtonVisible: Boolean;
      procedure SetEncryptionButtonVisible(const Value: Boolean);
      procedure SetFilterBtnHint;
    function GetCardTypesButtonVisible: Boolean;
    procedure SetCardTypesButtonVisible(const Value: Boolean);
    public
      { Public declarations }
      procedure RefreshData;
      procedure PostChanges;
      property Prepared: Boolean read FPrepared write FPrepared;
      property EPlantID: Real read FEPlantID write FEPlantID;
      property EncryptionButtonVisible: Boolean read GetEncryptionButtonVisible
        write SetEncryptionButtonVisible;
      property EncryptionButtonEnabled: Boolean read FEncryptionButtonEnabled
        write FEncryptionButtonEnabled;
      property CanChangeBankID: Boolean read FCanChangeBankID
        write FCanChangeBankID;
      property CardTypesButtonVisible: Boolean read GetCardTypesButtonVisible
        write SetCardTypesButtonVisible;
      property CardTypesButtonEnabled: Boolean read FCardTypesButtonEnabled
        write FCardTypesButtonEnabled;
  end;

implementation

{$R *.dfm}

uses
  cc_types,
  iqcc,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.WebVcl.SecurityManager,
  iqsys_rscstr,
  sys_ccadvanced;
  //WEB_CONVERT sys_ccencrypt,
  //WEB_CONVERT sys_ccmerchant_3dsi,
  //WEB_CONVERT sys_ccmerchant_authnet,
  //WEB_CONVERT sys_ccmerchant_elavon,
  //WEB_CONVERT sys_ccmerchant_firstdata,
  //WEB_CONVERT sys_ccmerchant_merchantaccountsca,
  //WEB_CONVERT sys_ccmerchant_mes,
  //WEB_CONVERT sys_ccmerchant_moneris,
  //WEB_CONVERT sys_ccmerchant_payflo,
  //WEB_CONVERT sys_ccmerchant_paypal,
  //WEB_CONVERT sys_ccmerchant_sterling,
  //WEB_CONVERT sys_ccmerchant_tsys;

{ TFrmCCSettings }

procedure TFrmCCSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCCLeft01]);
end;

procedure TFrmCCSettings.RefreshData;
begin
  try
    FPrepared := False;
    ReOpen(QryAccount);
    ReOpen(QryBankInfoDtl);
    ReOpen(QryCurrency);
  finally
    FPrepared := True;
  end;
  SetFilterBtnHint;
  SetControls;
end;

procedure TFrmCCSettings.DoBeforeOpen(DataSet: TDataSet);
begin
  FIsDefaultChanged := False;
  AssignQueryParamValue(DataSet, 'EPLANT_ID', FEPlantID);
  AssignQueryParamValue(DataSet, 'BY_EPLANT_ID', INTEGER(FEPlantID > 0));
  AssignQueryParamValue(DataSet, 'ARCHIVED',
    IQMS.Common.Numbers.sIIf(sbtnFilter.Down, 'Y', 'N'));
end;

procedure TFrmCCSettings.QryAccountBeforePost(DataSet: TDataSet);
begin
  if (QryAccountARCHIVED.AsString = 'Y') then
    QryAccountIS_DEFAULT.Clear;
end;

procedure TFrmCCSettings.DoApplyUpdates(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;

  FIsDefaultChanged := False;

  RefreshDataSetByID(QryAccount);

end;

procedure TFrmCCSettings.QryAccountBeforeDelete(DataSet: TDataSet);
begin
  if SelectValueFmtAsFloat(
    'SELECT 1 FROM credit_card_trans '#13 +
    'WHERE credit_card_account_id = %d',
    [QryAccountID.AsLargeInt]) = 1 then
    raise Exception.Create('This settings record is referenced by one or ' +
      'more credit card transactions.  Cannot delete.');

  ExecuteCommandFmt(
    'DELETE FROM credit_card_account WHERE id = %d',
    [QryAccountID.AsLargeInt]);
end;

procedure TFrmCCSettings.QryAccountUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
  SQL: TStringList;
begin
  if ARequest = arUpdate then
    try
      SQL := TStringList.Create;
      SQL.Add('UPDATE credit_card_account');
      SQL.Add('   SET is_default = :is_default,');
      SQL.Add('       autoadjust_settlement = :autoadjust_settlement,');
      SQL.Add('       change_settlement = :change_settlement,');
      SQL.Add('       description = :description,');
      SQL.Add('       eplant_id = :eplant_id,');
      SQL.Add('       currency_id = :currency_id,');
      SQL.Add('       archived = :archived,');
      SQL.Add('       gateway = :gateway,');
      SQL.Add('       bankinfo_dtl_id = :bankinfo_dtl_id,');
      SQL.Add('       merchant_name = :merchant_name');
      SQL.Add(' WHERE id = :id');
      ExecuteCommandParamDataSet(SQL.Text, QryAccount)
    finally
      if Assigned(SQL) then
        FreeAndNil(SQL);
    end
  else if ARequest = arInsert then
    try
      SQL := TStringList.Create;
      SQL.Add('INSERT INTO credit_card_account(id,');
      SQL.Add('                                is_default,');
      SQL.Add('                                autoadjust_settlement,');
      SQL.Add('                                change_settlement,');
      SQL.Add('                                description,');
      SQL.Add('                                eplant_id,');
      SQL.Add('                                currency_id,');
      SQL.Add('                                archived,');
      SQL.Add('                                gateway,');
      SQL.Add('                                bankinfo_dtl_id,');
      SQL.Add('                                merchant_name)');
      SQL.Add('    VALUES (:id, :is_default, :autoadjust_settlement,');
      SQL.Add('            :change_settlement, :description, :eplant_id,');
      SQL.Add('            :currency_id, :archived, :gateway,');
      SQL.Add('            :bankinfo_dtl_id, :merchant_name)');
      ExecuteCommandParamDataSet(SQL.Text, QryAccount);
    finally
      if Assigned(SQL) then
        FreeAndNil(SQL);
    end;

  if FIsDefaultChanged and (QryAccountIS_DEFAULT.AsString = 'Y') then
    ExecuteCommandFmt(
      'BEGIN iqms.cc.set_default_account(%d, %d); END;',
      [QryAccountID.AsLargeInt, QryAccountEPLANT_ID.AsLargeInt]);

  FIsDefaultChanged := False;

  AAction := eaApplied;
end;

procedure TFrmCCSettings.QryAccountNewRecord(DataSet: TDataSet);
begin
  QryAccountID.AsFloat := GetNextID('CREDIT_CARD_ACCOUNT');
  QryAccountGATEWAY.AsInteger := - 1;
  QryAccountCHANGE_SETTLEMENT.AsString := 'N';
  QryAccountAUTOADJUST_SETTLEMENT.AsString := 'N';
  QryAccountARCHIVED.AsString := 'N';
  QryAccountIS_DEFAULT.AsString := 'N';
  if FEPlantID > 0 then
    QryAccountEPLANT_ID.AsFloat := FEPlantID;
  QryAccountMERCHANT_NAME.AsString := SelectValueAsString(
   'SELECT company FROM iqsys WHERE ROWNUM < 2');
end;

procedure TFrmCCSettings.sbtnCreditCardTypesClick(Sender: TObject);
begin
  iqcc.CC_DoAcceptedCreditCards;
end;

procedure TFrmCCSettings.sbtnEncryptionClick(Sender: TObject);
begin
  // Post changes first
  if (QryAccount.State in [dsEdit]) then
    QryAccount.Post;

  CheckResetGatewaySettings(True { Prompt } );

  { TODO -oBantuK -cWEB_CONVERT : Dependency with sys_ccencrypt.pas
  DoCCEncryptionKey; // sys_ccencrypt.pas}
end;

procedure TFrmCCSettings.CheckResetGatewaySettings(const AShowWarning: Boolean);
begin
  if FGatewayChanged then
    begin
      // Reset variable
      FGatewayChanged := False;
      // Clear the settings
      ExecuteCommandFmt(
        'DELETE FROM credit_card_account_dtl WHERE credit_card_account_id = %d',
        [QryAccountID.AsLargeInt]);

      // Warn the user
      if AShowWarning and (QryAccountGATEWAY.AsInteger > - 1) then
        { The gateway setting has changed.  You will need to
          supply account information for the selected gateway. }
        IQWarning(iqsys_rscstr.cTXT0000055);
    end;
end;

procedure TFrmCCSettings.cmbCCGatewayChange(Sender: TObject);
begin
  SetControls; // 05/12/2006
end;

procedure TFrmCCSettings.SetControls;
begin
  // Credit Card Bank ID
  IQMS.Common.Controls.IQEnableControl([cmbCCBankID, lblCCBankID, MerchantAccountSettings1,
    btnCCAccountSettings, btnAdvanced, Advanced1],
    not QryAccountGATEWAY.IsNull and (QryAccountGATEWAY.AsInteger > - 1) and
    FCanChangeBankID);

  // 06/17/2008 Credit Card Encryption
  sbtnEncryption.Enabled := SecurityManager.IsUserDBA and
    FEncryptionButtonEnabled;
  // 06/12/2013 Credit Card types
  sbtnEncryption.Enabled := FCardTypesButtonEnabled;
end;

procedure TFrmCCSettings.QryAccountGATEWAYChange(Sender: TField);
begin
  // Set the flag that the gateway has changed;
  // We reference the flag when posting changes to the dataset,
  // so that the gateway-specific settings are cleared.
  if (QryAccount.State in [dsEdit]) then
    FGatewayChanged := True;
end;

procedure TFrmCCSettings.MerchantAccountSettings1Click(Sender: TObject);
var
  AAccountID: Int64;
begin
  // * Configure the credit card merchant account *

  // Post changes first
  if (QryAccount.State in [dsEdit, dsInsert]) then
    QryAccount.Post;

  CheckResetGatewaySettings(False { Prompt } );

  // Assign for re-use below
  AAccountID := QryAccountID.AsLargeInt;

  { TODO -oBantuK -cWEB_CONVERT : Dependency with other files of iqsys module
  // Display appropriate form, depending on selected gateway
  case QryAccountGATEWAY.AsInteger of
    GATEWAY_TSYS:
      TFrmIQSysMerchantTSYS.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_tsys.pas
    GATEWAY_AUTHORIZE_NET:
      TFrmIQSysMerchantAuthNet.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_authnet.pas
    GATEWAY_PAYPAL:
      TFrmIQSysMerchantPayPal.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_paypal.pas
    GATEWAY_PAYFLO_PRO:
      TFrmIQSysMerchantPayFlo.Create(Self, AAccountID).ShowModal;// sys_ccmerchant_payflo.pas
    GATEWAY_3DSI:
      TFrmIQSysMerchant3DSI.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_3dsi.pas
    GATEWAY_MONERIS_US:
      TFrmIQSysMerchantMoneris.Create(Self, AAccountID, 'USD').ShowModal; // sys_ccmerchant_moneris.pas  end;
    GATEWAY_MONERIS_CA:
      TFrmIQSysMerchantMoneris.Create(Self, AAccountID, 'CAD').ShowModal;// sys_ccmerchant_moneris.pas  end;
    GATEWAY_MYVIRTUALMERCHANT:
      TFrmIQSysMerchantElavon.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_elavon.pas
    GATEWAY_MERCHANTESOLUTIONS:
      TFrmIQSysMerchantMES.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_mes.pas
    GATEWAY_MERCHANTACCOUNTSCA:
      TFrmIQSysMerchantMerchantAccountsCa.Create(Self, AAccountID).ShowModal; // sys_ccmerchant_merchantaccountsca.pas
    GATEWAY_STERLING:
      TFrmIQSysMerchantSterling.Create(Self, AAccountID).ShowModal;// sys_ccmerchant_sterling.pas
    GATEWAY_FIRSTDATA:
      TFrmIQSysMerchantFirstData.Create(Self, AAccountID).Show; // sys_ccmerchant_firstdata.pas
  end;
  }
end;

procedure TFrmCCSettings.Advanced1Click(Sender: TObject);
begin
  // Post changes first
  if (QryAccount.State in [dsEdit, dsInsert]) then
    QryAccount.Post;

  if QryAccountID.AsLargeInt > 0 then
    AdvancedCreditCardOptions(QryAccountID.AsLargeInt); // sys_ccadvanced
end;

procedure TFrmCCSettings.cmbCCBankIDBeforeDropDown(Sender: TObject);
begin
  if not QryBankInfoDtl.Active then
    QryBankInfoDtl.Open
  else
    ReOpen(QryBankInfoDtl);
end;

procedure TFrmCCSettings.cmbCCBankIDDropDown(Sender: TObject);
begin
  // Assign the filter to the drop-down list
  if (FEPlantID > 0) then
    begin
      IQAssignEPlantFilterParam(QryBankInfoDtl,
        FloatToStr(EPlantID), False);
      QryBankInfoDtl.Filtered := True;
    end;
end;

procedure TFrmCCSettings.cmbCCBankIDCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  QryBankInfoDtl.Filter := '';
  QryBankInfoDtl.Filtered := False;
end;

procedure TFrmCCSettings.PostChanges;
begin
  if (QryAccount.State in [dsEdit, dsInsert]) then
    QryAccount.Post;
end;

procedure TFrmCCSettings.sbtnToggleTableFormViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmCCSettings.SrcAccountDataChange(Sender: TObject; Field: TField);
begin
  SetControls;
end;

procedure TFrmCCSettings.UniFormDestroy(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlCCLeft01]);
end;

procedure TFrmCCSettings.UniFormShow(Sender: TObject);
begin
  FGatewayChanged := False;
  FPrepared := False;
  FEPlantID := 0;
  inherited;
  FEncryptionButtonEnabled := False;
  FCanChangeBankID := False;
  FCardTypesButtonEnabled := False;
  IQMS.Common.Screen.ApplySystemFont(Self);
  FEPlantID := FEPlantID;
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  RefreshData;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlCCLeft01]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCCClient02);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCCClient02);
  // ensure the checkboxes hold all the text
  IQScrollBox1.VertScrollBar.Position := 0;
end;

procedure TFrmCCSettings.QryAccountIS_DEFAULTChange(Sender: TField);
begin
  if (QryAccount.State in [dsEdit, dsInsert]) then
    FIsDefaultChanged := True;
end;

procedure TFrmCCSettings.QryAccountAfterCancel(DataSet: TDataSet);
begin
  FIsDefaultChanged := False;
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
procedure TFrmCCSettings.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  if (QryAccountARCHIVED.AsString = 'Y') then
    ABrush.Color := shpArchived.Brush.Color;
end;}

procedure TFrmCCSettings.GridDblClick(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

function TFrmCCSettings.GetCardTypesButtonVisible: Boolean;
begin

end;

function TFrmCCSettings.GetEncryptionButtonVisible: Boolean;
begin
  Result := PnlEncryptionButton.Visible;
end;

procedure TFrmCCSettings.SetEncryptionButtonVisible(const Value: Boolean);
begin
  PnlEncryptionButton.Visible := Value;
end;

procedure TFrmCCSettings.SetCardTypesButtonVisible(const Value: Boolean);
begin
  PnlCreditCardLists.Visible := Value;
end;

procedure TFrmCCSettings.cmbCurrencyBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryCurrency);
end;

procedure TFrmCCSettings.sbtnFilterClick(Sender: TObject);
begin
  Application.ProcessMessages;
  RefreshData;
end;

procedure TFrmCCSettings.SetFilterBtnHint;
begin
  if sbtnFilter.Down then
    // 'Hide archived accounts.'#13'Currently showing archived accounts only.'
    sbtnFilter.Hint := iqsys_rscstr.cTXT0000087
  else
    // 'Show archived accounts.'#13'Currently hiding archived accounts.'
    sbtnFilter.Hint := iqsys_rscstr.cTXT0000088;
end;

procedure TFrmCCSettings.PMainPopup(Sender: TObject);
begin
  SetControls;
end;

end.
