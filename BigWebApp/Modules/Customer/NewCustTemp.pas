unit NewCustTemp;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  Vcl.wwDataInspector,
  IQMS.WebVcl.UDComboBox,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  TFrmCustTemplate = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    sbtnTableForm: TUniSpeedButton;
    sbSearch: TUniSpeedButton;
    wwDBGrid1: TIQUniGridControl;
    SrcTempl: TDataSource;
    QryTempl: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryTemplID: TBCDField;
    QryTemplTEMPLATE_NAME: TStringField;
    QryTemplTEMPLATE_DESCRIP: TStringField;
    QryTemplTERRITORY: TStringField;
    QryTemplINDUSTRY: TStringField;
    QryTemplFINANCE_CHARGE: TStringField;
    QryTemplTERMS_ID: TBCDField;
    QryTemplCREDIT_LIMIT: TBCDField;
    QryTemplSTATUS_ID: TStringField;
    QryTemplSTATEMENTS: TStringField;
    QryTemplCOMM_PCNT: TFMTBCDField;
    QryTemplSOURCE: TStringField;
    QryTemplSALESPEOPLE_ID: TBCDField;
    QryTemplDISCOUNT: TBCDField;
    QryTemplCURRENCY_ID: TBCDField;
    QryTemplAUTOINVOICE_TECHNIQUE: TStringField;
    QryTemplPS_DATE_ON_INVOICE: TStringField;
    QryTemplCOMMISSIONS_ID: TBCDField;
    QryTemplMIN_CHANGE_INTERVAL: TBCDField;
    QryTemplONE_PO_PER_PS: TStringField;
    QryTemplONE_SO_PER_PS: TStringField;
    QryTemplSAFETY_LEAD_TIME: TBCDField;
    QryTemplSHIP_FORECAST: TStringField;
    QryTemplQTY_PRICE_BREAK: TFMTBCDField;
    QryTemplAR_GLACCT_ID: TBCDField;
    QryTemplDUNNING_GROUP_ID: TBCDField;
    QryTemplDUNNING_EXCLUDE: TStringField;
    QryTemplDISTLIST: TStringField;
    QryTemplPS_PRESERVE_RAN: TStringField;
    QryTemplIS_INTERCOMP: TStringField;
    QryTemplCOC_REQUIRED: TStringField;
    QryTemplCUST_CREDIT_DAYS: TBCDField;
    QryTemplCUST_CREDIT_INCL_SHIP: TStringField;
    QryTemplCUST_CREDIT_INCL_SO: TStringField;
    QryTemplIS_MAKE_TO_ORDER: TStringField;
    QryTemplCREDIT_LIMIT_AUTOCALC: TStringField;
    QryTemplTRACKING_REQUIRED: TStringField;
    QryTemplREBATE_PARAMS_ID: TBCDField;
    QryTemplWEB_PAYMENT_TYPE: TStringField;
    QryTemplREF_TYPE: TStringField;
    PkTempl: TIQWebHPick;
    PkTemplID: TBCDField;
    PkTemplTEMPLATE_NAME: TStringField;
    PkTemplTEMPLATE_DESCRIP: TStringField;
    pcCustomerDetail: TUniPageControl;
    TabCredit: TUniTabSheet;
    sbCreditStatus: TUniScrollBox;
    Panel21: TUniPanel;
    Splitter8: TUniSplitter;
    Splitter9: TUniSplitter;
    PnlCredStatus01: TUniPanel;
    Splitter5: TUniSplitter;
    PnlCredStatusLeft01: TUniPanel;
    lblStatus: TUniLabel;
    lblTerms: TUniLabel;
    PnlCredStatusClient01: TUniPanel;
    dbcStatus: TUniDBComboBox;
    cmbTerms: TUniDBLookupComboBox;
    PnlCredStatus02: TUniPanel;
    Splitter6: TUniSplitter;
    PnlCredStatusLeft02: TUniPanel;
    lblSalesperson: TUniLabel;
    lblTerritory: TUniLabel;
    lblDunningGroup: TUniLabel;
    PnlCredStatusClient02: TUniPanel;
    cmbSalesperson: TUniDBLookupComboBox;
    dbeTerr: TIQWebUDComboBox;
    cmbDunningGroup: TUniDBLookupComboBox;
    chkExcludeDunning: TUniDBCheckBox;
    PnlCredStatus03: TUniPanel;
    Splitter7: TUniSplitter;
    PnlCredStatusLeft03: TUniPanel;
    lblCreditLimit: TUniLabel;
    lblDiscount: TUniLabel;
    lblCommission: TUniLabel;
    PnlCredStatusClient03: TUniPanel;
    dbeCreditLimit: TUniDBEdit;
    dbeDiscount: TUniDBEdit;
    DbeCommission: TUniDBEdit;
    DBTierDiscount: TUniDBCheckBox;
    TabAI: TUniTabSheet;
    Splitter11: TUniSplitter;
    PnlAutoInvoice01: TUniPanel;
    Splitter10: TUniSplitter;
    PnlAutoInvoiceLeft01: TUniPanel;
    Label28: TUniLabel;
    PnlAutoInvoiceClient01: TUniPanel;
    dbAI: TUniDBComboBox;
    chkPSDateOnInvoice: TUniDBCheckBox;
    PnlAutoInvoice02: TUniPanel;
    TabMisc: TUniTabSheet;
    sbMisc: TUniScrollBox;
    Panel4: TUniPanel;
    Splitter20: TUniSplitter;
    PnlMisc01: TUniPanel;
    Splitter16: TUniSplitter;
    PnlMiscLeft01: TUniPanel;
    Label13: TUniLabel;
    Label20: TUniLabel;
    Label68: TUniLabel;
    Label73: TUniLabel;
    Label21: TUniLabel;
    Label92: TUniLabel;
    Label129: TUniLabel;
    Label133: TUniLabel;
    Label134: TUniLabel;
    PnlMiscClient01: TUniPanel;
    SbRebateParam: TUniSpeedButton;
    SBGLAcct: TUniSpeedButton;
    wwDBMinCharge: TUniDBNumberEdit;
    dbeIndustry: TIQWebUDComboBox;
    dbeMiscSource: TUniDBEdit;
    dbeSafetyleadTime: TUniDBEdit;
    dbePriceBrkQty: TUniDBEdit;
    wwGlAcct: TUniDBLookupComboBox;
    DBRebateParam: TUniDBEdit;
    cmbWebPaymentType: TUniDBComboBox;
    DBRecPayType: TUniDBComboBox;
    PnlMisc02: TUniPanel;
    PnlMiscClient02: TUniPanel;
    dbchkOnePO: TUniDBCheckBox;
    dbchkOneSO: TUniDBCheckBox;
    dbchkPS_PreserveRAN: TUniDBCheckBox;
    DBCheckBox3: TUniDBCheckBox;
    dbchkMakeToOrder: TUniDBCheckBox;
    dbchkTrackingRequired: TUniDBCheckBox;
    cbCurrency: TUniDBLookupComboBox;
    LblCurrency: TUniLabel;
    dbchkCharge: TUniDBCheckBox;
    dbchkShipForecast: TUniDBCheckBox;
    dbchkStat: TUniDBCheckBox;
    SrcTerms: TDataSource;
    QryTerms: TFDQuery;
    QryTermsID: TBCDField;
    QryTermsDESCRIPTION: TStringField;
    QryTermsDAYS: TBCDField;
    QryTermsDISCOUNT: TBCDField;
    QryTermsDISCOUNT_DAYS: TBCDField;
    QryTermsECODE: TStringField;
    QryTermsEID: TBCDField;
    QryTermsEDATE_TIME: TDateTimeField;
    QryTermsECOPY: TStringField;
    QryTermsBASED_ON: TStringField;
    QryTermsEND_OF_MONTH: TStringField;
    QryTermsDAY_OF_MONTH: TBCDField;
    QryCommissions: TFDQuery;
    QryCommissionsDESCRIP: TStringField;
    QryCommissionsID: TBCDField;
    QryCommissionsCOMMISSION_PERCENT: TFMTBCDField;
    QryDunningGroup: TFDQuery;
    QryDunningGroupDESCRIP: TStringField;
    QryDunningGroupID: TBCDField;
    QryTemplUSE_DISCOUNT_TIER: TStringField;
    QryCurrency: TFDQuery;
    QryCurrencyDESCRIP: TStringField;
    QryCurrencySPOT_RATE: TFMTBCDField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyGLVALUE: TStringField;
    QryCurrencyCURR_SYMBOL: TStringField;
    QryCurrencyNATIVE_CURR: TStringField;
    QryCurrencyID: TBCDField;
    QryCurrencyECODE: TStringField;
    QryCurrencyEID: TBCDField;
    QryCurrencyEDATE_TIME: TDateTimeField;
    QryCurrencyECOPY: TStringField;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    PkRebateParams: TIQWebHPick;
    PkRebateParamsID: TBCDField;
    PkRebateParamsDESCRIP: TStringField;
    PkRebateParamsBASED_ON: TStringField;
    PkRebateParamsPERCENT: TFMTBCDField;
    PkRebateParamsFLAT_AMOUNT: TBCDField;
    PkRebateParamsEXCLUDE_COMMISSIONS: TStringField;
    PkRebateParamsCASH_BACK: TStringField;
    PkRebateParamsEFFECT_DATE: TDateTimeField;
    PkRebateParamsDEACTIVE_DATE: TDateTimeField;
    PkRebateParamsGLACCT_ID: TBCDField;
    PkRebateParamsACCT: TStringField;
    QryTemplRebateParam: TStringField;
    PopupMenu4: TUniPopupMenu;
    ClearRebateParameter1: TUniMenuItem;
    QryGlAcct: TFDQuery;
    QryGlAcctACCT: TStringField;
    QryGlAcctDESCRIP: TStringField;
    QryGlAcctEPLANT_ID: TBCDField;
    QryGlAcctID: TBCDField;
    Contents1: TUniMenuItem;
    PnlFormViewClient01: TUniPanel;
    PnlFormViewLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlFormViewClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dbeTemplateName: TUniDBEdit;
    dbeTemplateDescription: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryTemplAfterPost(DataSet: TDataSet);
    procedure QryTemplBeforePost(DataSet: TDataSet);
    procedure PkTemplIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    { TODO : TNavigateBtn NOT CONVERTED YET }
   // procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure sbSearchClick(Sender: TObject);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure SBGLAcctClick(Sender: TObject);
    procedure SbRebateParamClick(Sender: TObject);
    procedure QryTemplCalcFields(DataSet: TDataSet);
    procedure ClearRebateParameter1Click(Sender: TObject);
    procedure QryTemplCOMMISSIONS_IDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshQry;
  public
    { Public declarations }
  end;

procedure DoNewCustTempl;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;

procedure DoNewCustTempl;
var
  LFrmCustTemplate : TFrmCustTemplate;
begin
  LFrmCustTemplate := TFrmCustTemplate.Create(UniGUIApplication.UniApplication);
  LFrmCustTemplate.Show;
end;

{ TFrmCustTemplate }

procedure TFrmCustTemplate.FormShow(Sender: TObject);
begin
  New1.Visible := false;
  IQMS.Common.Controls.AdjustPageControlToParent(PC);
  PC.ActivePage := TabForm;
  pcCustomerDetail.ActivePage := TabCredit;
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlCredStatusClient01);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlCredStatusClient02);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlCredStatusClient03);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlAutoInvoiceClient01);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlMiscClient02);

  IQSetTablesActive( TRUE, self );
  try
    sbSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      //SysUtils.ABORT;
    end;
  end;

  IQRegFormRead( Self, [ Self, Panel2, PnlFormViewLeft01, wwDBGrid1, PnlCredStatusLeft01, PnlCredStatus01,
                         PnlCredStatusLeft02, PnlCredStatus02, PnlCredStatusLeft03, PnlAutoInvoiceLeft01,
                         PnlMiscLeft01, PnlMisc01 ]);
end;

procedure TFrmCustTemplate.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmGEN{CHM}, iqhtmGEN{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCustTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, Panel2, PnlFormViewLeft01, wwDBGrid1, PnlCredStatusLeft01, PnlCredStatus01,
                          PnlCredStatusLeft02, PnlCredStatus02, PnlCredStatusLeft03, PnlAutoInvoiceLeft01,
                          PnlMiscLeft01, PnlMisc01 ]);
end;

procedure TFrmCustTemplate.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmCustTemplate.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustTemplate.New1Click(Sender: TObject);
begin
{ TODO : TUniDBNavigator has no member BtnClick }
 // Nav.BtnClick(nbInsert);
end;

procedure TFrmCustTemplate.PkTemplIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmCustTemplate.QryTemplAfterPost(DataSet: TDataSet);
begin
{
  try
    QryTempl.DataBase.ApplyUpdates( [ QryTempl ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryTempl.Close;
      QryTempl.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmCustTemplate.QryTemplBeforePost(DataSet: TDataSet);
begin
  if QryTemplID.asFloat = 0 then
    QryTemplID.asFloat := GetNextID('ARCUSTO_TEMPLATE');

  if QryTemplCOMMISSIONS_ID.asFloat <> 0 then
    if SelectValueFmtAsFloat('select count(id) from commissions_detail where commissions_id = %f',
       [QryTemplCOMMISSIONS_ID.asFloat]) > 1 then
      if Abs(SelectValueFmtAsFloat('select sum(commission_percent) from commissions_detail where commissions_id = %f',
         [QryTemplCOMMISSIONS_ID.asFloat]) - QryTemplCOMM_PCNT.asFloat) > 0.00000000001 then
      begin
        if SelectValueFmtAsFloat('select sum(ratio) from COMMISSIONS_DETAIL where commissions_id = %f', [QryTemplCOMMISSIONS_ID.asFloat]) = 0 then
          IqWarning(Format('The Commission %% specified by the user (%f%%) does not amount to the total commissions.',
           [QryTemplCOMM_PCNT.asFloat]));
      end;


  if (QryTemplONE_SO_PER_PS.asString = 'Y') and (QryTemplONE_PO_PER_PS.asString = 'Y') then
     raise Exception.Create( 'One PO# per packslip and One SO# per packslip are mutually exclusive - both cannot be checked.' );

end;

procedure TFrmCustTemplate.QryTemplCalcFields(DataSet: TDataSet);
begin
  QryTemplRebateParam.asString := SelectValueFmtAsString('select descrip from rebate_params where id = %f', [QryTemplREBATE_PARAMS_ID.asfloat]);
end;

procedure TFrmCustTemplate.QryTemplCOMMISSIONS_IDChange(Sender: TField);
var
  APercent:Real;
begin
  APercent := SelectValueFmtAsFloat('select sum(commission_percent) from commissions_detail where commissions_id = %f',
                        [QryTemplCOMMISSIONS_ID.asFloat]);
  QryTemplCOMM_PCNT.asFloat := APercent;
end;

procedure TFrmCustTemplate.RefreshQry;
var
  AId:Real;
begin
  AId := QryTemplID.asFloat;
  QryTempl.Close;
  QryTempl.Open;
  QryTempl.Locate('ID', AId, []);
end;


procedure TFrmCustTemplate.SBGLAcctClick(Sender: TObject);
var
  AId:Real;
begin
  with PKAcct do
  if Execute then
  begin
    AId := GetValue('ID');
    if not (QryTempl.State in [dsEdit, dsInsert]) then
      QryTempl.edit;
    QryTemplAR_GLACCT_ID.asFloat := AId;
  end
end;

procedure TFrmCustTemplate.SbRebateParamClick(Sender: TObject);
var
  AId:Real;
begin
  with PkRebateParams do
  if Execute then
  begin
    AId := GetValue('ID');
    if not (QryTempl.State in [dsEdit, dsInsert]) then
      QryTempl.edit;
    QryTemplREBATE_PARAMS_ID.asFloat := AId;
  end
end;

procedure TFrmCustTemplate.sbSearchClick(Sender: TObject);
var
  aId:Real;
begin
  with PkTempl do
  if execute then
  begin
    aId := GetValue('ID');
    QryTempl.Locate('ID', aId, []);
  end
  else
    Abort;
end;

procedure TFrmCustTemplate.sbtnTableFormClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) then
    PC.ActivePage := TabForm
  else
    PC.ActivePage := TabGrid;
end;

procedure TFrmCustTemplate.SRAfterApply(Sender: TObject);
begin
{ TODO :  Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
 // IQMS.Common.Controls.AutoSizeNavBar(Nav);
end;

{ TODO : TNavigateBtn NOT CONVERTED YET }
{procedure TFrmCustTemplate.NavBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshQry;
    Abort;
  end;
end;   }

procedure TFrmCustTemplate.ClearRebateParameter1Click(Sender: TObject);
begin
  QryTempl.Edit;
  QryTemplREBATE_PARAMS_ID.Clear;
end;


procedure TFrmCustTemplate.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext ); //IQMS.Common.HelpHook.pas
end;

end.
