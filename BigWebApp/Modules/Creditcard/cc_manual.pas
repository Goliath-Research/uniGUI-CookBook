unit cc_manual;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  dm_cc,
  IQMS.WebVcl.CaptionPanel,
  cc_types,
  cc_params,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.DropDownButton,
  Vcl.Menus,
  iqcc_utils,
  { TODO : cc_level3_dlg not yet converted }
  //cc_level3_dlg,
  cc_level3,
  IQMS.Common.PrincipalSourceTypes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniImageList,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniRadioGroup, uniComboBox, uniDBComboBox, uniMenuButton;

type
  { TFrmCCManual }
  TFrmCCManual = class(TUniForm)
    Panel1: TUniPanel;
    pcMain: TUniPageControl;
    TabTransaction: TUniTabSheet;
    TabCreditCard: TUniTabSheet;
    PnlFormCarrierCC: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft02: TUniPanel;
    Label14: TUniLabel;
    lblExpDate: TUniLabel;
    Label17: TUniLabel;
    lblCardBillingPostalCode: TUniLabel;
    lblType: TUniLabel;
    PnlFormCarrierCCClient: TUniPanel;
    txtCardNumber: TUniEdit;
    edtCustomerAddress: TUniEdit;
    cmbCreditCardType: TUniDBLookupComboBox;
    mskExpDate: TUniEdit;
    lblMMYY: TUniLabel;
    TabCustomer: TUniTabSheet;
    PnlClient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label13: TUniLabel;
    Label22: TUniLabel;
    dbeCustno: TUniEdit;
    TabSpecial: TUniTabSheet;
    PnlSpecialFieldsMain: TUniPanel;
    Splitter4: TUniSplitter;
    PnlLeft03: TUniPanel;
    PnlSpecialFieldsClient: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label10: TUniLabel;
    dbeInvoiceNo: TUniEdit;
    dbeOrderNo: TUniEdit;
    dbePONO: TUniEdit;
    PnlButtons: TUniPanel;
    CaptionPanel1: TIQWebCaptionPanel;
    CaptionPanel2: TIQWebCaptionPanel;
    cpSpecial: TIQWebCaptionPanel;
    TabFinish: TUniTabSheet;
    CaptionPanel5: TIQWebCaptionPanel;
    CardTypeImageList: TUniImageList;
    PnlButtonsRight: TUniPanel;
    btnClose: TUniBitBtn;
    btnBack: TUniBitBtn;
    btnNext: TUniBitBtn;
    btnFinish: TUniBitBtn;
    PnlEntryOption: TUniPanel;
    Bevel2: TUniPanel;
    rgEntryOption: TUniRadioGroup;
    PnlTransactionMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft04: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Bevel10: TUniPanel;
    lblTransactionID: TUniLabel;
    lblApprovalCode: TUniLabel;
    PnlTransactionClient: TUniPanel;
    Bevel4: TUniPanel;
    CaptionPanel4: TIQWebCaptionPanel;
    PnlFinish: TUniPanel;
    edtCustomerZip: TUniEdit;
    txtArcustoCompany: TUniEdit;
    edtAmount: TUniEdit;
    cmbDate: TUniDateTimePicker;
    sbtnSelectEmployee: TUniSpeedButton;
    dbeAuthorizedBy: TUniEdit;
    edtTransactionID: TUniEdit;
    edtApprovalCode: TUniEdit;
    QryCredCardLookup: TFDQuery;
    QryCredCardLookupDESCRIP: TStringField;
    QryCredCardLookupImageIndex: TBCDField;
    QryCurrency: TFDQuery;
    QryCurrencyDESCRIP: TStringField;
    QryCurrencySPOT_RATE: TFMTBCDField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyGLVALUE: TStringField;
    QryCurrencyCURR_SYMBOL: TStringField;
    QryCurrencyID: TBCDField;
    SR: TIQWebSecurityRegister;
    cmbTime: TUniDateTimePicker;
    Label3: TUniLabel;
    edtShipTo: TUniEdit;
    PShipTo: TUniPopupMenu;
    SelectShipToSubmenu1: TUniMenuItem;
    CustomerShippingLocations2: TUniMenuItem;
    InvoiceShippingLocations2: TUniMenuItem;
    SalesOrderShippingLocations2: TUniMenuItem;
    ClearShipTo1: TUniMenuItem;
    btnShipTo: TIQWebDropDownButton;
    lblTax: TUniLabel;
    edtTax: TUniEdit;
    chkTaxExempt: TUniCheckBox;
    lblFreight: TUniLabel;
    edtFreight: TUniEdit;
    lblTransactionDescription: TUniLabel;
    edtTransactionDescription: TUniEdit;
    sbtnClearTransactionDescription: TUniSpeedButton;
    lblCurrency: TUniLabel;
    cmbCurrency: TUniDBLookupComboBox;
    lblEPlant: TUniLabel;
    edtEPlantName: TUniEdit;
    sbtnSelectEPlant: TUniSpeedButton;
    PEplant: TUniPopupMenu;
    SelectEPlant1: TUniMenuItem;
    ClearEPlant1: TUniMenuItem;
    StatusBar: TUniStatusBar;
    btnTSysLevelAddendum: TUniButton;
    chkSettled: TUniCheckBox;
    Label7: TUniLabel;
    chkUpdateExpDate: TUniCheckBox;
    QryCredCardLookupID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure DoSelectInvoice(Sender: TObject);
    procedure DoSelectOrder(Sender: TObject);
    procedure DoSelectPO(Sender: TObject);
    procedure DoSelectCustomer(Sender: TObject);
    procedure DoSelectEmployee(Sender: TObject);
    procedure DoSelectCreditCard(Sender: TObject);
    procedure DoBeforeDropDown(Sender: TObject);
    procedure DoSelectBillTo(Sender: TObject);
    procedure DoWizardBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCredCardLookupCalcFields(DataSet: TDataSet);
    procedure rgEntryOptionClick(Sender: TObject);
    procedure edtAmountExit(Sender: TObject);
    procedure cmbCurrencyBeforeDropDown(Sender: TObject);
    procedure txtCardNumberExit(Sender: TObject);
    procedure DoSelectShipToByCustomer(Sender: TObject);
    procedure DoSelectShipToByInvoice(Sender: TObject);
    procedure DoSelectShipToBySalesOrder(Sender: TObject);
    procedure ClearShipTo1Click(Sender: TObject);
    procedure edtTaxExit(Sender: TObject);
    procedure edtFreightExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTSysLevelAddendumClick(Sender: TObject);
    procedure sbtnClearTransactionDescriptionClick(Sender: TObject);
    procedure SelectEPlant1Click(Sender: TObject);
    procedure ClearEPlant1Click(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure mskExpDateChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    DM: TCC_DM;
    FCreditCardAccountID, FArcustoCreditCardID, FCreditCardTransID,
      FArPrepostID, FOrdersID, FPO_ID, FEPlantID: Int64;
    FGateway: TCreditCardGateway; // in cc_types.pas
    FArcustoCreditCardNumber: string;
    FCreditCardParams: TCreditCardParams; // in cc_params.pas
    FSelectedCreditCardRec: TCreditCardRec;
    CustomerInfoRec: TCustomerSource;
    FLevel3Options: TLevel3Items;
    FIsLevel3OptionsDone: Boolean;
    FLastShipToAddress: string;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    function ValidateRequiredFields: Boolean;
    function CheckArcustoIDExistsBeforeShowingPicklist: Boolean;
    function GetTransactionDescription: string;
    procedure DoButtonClick(AWizardButton: Integer);
    procedure SetControls;
    procedure DoFinishAction;
    function GetCreditCardNumber: string;
    procedure SetCreditCardNumber(const Value: string);
    function GetEntryOption: Byte;
    procedure SetEntryOption(const Value: Byte);
    function ProcessExec: Boolean;
    function GetAuthorizeDate: TDateTime;
    function DoForce_EPaymentProcessor: Boolean;
    function GetInvoiceNumber: string;
    function GetOrderNumber: string;
    function GetPONumber: string;
    function EditLevel3: Boolean;
    function PromptLevel3Processing: Boolean;
    procedure SaveAddendum;
    function GetAmount: Real;
    procedure SetAmount(const Value: Real);
    function GetCreditCardType: TCreditCardType;
    procedure PopulateShipToRec(AShipToID: Real);
    function GetFreight: Real;
    function GetTax: Real;
    procedure SetFreight(const Value: Real);
    procedure SetTax(const Value: Real);
    function GetCurrencyCode: string;
    function GetShipFromZip: string;
    function GetShipToCountry: string;
    function GetShipToZip: string;
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: Vcl.Controls.THintInfo);
    procedure UpdateShipToAddress;
    procedure SetGatewaySettings;
    procedure UpdateEPlantName;
    function GetShipToCountry3DigitCode: string;
    function GetShipToCountry2CharCode: string;
    function GetShipToCountry3CharCode: string;
  public
    { Public declarations }
    destructor Destroy; override;
    procedure CreditCardExpiration(var AMonth, AYear: Integer);
  published
    { Published declarations }
    property CreditCardNumber: string read GetCreditCardNumber
      write SetCreditCardNumber;
    property EntryOption: Byte read GetEntryOption write SetEntryOption;
    property InvoiceNumber: string read GetInvoiceNumber;
    property OrderNumber: string read GetOrderNumber;
    property PONumber: string read GetPONumber;
    property Amount: Real read GetAmount write SetAmount;
    property Tax: Real read GetTax write SetTax;
    property Freight: Real read GetFreight write SetFreight;
    property CreditCardType: TCreditCardType read GetCreditCardType;
    property ShipFromZip: string read GetShipFromZip;
    property ShipToZip: string read GetShipToZip;
    property ShipToCountry: string read GetShipToCountry;
    property ShipToCountry3DigitCode: string read GetShipToCountry3DigitCode;
    property ShipToCountry3CharCode: string read GetShipToCountry3CharCode;
    property ShipToCountry2CharCode: string read GetShipToCountry2CharCode;
    property CurrencyCode: string read GetCurrencyCode;
  end;

function DoManualTransaction(var ANewID: Int64): Boolean;

const
  // 09/08/2009
  MAXVAL_TSYS_APPROVAL_CODE = 6;
  MAXVAL_TSYS_TRANSACTION_NUMBER = 100;

implementation

{$R *.dfm}


uses
  cc_encrypt,
  cc_epayment,
  cc_log,
  cc_pickcard,
  cc_rscstr,
  cc_share,
  cc_trans,
  cc_valid,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO : iqsecins has not been converted yet }
  //iqsecins,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.Mcshare,
  IQMS.WebVcl.PlantBase,
  IQMS.Common.Regional;

function DoManualTransaction( var ANewID: Int64): Boolean;
var
  LFrmCCManual : TFrmCCManual;
begin
  // Security
  if not TSecurityManager.IsSecuredComponentEnabled('FRMCCMANUAL',
    'FrmCCManual') then // IQMS.WebVcl.SecurityManager.pas
    begin
      // 'Insufficient rights.  Access denied.'
      cc_log.WriteToLog_ScreenAccessDenied('Manual Transaction',
        lsManualSettlement, cc_rscstr.cTXT0000281);
      // Display the exception
      raise Exception.Create(cc_rscstr.cTXT0000281);
    end;
  LFrmCCManual := TFrmCCManual.Create(UniGUIApplication.UniApplication);
  with LFrmCCManual do
  begin
    Result := ShowModal = mrOk;
    if Result then
      ANewID := FCreditCardTransID;
  end;
end;

procedure TFrmCCManual.FormCreate(Sender: TObject);
var
  AID: Real;
begin
  FCreditCardAccountID := 0;
  FCreditCardTransID := 0;
  FArcustoCreditCardID := 0;
  FLevel3Options := nil;
  FCreditCardParams := nil;
  FGateway := TCreditCardGateway(0);
  // create the DM, which is used mainly for picklists
  DM := TCC_DM.Create(Self);
  DM.Name := '';
  FSelectedCreditCardRec := TCreditCardRec.Create;
  // 06/20/2012 Update the package encryption keys so that
  // we can see data.
  cc_encrypt.ResetPackage;
  FEPlantID := SecurityManager.EPlant_ID_AsInteger;
  UpdateEPlantName;
  // set controls
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  CustomerInfoRec := TCustomerSource.Create(Self);
  WriteToLog_ScreenAccess(Caption, lsManualSettlement); // cc_log.pas
  // form

  { TODO : Incompatible types: 'TForm' and 'TFrmCCManual' }
  //CenterForm(Self); // iqctrl
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01, PnlLeft02, PnlLeft03,
    PnlLeft04]);
  // after show message
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  // 07/18/2007 Modify the edit mask according to the locale
{$WARN UNSAFE_CAST OFF}
  { TODO : TUniEdit has no member EditMask }
  //mskExpDate.EditMask := '!00' + FormatSettings.DateSeparator + '00;1;_';
{$WARN UNSAFE_CAST ON}
  dbeAuthorizedBy.Text := SecurityManager.UserName;
  cmbDate.DateTime := IQMS.Common.Dates.IQOracleAdjustedDate;
  cmbTime.DateTime := IQMS.Common.Dates.IQOracleAdjustedDateTime;
  IQSetTablesActiveEx(True, Self, '');
  // Currency
  AID := GetNativeCurrencyId;
  QryCurrency.Locate('ID', AID, []);

  { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
  {cmbCurrency.LookupValue := FloatToStr(AID);
  cmbCurrency.PerformSearch;    }
end;

procedure TFrmCCManual.FormActivate(Sender: TObject);
begin
  Application.OnShowHint := DoOnShowHint;
  IQHelp.AssignHTMLFile('CC.chm', 'CC.hhp'); // IQMS.Common.HelpHook.pas
end;

procedure TFrmCCManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint := nil;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01, PnlLeft02, PnlLeft03,
    PnlLeft04]);
end;

destructor TFrmCCManual.Destroy;
begin
  inherited Destroy;
end;

procedure TFrmCCManual.IQAfterShowMessage(var Msg: TMessage);
begin
  Self.BringToFront;
  { TODO : iqsecins has not been converted yet }
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmCCManual.mskExpDateChange(Sender: TObject);
begin
  SetControls;
end;

procedure TFrmCCManual.SetGatewaySettings;
begin
  // Updates the internal values for the gateway
  FCreditCardAccountID := cc_params.GetCreditCardAccountIDEx
    (QryCurrencyID.AsLargeInt, FEPlantID);
  if Assigned(FCreditCardParams) then
    FreeAndNil(FCreditCardParams);
  FCreditCardParams := TCreditCardParams.Create(Self, FCreditCardAccountID);
  // Get gateway information (which gateway are we using?)
  FGateway := cc_share.GetCreditCardGateway(QryCurrencyID.AsLargeInt);
  IQMS.Common.Controls.SetStatus(StatusBar, FCreditCardParams.AccountDescription, 0);
  if IQSysGatewayCanAuthOnly(FCreditCardAccountID) then
    // cc_rscstr.cTXT0000453 = 'Authorization';
    IQMS.Common.Controls.SetStatus(StatusBar, cc_rscstr.cTXT0000453, 1)
  else
    // cc_rscstr.cTXT0000469 = 'Sale';
    IQMS.Common.Controls.SetStatus(StatusBar, cc_rscstr.cTXT0000469, 1);
  if Assigned(FLevel3Options) then
    FreeAndNil(FLevel3Options);
  FLevel3Options := TLevel3Items.Create;
  // By default, this is checked if we allow only Sale transactions
  chkSettled.Checked := (FCreditCardParams.ChargeMethod = gcmSale) or
    (FGateway in [cgwFirstData]);
  // Show the check box only if we can settle
  // chkSettled.Visible := (FCreditCardParams.ChargeMethod = gcmAuthOnly);
end;

procedure TFrmCCManual.DoOnShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: Vcl.Controls.THintInfo);
begin
  with HintInfo do
    begin
      if HintControl = edtShipTo then
        HintStr := FLastShipToAddress;
    end;
end;

function TFrmCCManual.GetAuthorizeDate: TDateTime;
begin
  try
    //Result := Trunc(cmbDate.Date) + Frac(cmbTime.Time);
    Result := cmbDate.DateTime;
  except
    Result := Now();
  end;
end;

procedure TFrmCCManual.DoSelectInvoice(Sender: TObject);
var
  AID: Int64;
  ATotalAmount, ATaxAmount, AFreight: Real;
begin
  // Select AR Invoice
  if CheckArcustoIDExistsBeforeShowingPicklist and
    DM.SelectARPrepost(Trunc(CustomerInfoRec.ARCUSTO_ID), { var } AID) then
    begin
      // fill values
      FArPrepostID := AID;
      dbeInvoiceNo.Text := SelectValueFmtAsString
        ('SELECT invoice_no FROM arprepost WHERE id = %d', [AID]);
      edtTransactionDescription.Text := GetTransactionDescription;

      iqcc_utils.GetTotalToCharge(csARPrepost, AID, { var } ATotalAmount,
        ATaxAmount, AFreight);

      // cc_rscstr.cTXT0000688 = 'Overwrite transaction amount values?';
      if (((ATotalAmount > 0) or (ATaxAmount > 0) or (AFreight > 0)) and
        ((Amount > 0) or (Tax > 0) or (Freight > 0))) and
        (IQMS.Common.Dialogs.IQDialogChk(cc_rscstr.cTXT0000688,
        'CC Force Update Amounts', mtConfirmation, [mbYes, mbNo]) = mrNo) then
        Exit;

      { if Amount = 0 then } Amount := ATotalAmount;
      { if Tax = 0 then } Tax := ATaxAmount;
      { if Freight = 0 then } Freight := AFreight;

      SetControls;
    end;
end;

procedure TFrmCCManual.DoSelectOrder(Sender: TObject);
var
  AID: Int64;
  AOrderNo, APONO: string;
  ATotalAmount, ATaxAmount, AFreight: Real;
begin
  // Select Sales Order
  if CheckArcustoIDExistsBeforeShowingPicklist and
    DM.SelectOrder(Trunc(CustomerInfoRec.ARCUSTO_ID), AID, AOrderNo, APONO) then
    begin
      // fill values
      FOrdersID := AID;
      dbeOrderNo.Text := AOrderNo;
      edtTransactionDescription.Text := GetTransactionDescription;

      iqcc_utils.GetTotalToCharge(csOrders, AID, { var } ATotalAmount,
        ATaxAmount, AFreight);

      // cc_rscstr.cTXT0000688 = 'Overwrite transaction amount values?';
      if (((ATotalAmount > 0) or (ATaxAmount > 0) or (AFreight > 0)) and
        ((Amount > 0) or (Tax > 0) or (Freight > 0))) and
        (IQMS.Common.Dialogs.IQDialogChk(cc_rscstr.cTXT0000688,
        'CC Force Update Amounts', mtConfirmation, [mbYes, mbNo]) = mrNo) then
        Exit;

      { if Amount = 0 then } Amount := ATotalAmount;
      { if Tax = 0 then } Tax := ATaxAmount;
      { if Freight = 0 then } Freight := AFreight;

      SetControls;
    end;
end;

procedure TFrmCCManual.DoSelectPO(Sender: TObject);
begin
  // Select Purchase Order (PO)
  if not CheckArcustoIDExistsBeforeShowingPicklist then
    Exit;
  with DM.PkPO do
    if Execute then
      begin
        // fill values
        FPO_ID := System.Variants.VarAsType(GetValue('ID'), varInt64);
        dbePONO.Text := System.Variants.VarToStr(GetValue('PONO'));
        edtTransactionDescription.Text := GetTransactionDescription;

        SetControls;
      end;
end;

procedure TFrmCCManual.DoSelectCustomer(Sender: TObject);
var
  AShipToID: Real;
begin
  // Select Customer
  with DM.PkArcusto do
    if Execute then
      begin
        CustomerInfoRec.ARCUSTO_ID := System.Variants.VarAsType(GetValue('ID'), varInt64);
        CustomerInfoRec.ARCUSTO_CUSTNO := System.Variants.VarToStr(GetValue('CUSTNO'));
        CustomerInfoRec.ARCUSTO_COMPANY := System.Variants.VarToStr(GetValue('COMPANY'));
        CustomerInfoRec.ARCUSTO_ADDR1 := System.Variants.VarToStr(GetValue('ADDR1'));
        CustomerInfoRec.ARCUSTO_ADDR2 := System.Variants.VarToStr(GetValue('ADDR2'));
        CustomerInfoRec.ARCUSTO_ADDR3 := System.Variants.VarToStr(GetValue('ADDR3'));
        CustomerInfoRec.ARCUSTO_CITY := System.Variants.VarToStr(GetValue('CITY'));
        CustomerInfoRec.ARCUSTO_STATE := System.Variants.VarToStr(GetValue('STATE'));
        CustomerInfoRec.ARCUSTO_ZIP := System.Variants.VarToStr(GetValue('ZIP'));
        CustomerInfoRec.ARCUSTO_COUNTRY := System.Variants.VarToStr(GetValue('COUNTRY'));
        dbeCustno.Text := CustomerInfoRec.ARCUSTO_CUSTNO;
        txtArcustoCompany.Text := CustomerInfoRec.ARCUSTO_COMPANY;
        AShipToID := GetDefaultShipToID(CustomerInfoRec.ARCUSTO_ID);
        if (AShipToID > 0) and (CustomerInfoRec.SHIP_TO_ID = 0) then
          begin
            PopulateShipToRec(AShipToID);
            edtShipTo.Text := CustomerInfoRec.SHIP_TO_ATTN;
          end;
      end;
end;

procedure TFrmCCManual.DoSelectEmployee(Sender: TObject);
begin
  // Select Employee (Authorized By)
  with DM.PkEmployee do
    if Execute then
      dbeAuthorizedBy.Text := System.Variants.VarToStr(GetValue('USER_NAME'));
end;

procedure TFrmCCManual.DoSelectCreditCard(Sender: TObject);
begin
  // Select the Credit Card
  if not CheckArcustoIDExistsBeforeShowingPicklist then
    Exit;
  if cc_pickcard.SelectCreditCardEx(Trunc(CustomerInfoRec.ARCUSTO_ID),
    FCreditCardAccountID, FSelectedCreditCardRec) then
    begin
      FArcustoCreditCardID := Trunc(FSelectedCreditCardRec.ID);
      CreditCardNumber := FSelectedCreditCardRec.AccountNumber;
      mskExpDate.Text := cc_valid.GetValidMMYY(FSelectedCreditCardRec.Expires);
      edtCustomerAddress.Text := FSelectedCreditCardRec.CustomerAddress1;
      edtCustomerZip.Text := FSelectedCreditCardRec.CustomerPostalCode;
      cmbCreditCardType.Text := FSelectedCreditCardRec.CardDescription;
      { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
      //cmbCreditCardType.PerformSearch;
      SetControls;
    end;
end;

procedure TFrmCCManual.DoBeforeDropDown(Sender: TObject);
begin
  { TODO : TUniDBLookupComboBox has no member LookupValue and PerformSearch }
  {if TComponent(Sender) is TUniDBLookupComboBox then
    with TUniDBLookupComboBox(Sender) do
      if Assigned(LookupTable) then
        ReOpen(LookupTable);   }
end;

procedure TFrmCCManual.DoSelectBillTo(Sender: TObject);
var
  AID: Int64;
  A: Variant;
begin
  if CheckArcustoIDExistsBeforeShowingPicklist and
    DM.SelectCustomerBillTo(Trunc(CustomerInfoRec.ARCUSTO_ID),
    { var } AID) then
    begin
      // get Bill To fields
      A := SelectValueArrayFmt(
        'SELECT id, addr1, city, state, zip, attn FROM bill_to WHERE id = %d',
        [AID]);
      if System.Variants.VarArrayDimCount(A) = 0 then
        Exit;
      CustomerInfoRec.BILL_TO_ID := System.Variants.VarAsType(A[0], varInt64);
      CustomerInfoRec.BILL_TO_ADDR1 := System.Variants.VarToStr(A[1]);
      CustomerInfoRec.BILL_TO_CITY := System.Variants.VarToStr(A[2]);
      CustomerInfoRec.BILL_TO_STATE := System.Variants.VarToStr(A[3]);
      CustomerInfoRec.BILL_TO_ZIP := System.Variants.VarToStr(A[4]);
      CustomerInfoRec.BILL_TO_ATTN := System.Variants.VarToStr(A[5]);
      edtCustomerAddress.Text := CustomerInfoRec.BILL_TO_ADDR1;
      edtCustomerZip.Text := CustomerInfoRec.BILL_TO_ZIP;
    end;
end;

function TFrmCCManual.ValidateRequiredFields: Boolean;
var
  S: string;
begin
  // 12/29/2008 Allow zero and negative amounts.  Requested by Accessible.
  // if (not GetValidAmount(edtAmount.Text, sAmount, iAmount, rAmount) or (rAmount <= 0)) then
  // raise Exception.Create(cc_rscstr.cTXT0000249 {'Please enter an authorized amount.'});
  IQAssert(txtCardNumber.Text > '',
    cc_rscstr.cTXT0000246 { 'Please enter a credit card number.' } );
  IQAssert(cmbCreditCardType.Text > '',
    cc_rscstr.cTXT0000247 { 'Please select a credit card type.' } );
  IQAssert(mskExpDate.Text > '',
    cc_rscstr.cTXT0000248 { 'Please enter an expiration date.' } );
  // For TSYS, the Approval Code must be provided if this is to be a true,
  // "force" transaction.  "Force" transactions can be settled with the batch.
  if edtApprovalCode.Visible and (edtApprovalCode.Text = '') and
  { 'An approval code is required to settle.
    Do you want to enter an approval code?' }
    IQWarningYN(cc_rscstr.cTXT0000245) then
    System.SysUtils.Abort;
  // Transaction ID
  S := IQMS.Common.Numbers.sIIf((FGateway in [cgwTSYS, cgwMerchantESolutions]),
    { 'A Retrieval Reference # is required to settle.  Do you want to enter an
      Retrieval Reference #?' }
    cc_rscstr.cTXT0000243,
    { 'A Transaction/Reference # is required to settle.  Do you want to enter
      an Transaction/Reference #?' }
    cc_rscstr.cTXT0000244);
  if edtTransactionID.Visible and (edtTransactionID.Text = '') and
    IQWarningYN(S) then
    System.SysUtils.Abort;
  // 09/08/2009
  if (FGateway in [cgwTSYS, cgwMerchantESolutions]) then
    begin
      // cc_rscstr.cTXT0000687 = 'Value too large:';
      if Length(edtApprovalCode.Text) > MAXVAL_TSYS_APPROVAL_CODE then
        raise Exception.Create(cc_rscstr.cTXT0000687 + '  ' +
          lblApprovalCode.Caption);
      if Length(edtTransactionID.Text) > MAXVAL_TSYS_TRANSACTION_NUMBER then
        raise Exception.Create(cc_rscstr.cTXT0000687 + '  ' +
          lblTransactionID.Caption);
    end;
  // 11/09/2009
  if (FCreditCardParams.ProcessingClass in [pclLevel2, pclLevel3]) then
    begin
      if InvoiceNumber.IsEmpty and OrderNumber.IsEmpty and
        PONumber.IsEmpty then
        begin
          { CPS = "Custom Payment Service"
            "The Custom Payment Service (casually known as CPS) is Visa's
            regulations for the information that must be submitted with
            each transaction. Transactions must meet CPS criteria in order
            to qualify for lowest transaction processing fees available.
            This is similar to MasterCard’s Merit system."
            Quote from Web site:
            http://www.creditme.com/credit-card-glossary/detail/custom-payment-service/ }
          // cc_rscstr.cTXT0000684 =
          // 'You have not selected an Invoice number, ' +
          // 'Sales Order number, or PO number.  These values are used for ' +
          // 'the Purchase Identifier.  Failure to provide one of these values ' +
          // 'may result in a CPS downgrade and higher interchange rates.  ' +
          // 'Would you like to select a value before adding this charge?';
          Result := not IQConfirmYN(cc_rscstr.cTXT0000684);
          if not Result then
            Exit;
        end;

      // 10/24/2014
      // EIQ-4672 Credit Cards, Charge for Level 2 or 3, TSYS requires PO Number
      if PONumber.IsEmpty then
        begin
          // cc_rscstr.cTXT0000685 =
          // 'A PO number is required to qualify ' +
          // 'for corporate discounts.  Would you like to select a value ' +
          // 'before adding this charge?'
          Result := not IQConfirmYN(cc_rscstr.cTXT0000685);
          if not Result then
            Exit;
        end;

      if (FGateway = cgwSterling) and InvoiceNumber.IsEmpty then
        begin
          // cc_rscstr.cTXT0000686 = 'An Invoice number is required to qualify ' +
          // 'for corporate discounts.  Would you like to select a value ' +
          // 'before adding this charge?'
          Result := not IQConfirmYN(cc_rscstr.cTXT0000686);
          if not Result then
            Exit;
        end;

    end;
  Result := True;
end;

procedure TFrmCCManual.DoButtonClick(AWizardButton: Integer);
var
  i: Integer;
begin
  // Each wizard button calls this, pass the appropriate TWizardBtn value
  Application.ProcessMessages; // let the button click finish
  case AWizardButton of
    0: // Prior
      begin
        i := pcMain.ActivePageIndex - 1;
        if (i < 0) then
          Exit;
        // if not ARCUSTO.ID, then don't show Special fields
        if (CustomerInfoRec.ARCUSTO_ID = 0) and
          (pcMain.Pages[i] = TabSpecial) then
          i := TabCreditCard.PageIndex; // skip to credit card
        if i >= 0 then
          pcMain.ActivePageIndex := i;
      end;
    1: // Next
      begin
        i := pcMain.ActivePageIndex + 1; // next index
        if pcMain.ActivePage = TabCustomer then
          SetGatewaySettings;
        // if not ARCUSTO.ID, then prompt user
        if (CustomerInfoRec.ARCUSTO_ID = 0) and
          (pcMain.ActivePage = TabCustomer) and
        // 'A customer is required for some pick lists to display.  Do you want to select a customer?'
          IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000251) then
          System.SysUtils.Abort;
        // if not ARCUSTO.ID, then don't show Special fields
        if (CustomerInfoRec.ARCUSTO_ID = 0) and
          (pcMain.Pages[i] = TabCreditCard) then
          EntryOption := 1;
        // if not ARCUSTO.ID, then don't show Special fields
        if (CustomerInfoRec.ARCUSTO_ID = 0) and
          (pcMain.Pages[i] = TabSpecial) then
          i := TabTransaction.PageIndex; // skip to transaction
        if i < pcMain.PageCount then
          pcMain.ActivePageIndex := i;
      end;
    2: // Finish
      DoFinishAction; // see virtual method below
  end;
  SetControls;
end;

procedure TFrmCCManual.DoFinishAction;
begin
  if ValidateRequiredFields then
    begin
      if not ProcessExec then
        Exit;
      // 11/10/2009 Shouldn't happen, but we check
      if FCreditCardTransID = 0 then
        Exit;
      // 08/15/2006
      // cc_rscstr.cTXT0000701 = 'Transaction # %d has been added.';
      IQDialogChk(Format(cc_rscstr.cTXT0000701,
        [FCreditCardTransID]), 'CC_MANUAL_FINISH', mtInformation, [mbOk]);
      // iqmesg
      ModalResult := mrOk;
    end;
end;

function TFrmCCManual.ProcessExec: Boolean;
var
  AExpDate: string;
  AMonth, AYear: Integer;
  iAmount: Integer;
  sAmount: string;
  nAmount: Real;
  ACurrencyID: Real;
  ACode: string;
begin
  // Initialization
  Result := False;
  // Validation
  if not GetValidAmount(edtAmount.Text, sAmount, iAmount, nAmount) then
    // cc_rscstr.cTXT0000061 =
    // 'Could not update database.  Invalid number for amount.'
    raise Exception.Create(cc_rscstr.cTXT0000061);
  ParseMMYY(mskExpDate.Text, AExpDate, AMonth, AYear);
  if not (AMonth in [1 .. 12]) then
    // cc_rscstr.cTXT0000057 =
    // 'Not a valid month (01 to 12).  Please check the Expiration Date.'
    raise Exception.Create(cc_rscstr.cTXT0000057);
  // Convert it to native
  ACode := 'USD';
  if cc_share.IQSysGatewaySupportsCurrency(FCreditCardAccountID) then
    begin
      ACode := IQMS.Common.Mcshare.GetISO3CharCurrencyCode
        (FCreditCardParams.ParamByName('CURRENCY_CODE').AsString);
      if (ACode = '') then
        ACode := 'USD';
    end;
  ACurrencyID := QryCurrencyID.AsFloat;
  ACurrencyID := IQMS.Common.Mcshare.GetConversionCurrencyID(ACurrencyID);
  // For TSYS, now display the additional prompt for
  // Level 2 or 3 processing.
  if not PromptLevel3Processing then
    Exit;
  btnTSysLevelAddendum.Enabled := False;

  // Card expiration date - Save it, if it has changed.
  if (FSelectedCreditCardRec.ID > 0) and chkUpdateExpDate.Visible and
    chkUpdateExpDate.Checked then
    begin
      FSelectedCreditCardRec.Expires := mskExpDate.Text;
      FSelectedCreditCardRec.SaveExpirationDate;
    end;

  with TTransaction.Create(nil, FCreditCardAccountID) do // cc_trans.pas
    try
      Gateway := FGateway;
      GatewayURL := ''; // empty, since this is manual
      Manual := True;
      // Populate component properties
      with CreditCard do
        begin
          ID := FArcustoCreditCardID;
          AccountNumber := CreditCardNumber;
          CardDescription := cmbCreditCardType.Text;
          Expires := AExpDate;
          CustomerAddress1 := edtCustomerAddress.Text;
          CustomerPostalCode := edtCustomerZip.Text;
        end;
      AuthorizedDate := GetAuthorizeDate;
      BANKINFO_DTL_ID := FCreditCardParams.BankDetailID;
      ARPREPOST_ID := FArPrepostID;
      ORDERS_ID := FOrdersID;
      AuthorizedAmount := nAmount;
      CURRENCY_ID := ACurrencyID;
      PO_ID := FPO_ID;
      AssignCustomer(CustomerInfoRec);
      ResponseTransactionID := edtTransactionID.Text; // default
      ResponseApprovalCode := edtApprovalCode.Text;
      ResponseText := '';
      ResponseData := '';
      TransactionDescription := GetTransactionDescription;
      // Mark as settled (by default the Status will be ccsUnknown)
      // If the gateway must settle at the time of transaction,
      // then mark it as settled.
      if (FCreditCardParams.ParamByName('TRANSACTION_TYPE').AsInteger = 1) then
        // 10/26/2009 These lines remmed.  They were not working as originally
        // intended.
        // if not cc_share.IQSysGatewayCanAuthOnly or
        // not cc_share.IQSysGatewayCanSettle then
        begin
          Status := ccsSettled;
          StatusComment := cc_rscstr.cTXT0000313;
          // 'Settled at time of charge.';
          StatusAmount := AuthorizedAmount;
        end;
      // add the transaction record
      Execute;
      // Return values
      Self.FCreditCardTransID := TransactionID;
    finally
      Free;
    end;
  // 11/04/2009 Write any data for TSYS Level 2 or 3 processing.
  // By this point, we have a transaction id (FCreditCardTransID).
  SaveAddendum;
  Result := DoForce_EPaymentProcessor;
end;

function TFrmCCManual.DoForce_EPaymentProcessor: Boolean;
var
  AAmount: Real;
  AMonth, AYear: Integer;
  AApprovalCode, AResponseData, ALogDetails, AXMLRequest, AXMLResponse: string;
  AEPaymentProcessor: TEPaymentProcessor;
begin
  // ***  Force transaction for Vital PS  ***
  // NOTE:  All checks must be done before entering this method.
  // Forced transactions are transactions which have not
  // been authorized, but are added to the settlement
  // batch.
  Result := True;
  if (FCreditCardTransID = 0) then
    Exit(False);

  AApprovalCode := edtApprovalCode.Text;
  if AApprovalCode.IsEmpty then
    Exit(False);
  if not IQMS.Common.Numbers.IsStringValidFloat(edtAmount.Text, AAmount) then
    Exit(False);

  // 12/02/2014 If the gateway is not in the list that can force,
  // exit now.
  if not (FGateway in GatewaysThatCanForce) then
    // just pass true
    Exit(True);

  Self.CreditCardExpiration(AMonth, AYear);
  ALogDetails := 'Force (Manual) authorization.';
  try
    try
      // 12/02/2014 Create the EPayment Processor
      AEPaymentProcessor := CreateEPaymentProcessor(Self, FCreditCardAccountID);
      AEPaymentProcessor.TransactionID := cc_share.NextTransactionID(FGateway);
      AEPaymentProcessor.TransactionAmount := AAmount;
      AEPaymentProcessor.CreditCard.CustomerId :=
        FloatToStr(CustomerInfoRec.ARCUSTO_ID);
      AEPaymentProcessor.CreditCard.CardNumber := Self.CreditCardNumber;
      AEPaymentProcessor.CreditCard.CardType := Self.CreditCardType;
      AEPaymentProcessor.CreditCard.ExpireMonth := AMonth;
      AEPaymentProcessor.CreditCard.ExpireYear := AYear;
      AEPaymentProcessor.SalesOrderNumber := Self.OrderNumber;
      AEPaymentProcessor.SalesOrderID := Self.FOrdersID;
      AEPaymentProcessor.InvoiceNumber := ShortString(Self.InvoiceNumber);
      AEPaymentProcessor.PurchaseOrderNumber := ShortString(Self.PONumber);
      AEPaymentProcessor.TaxAmount := Self.Tax;
      AEPaymentProcessor.FreightAmount := Self.Freight;
      AEPaymentProcessor.Sender.PostalCode := ShortString(Self.ShipFromZip);
      AEPaymentProcessor.Destination.PostalCode := ShortString(Self.ShipToZip);
      AEPaymentProcessor.AssignDestinationCountry(Self.ShipToCountry);
      Result := AEPaymentProcessor.Force(AApprovalCode);
      AXMLRequest := AEPaymentProcessor.LastRequest;
      AXMLResponse := AEPaymentProcessor.LastResponse;
      ALogDetails := AEPaymentProcessor.Response.StatusDescription;
      // 05/30/2014 Remmed this because the epayment integrator always
      // writes to the log for each transaction.
      // cc_log.WriteToLog(FCreditCardAccountID, lsManualSettlement, ltTransaction,
      // ALogDetails, AXMLRequest, AXMLResponse, CustomerInfoRec.ARCUSTO_ID);
      Result := Result and AEPaymentProcessor.Response.Approved;
      if Result then
        begin
          AResponseData := AEPaymentProcessor.Response.ResponseData;
          ExecuteCommandParam(
            'UPDATE credit_card_trans                                   '#13 +
            '   SET response_approval_code = :RESPONSE_APPROVAL_CODE,   '#13 +
            '       response_transaction_id = :RESPONSE_TRANSACTION_ID  '#13 +
            ' WHERE id = :ID                                            ',
            ['RESPONSE_APPROVAL_CODE', 'RESPONSE_TRANSACTION_ID', 'ID;INT64'],
            [AApprovalCode, AEPaymentProcessor.Response.TransactionID,
            FCreditCardTransID]);
          // 10/20/2014 Update the response data separately
          cc_share.UpdateCreditCardTransResponseData(FCreditCardTransID,
            AResponseData);
          if chkSettled.Checked then
            cc_share.DoMarkAsSettled(FCreditCardTransID, 'MANUAL',
              AEPaymentProcessor.Response.StatusDescription);
        end
      else if not AEPaymentProcessor.Response.ErrorText.IsEmpty then
        IQMS.Common.Dialogs.IQError(AEPaymentProcessor.Response.ErrorText);
    finally
      if Assigned(AEPaymentProcessor) then
        FreeAndNil(AEPaymentProcessor);
    end;
  except
    on E: Exception do
      begin
        cc_log.WriteToLog(FCreditCardAccountID, lsManualSettlement,
          ltTransaction, 'Error adding force transaction:  ' + E.Message,
          AXMLRequest, AXMLResponse, CustomerInfoRec.ARCUSTO_ID);
        // raise any unexpected errors
        // cc_rscstr.cTXT0000437 = 'Error processing transaction.';
        ShowIqErrorMessage(cc_rscstr.cTXT0000437, E.Message, '');
        // IQMS.Common.ErrorDialog.pas
      end;
  end;
end;

procedure TFrmCCManual.SetControls;
begin
  // Basic wizard Vcl.Buttons
  btnBack.Enabled := (pcMain.ActivePageIndex > 0);
  btnNext.Enabled := (pcMain.ActivePageIndex >= 0) and
    (pcMain.ActivePageIndex < (pcMain.PageCount - 1));
  btnFinish.Enabled := (pcMain.ActivePageIndex = (pcMain.PageCount - 1));

  IQMS.Common.Controls.IQShowControl([lblTransactionID, edtTransactionID],
    FGateway in [cgwTSYS]);

  edtTransactionID.MaxLength :=
    iIIf((FGateway in [cgwTSYS, cgwMerchantESolutions]),
    MAXVAL_TSYS_TRANSACTION_NUMBER, 30); // set the field size
  edtApprovalCode.MaxLength :=
    iIIf((FGateway in [cgwTSYS, cgwMerchantESolutions]),
    MAXVAL_TSYS_APPROVAL_CODE, 30); // set the field size
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlTransactionClient);
  // 09/18/2009 Hide Approval Code for these gateways.
  // - PayPal does not use Approval Code.
  IQMS.Common.Controls.IQShowControl([lblApprovalCode, edtApprovalCode],
    not (FGateway = cgwPayPal));
  // Set controls based on entry option
  IQMS.Common.Controls.IQEnableControl([lblType, cmbCreditCardType], EntryOption = 1);
  // Fix up the credit card box
  txtCardNumber.ReadOnly := EntryOption = 0;

  { TODO : TUniEdit has no member ShowButton }
  //txtCardNumber.ShowButton := EntryOption = 0;
  txtCardNumber.Color := TColor(IQMS.Common.Numbers.iIIf(EntryOption = 0, clBtnFace,
    clWhite));
  txtCardNumber.Font.Color := TColor(IQMS.Common.Numbers.iIIf(EntryOption = 0, clBtnShadow,
    clBlack));
  // Fix up the credit card box
  edtCustomerAddress.ReadOnly := EntryOption = 0;

  { TODO : TUniEdit has no member ShowButton }
  //edtCustomerAddress.ShowButton := EntryOption = 0;
  edtCustomerAddress.Color := TColor(IQMS.Common.Numbers.iIIf(EntryOption = 0, clBtnFace,
    clWhite));
  edtCustomerAddress.Font.Color :=
    TColor(IQMS.Common.Numbers.iIIf(EntryOption = 0, clBtnShadow, clBlack));
  IQEnableControl([edtCustomerZip, lblCardBillingPostalCode], EntryOption = 1);
  // 04/11/2012 Enable the Level 3 Processing button.
  // This is available only for certain gateways, and if the level is set
  // in the parameters.
  btnTSysLevelAddendum.Visible :=
    (FCreditCardParams.ProcessingClass = pclLevel3) and
    (Self.CreditCardType in Level3CardTypes);
  // Now, if Level 3 is available for this account, only enable it
  // if the required information has been provided.  The end user should
  // see the button even if it is disabled -- sort of as a reminder that
  // more information is required.
  btnTSysLevelAddendum.Enabled := (CustomerInfoRec.ARCUSTO_ID > 0) and
    ((Self.FOrdersID > 0) or (Self.FArPrepostID > 0));
  // 09/26/2012 If the expiration date was changed manually, and this is a
  // customer card, then show the check box.  If the check box is checked,
  // then we save the expiration date when we charge the card.
  chkUpdateExpDate.Visible := (EntryOption = 0) and
    (FSelectedCreditCardRec.ID > 0) and
    (CompareText(FSelectedCreditCardRec.Expires,
    IQMS.Common.StringUtils.Numerics(mskExpDate.Text)) <> 0);
end;

procedure TFrmCCManual.DoWizardBtnClick(Sender: TObject);
var
  ATag: Integer;
begin
  // The tag should correspond to the ordinal value of the TWizardBtn type
  if Sender = nil then
    Exit;
  ATag := TComponent(Sender).Tag;
  if (ATag in [0 .. 2]) then
    DoButtonClick(ATag);
end;

function TFrmCCManual.CheckArcustoIDExistsBeforeShowingPicklist: Boolean;
begin
  // ARCUSTO.ID is required
  if CustomerInfoRec.ARCUSTO_ID = 0 then
    // 'Please select a customer.  Cannot display pick list.'
    raise Exception.Create(cc_rscstr.cTXT0000252);
  Result := True;
end;

procedure TFrmCCManual.QryCredCardLookupCalcFields(DataSet: TDataSet);
var
  o: TCreditCardType;
begin
  if (DataSet = nil) or not DataSet.Active or
    (DataSet.FindField('DESCRIP') = nil) or
    (DataSet.FieldByName('DESCRIP').AsString = '') then
    Exit;
  o := GetCardType(DataSet.FieldByName('DESCRIP').AsString); // in cc_types.pas
  QryCredCardLookupImageIndex.AsInteger := ImageMap[o]; // see cc_types.pas
end;

function TFrmCCManual.GetCreditCardNumber: string;
begin
  // Property "get" method for CreditCardNumber
  // If we are looking at the customer record, what displays will be only
  // masked text; so, we look at the last saved variable value.
  if EntryOption = 0 then
    Result := FArcustoCreditCardNumber
  else
    Result := txtCardNumber.Text;
end;

procedure TFrmCCManual.SetCreditCardNumber(const Value: string);
begin
  // Property "set" method for CreditCardNumber
  FArcustoCreditCardNumber := Value;
  if EntryOption = 0 then
    txtCardNumber.Text := cc_share.GetMaskedAccount(Value)
  else
    txtCardNumber.Text := Value;
end;

function TFrmCCManual.GetEntryOption: Byte;
begin
  // Property "get" method for EntryOption
  Result := rgEntryOption.ItemIndex;
end;

procedure TFrmCCManual.SetEntryOption(const Value: Byte);
var
  AOnClick: TNotifyEvent;
begin
  // Property "set" method for EntryOption
  try
    AOnClick := rgEntryOption.OnClick;
    rgEntryOption.OnClick := nil;
    rgEntryOption.ItemIndex := Value;
  finally
    rgEntryOption.OnClick := AOnClick;
    SetControls;
  end;
end;

procedure TFrmCCManual.rgEntryOptionClick(Sender: TObject);
begin
  // Allow click to finish
  Application.ProcessMessages;
  if (CustomerInfoRec.ARCUSTO_ID = 0) and (EntryOption = 0) then
    begin
      EntryOption := 1;
      // cc_rscstr.cTXT0000702 =
      // 'You have not selected a Customer.  You must enter the ' +
      // 'credit card information manually.';
      raise Exception.Create(cc_rscstr.cTXT0000702);
    end;
  // Prompt to clear fields
  // if ((txtCardNumber.Text > '') or
  // (edtCardholderName.Text > '')) then
  if (txtCardNumber.Text > '') then
    begin
      // 'Clear all charge fields, and switch entry option?'
      if IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000279) then
        begin
          // Clear the fields
          txtCardNumber.Clear;
          mskExpDate.Clear;
          // txtCVV2.Clear;
          // edtCardholderName.Clear;
        end
      else
        begin
          // Switch back
          EntryOption := IQMS.Common.Numbers.iIIf(EntryOption = 0, 1, 0);
          // And exit early
          Exit;
        end;
    end;
  SetControls;
end;

procedure TFrmCCManual.edtAmountExit(Sender: TObject);
var
  S: string;
  i: Integer;
  R: Real;
begin
  if not GetValidAmount(edtAmount.Text, S, i, R) then
    //cc_rscstr.cTXT0000052 = 'Invalid number for Amount.'
    raise Exception.Create(cc_rscstr.cTXT0000052);
  edtAmount.Text := S;
end;

procedure TFrmCCManual.cmbCurrencyBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryCurrency);
end;

procedure TFrmCCManual.CreditCardExpiration(var AMonth, AYear: Integer);
var
  MMYY: string;
begin
  cc_valid.ParseMMYY(mskExpDate.Text, MMYY, AMonth, AYear);
end;

procedure TFrmCCManual.txtCardNumberExit(Sender: TObject);
var
  cct: TCreditCardType;
  ccs: string;
  AID: Real;
begin
  // 09/18/2009 Lookup the card type based on the number

  { TODO : TUniDBLookupComboBox has no member LookupValue }
 { if (EntryOption = 1) and (cmbCreditCardType.LookupValue = '') then
    begin
      cct := cc_valid.PredictCreditCardType(CreditCardNumber);
      ccs := CardTypeName[cct];
      AID := SelectValueFmtAsFloat('SELECT a.id FROM credit_card a ' +
        'WHERE a.descrip = ''%s''', [ccs]);
      if AID = 0 then
        Exit;
      cmbCreditCardType.LookupValue := ccs;
      QryCredCardLookup.Locate('ID', AID, []);
    end;    }
end;

function TFrmCCManual.GetTransactionDescription: string;
var
  AResult: ShortString;
begin
  // Returns the default transaction description
  // Initial
  AResult := '';
  // Depending on the available special fields, pass the most
  // appropriate transaction description.
  if edtTransactionDescription.Visible and
    (Trim(edtTransactionDescription.Text) > '') then
    AResult := ShortString(Trim(edtTransactionDescription.Text))
  else if not InvoiceNumber.IsEmpty then
    AResult := ShortString(Format(cc_rscstr.cTXT0000261 { 'Invoice # %s' } ,
      [InvoiceNumber]))
  else if not OrderNumber.IsEmpty then
    AResult := ShortString(Format(cc_rscstr.cTXT0000262 { 'Order # %s' } ,
      [OrderNumber]))
  else if not PONumber.IsEmpty then
    AResult := ShortString(Format(cc_rscstr.cTXT0000301 { 'PO # %s' } ,
      [PONumber]));
  // Pass the result
  Result := ShortString(LeftStr(AResult, edtTransactionDescription.MaxLength));
end;

function TFrmCCManual.GetInvoiceNumber: string;
begin
  Result := dbeInvoiceNo.Text;
end;

function TFrmCCManual.GetOrderNumber: string;
begin
  Result := dbeOrderNo.Text;
end;

function TFrmCCManual.GetPONumber: string;
begin
  Result := dbePONO.Text;
end;

procedure TFrmCCManual.btnCloseClick(Sender: TObject);
begin
  // cc_rscstr.cTXT0000679 = 'Are you sure you want to close this form?  All changes ' +
  // 'will be lost.';
  if IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000679) then
    ModalResult := mrCancel;
end;

procedure TFrmCCManual.btnTSysLevelAddendumClick(Sender: TObject);
begin
  EditLevel3;
end;

function TFrmCCManual.PromptLevel3Processing: Boolean;
begin
  Result := True; // default
  // Do not display if we are in silent mode
  if cc_share.SilentMode then
    Exit;
  if (CustomerInfoRec.ARCUSTO_ID > 0) and btnTSysLevelAddendum.Visible and
    btnTSysLevelAddendum.Enabled and not FIsLevel3OptionsDone then
    Result := EditLevel3;
end;

function TFrmCCManual.EditLevel3: Boolean;
begin
  Result := True; // default to True, so we don't snag the processing
  // needlessly.  If True, then we don't need to bother
  // with the level X processing anyway.
  // Prompt for Level ? processing.
  // For Level 3 dialog box, see cc_level3_dlg.pas
  if (FCreditCardParams.ProcessingClass = pclLevel3) and
    (Self.CreditCardType in Level3CardTypes) and
    (CustomerInfoRec.ARCUSTO_ID > 0) then
    begin
      if not FIsLevel3OptionsDone then
        begin
          FLevel3Options.LocalTaxAmount := Self.Tax;
          FLevel3Options.LocalTaxExempt := chkTaxExempt.Checked;
        end;

      { TODO : cc_level3_dlg not yet converted }
      {Result := DoEditLevel3Options(Self, Self.FOrdersID, Self.FArPrepostID,
        CustomerInfoRec.ARCUSTO_ID, Self.Amount, Self.CreditCardType,
        FLevel3Options);   }
    end;
  FIsLevel3OptionsDone := Result;
end;

procedure TFrmCCManual.SaveAddendum;

  function _GetShipToCountryCode: string;
  begin
    // Initial value
    Result := '';
    // Validation
    if Self.ShipToCountry = '' then
      Exit;
    Result := Self.ShipToCountry;
    // Get value based on credit card type
    case Self.CreditCardType of
      ccVisa:
        Result := ShipToCountry3DigitCode;
      ccMasterCard:
        Result := ShipToCountry3CharCode;
    else
      // This should never happen because we always check before
      // entering this method.
    end;
  end;

begin
  // Initialization
  // Validation
  // By this stage, the main record should already be created
  if (FCreditCardTransID = 0) or
    not (FCreditCardParams.ProcessingClass = pclLevel3) then
    Exit;

  FLevel3Options.Source := csNone;
  FLevel3Options.ProcessingClass := FCreditCardParams.ProcessingClass;
  FLevel3Options.PurchaseOrderNumber := Self.PONumber;
  FLevel3Options.MerchantTaxID := cc_share.GetMerchantTaxID;
  FLevel3Options.SenderPostalCode := Self.ShipFromZip;
  FLevel3Options.DestinationPostalCode := Self.ShipToZip;
  FLevel3Options.DestinationCountryCode := _GetShipToCountryCode;
  FLevel3Options.SaveToTransaction(FCreditCardTransID);
end;

function TFrmCCManual.GetAmount: Real;
var
  R: Real;
begin
  Result := 0;
  if (Trim(edtAmount.Text) > '') and IQMS.Common.Numbers.IsStringValidFloat
    (edtAmount.Text, R) then
    Result := R;
end;

procedure TFrmCCManual.SetAmount(const Value: Real);
begin
  edtAmount.Text := FloatToStr(Value);
  FormatAmountText(edtAmount); // cc_share.pas
end;

function TFrmCCManual.GetCreditCardType: TCreditCardType;
begin
  Result := GetCardType(cmbCreditCardType.Text);
end;

procedure TFrmCCManual.DoSelectShipToByCustomer(Sender: TObject);
var
  AID: Int64;
begin
  if DM.SelectShipToForCustomer(Trunc(CustomerInfoRec.ARCUSTO_ID), { var } AID) then
    begin
      PopulateShipToRec(AID);
      edtShipTo.Text := CustomerInfoRec.SHIP_TO_ATTN;
    end;
end;

procedure TFrmCCManual.DoSelectShipToByInvoice(Sender: TObject);
var
  AID: Int64;
begin
  if DM.SelectShipToFromInvoice(Self.FArPrepostID, { var } AID) then
    begin
      PopulateShipToRec(AID);
      edtShipTo.Text := CustomerInfoRec.SHIP_TO_ATTN;
    end;
end;

procedure TFrmCCManual.DoSelectShipToBySalesOrder(Sender: TObject);
var
  AID: Int64;
begin
  if DM.SelectShipToFromOrder(Self.FOrdersID, { var } AID) then
    begin
      PopulateShipToRec(AID);
      edtShipTo.Text := CustomerInfoRec.SHIP_TO_ATTN;
    end;
end;

procedure TFrmCCManual.ClearShipTo1Click(Sender: TObject);
begin
  //cc_rscstr.cTXT0000288 = 'Clear shipping address?'
  if IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000288) then
    begin
      CustomerInfoRec.SHIP_TO_ID := 0;
      CustomerInfoRec.SHIP_TO_ATTN := '';
      CustomerInfoRec.SHIP_TO_ADDR1 := '';
      CustomerInfoRec.SHIP_TO_ADDR2 := '';
      CustomerInfoRec.SHIP_TO_ADDR3 := '';
      CustomerInfoRec.SHIP_TO_CITY := '';
      CustomerInfoRec.SHIP_TO_STATE := '';
      CustomerInfoRec.SHIP_TO_ZIP := '';
      CustomerInfoRec.SHIP_TO_COUNTRY := '';
      edtShipTo.Clear;
      FLastShipToAddress := '';
    end;
end;

procedure TFrmCCManual.PopulateShipToRec(AShipToID: Real);
begin
  // This method fills our record object (CustomerInfoRec) with the selected
  // shipping data
  with TFDQuery.Create(nil) do
    try
      // get the data
      Connection := UniMainModule.FDConnection1;
      SQL.Add(       'SELECT id,         ');
      SQL.Add(       '       attn,       ');
      SQL.Add(       '       addr1,      ');
      SQL.Add(       '       addr2,      ');
      SQL.Add(       '       addr3,      ');
      SQL.Add(       '       city,       ');
      SQL.Add(       '       state,      ');
      SQL.Add(       '       zip,        ');
      SQL.Add(       '       country     ');
      SQL.Add(       '  FROM ship_to     ');
      SQL.Add(Format(' WHERE id = %d     ',[Trunc(AShipToID)]));
      Open;
      // fill the record (declared under Private)
      with CustomerInfoRec do
        begin
          SHIP_TO_ID := FieldByName('ID').AsFloat;
          SHIP_TO_ATTN := Trim(FieldByName('ATTN').AsString);
          SHIP_TO_ADDR1 := Trim(FieldByName('ADDR1').AsString);
          SHIP_TO_ADDR2 := Trim(FieldByName('ADDR2').AsString);
          SHIP_TO_ADDR3 := Trim(FieldByName('ADDR3').AsString);
          SHIP_TO_CITY := Trim(FieldByName('CITY').AsString);
          SHIP_TO_STATE := Trim(FieldByName('STATE').AsString);
          SHIP_TO_ZIP := Trim(FieldByName('ZIP').AsString);
          SHIP_TO_COUNTRY := Trim(FieldByName('COUNTRY').AsString);
        end;
      UpdateShipToAddress;
    finally
      Free; // free query
    end;
end;

procedure TFrmCCManual.UpdateShipToAddress;
var
  ALines: TStringList;
  procedure _AddLn(AValue: string);
  begin
    if (Trim(AValue) > '') then
      ALines.Add(Trim(AValue));
  end;

begin
  FLastShipToAddress := '';
  if CustomerInfoRec.SHIP_TO_ID > 0 then
    begin
      ALines := TStringList.Create;
      try
        _AddLn(CustomerInfoRec.SHIP_TO_ATTN);
        _AddLn(CustomerInfoRec.SHIP_TO_ADDR1);
        _AddLn(CustomerInfoRec.SHIP_TO_ADDR2);
        _AddLn(CustomerInfoRec.SHIP_TO_ADDR3);
        _AddLn(ConcatCityStateZip(CustomerInfoRec.SHIP_TO_CITY,
          CustomerInfoRec.SHIP_TO_STATE, CustomerInfoRec.SHIP_TO_ZIP));
        _AddLn(CustomerInfoRec.ARCUSTO_COUNTRY);
        FLastShipToAddress := Trim(ALines.Text);
      finally
        FreeAndNil(ALines);
      end;
    end;
end;

function TFrmCCManual.GetTax: Real;
var
  R: Real;
begin
  Result := 0;
  if (Trim(edtTax.Text) > '') and IQMS.Common.Numbers.IsStringValidFloat
    (edtTax.Text, R) then
    Result := R;
end;

procedure TFrmCCManual.SetTax(const Value: Real);
begin
  edtTax.Text := FloatToStr(Value);
  FormatAmountText(edtTax);
end;

function TFrmCCManual.GetFreight: Real;
var
  R: Real;
begin
  Result := 0;
  if (Trim(edtFreight.Text) > '') and IQMS.Common.Numbers.IsStringValidFloat
    (edtFreight.Text, R) then
    Result := R;
end;

procedure TFrmCCManual.SetFreight(const Value: Real);
begin
  edtFreight.Text := FloatToStr(Value);
  FormatAmountText(edtFreight);
end;

procedure TFrmCCManual.edtTaxExit(Sender: TObject);
var
  S: string;
  i: Integer;
  R: Real;
begin
  if not GetValidAmount(edtTax.Text, S, i, R) then
    raise Exception.Create
      (cc_rscstr.cTXT0000182 { 'Invalid number for Tax.' } );
  edtTax.Text := S;
end;

procedure TFrmCCManual.edtFreightExit(Sender: TObject);
var
  S: string;
  i: Integer;
  R: Real;
begin
  if not GetValidAmount(edtFreight.Text, S, i, R) then
    raise Exception.Create
      (cc_rscstr.cTXT0000183 { 'Invalid number for Freight.' } );
  edtFreight.Text := S;
end;

function TFrmCCManual.GetCurrencyCode: string;
begin
  Result := FCreditCardParams.ParamByName('CURRENCY_CODE').AsString;
  if (Result = '') then
    Result := 'USD';
end;

function TFrmCCManual.GetShipFromZip: string;
begin
  // Ship From Zip
  Result := '';
  if SecurityManager.EPlant_ID_AsInteger > 0 then
    Result := SelectValueFmtAsString(
      'SELECT zip FROM eplant WHERE id = %d',
      [SecurityManager.EPlant_ID_AsInteger]);
  if Result = '' then
    Result := SelectValueAsString('SELECT zip FROM iqsys WHERE ROWNUM < 2');
end;

function TFrmCCManual.GetShipToCountry: string;
begin
  Result := CustomerInfoRec.ARCUSTO_COUNTRY;
  if Result = '' then
    Result := SelectValueAsString('SELECT country FROM iqsys WHERE ROWNUM < 2');
  Result := IQMS.Common.Regional.GetValidCountryName(Result);
end;

function TFrmCCManual.GetShipToCountry2CharCode: string;
var
  ACountry: string;
begin
  Result := '';
  ACountry := GetShipToCountry;
  if not ACountry.IsEmpty then
    Result := IQMS.Common.Regional.CountryCodeFor(ACountry, cctChr2);
end;

function TFrmCCManual.GetShipToCountry3CharCode: string;
var
  ACountry: string;
begin
  Result := '';
  ACountry := GetShipToCountry;
  if not ACountry.IsEmpty then
    Result := IQMS.Common.Regional.CountryCodeFor(ACountry, cctChr3);
end;

function TFrmCCManual.GetShipToCountry3DigitCode: string;
var
  ACountry: string;
begin
  Result := '';
  ACountry := GetShipToCountry;
  if not ACountry.IsEmpty then
    Result := IQMS.Common.Regional.CountryCodeFor(ACountry, cctDigit3);
end;

function TFrmCCManual.GetShipToZip: string;
begin
  Result := CustomerInfoRec.SHIP_TO_ZIP;
  if Result = '' then
    SelectValueFmtAsString(
      'SELECT TRIM(zip) AS zip FROM arcusto WHERE id = %d',
      [Trunc(CustomerInfoRec.ARCUSTO_ID)]);
end;

procedure TFrmCCManual.sbtnClearTransactionDescriptionClick(Sender: TObject);
begin
  edtTransactionDescription.Clear;
end;

procedure TFrmCCManual.SelectEPlant1Click(Sender: TObject);
var
  S: string;
begin
  // Select EPlant
  DoPickEPlant(S); // Plnt_Bas.pas
  if IQMS.Common.Numbers.IsStringValidInt64(S, FEPlantID) then
    UpdateEPlantName;
end;

procedure TFrmCCManual.UniFormDestroy(Sender: TObject);
begin
   Application.OnShowHint := nil;
  if Assigned(FCreditCardParams) then
    FreeAndNil(FCreditCardParams);
  if Assigned(FSelectedCreditCardRec) then
    FreeAndNil(FSelectedCreditCardRec);
end;

procedure TFrmCCManual.UpdateEPlantName;
begin
  edtEPlantName.Text := SelectValueFmtAsString
    ('SELECT name FROM eplant WHERE id = %d', [FEPlantID]);
end;

procedure TFrmCCManual.ClearEPlant1Click(Sender: TObject);
begin
  // Clear EPlant
  FEPlantID := 0;
  edtEPlantName.Clear;
end;

procedure TFrmCCManual.StatusBarResize(Sender: TObject);
var
  i, n, w: Integer;
begin
  n := 0;
  for i := 0 to StatusBar.Panels.Count - 1 do
    if i > 0 then
      begin
        Inc(n, StatusBar.Panels.Items[i].Width);
        Inc(n, 2);
      end;
  w := StatusBar.Width - n;
  StatusBar.Panels.Items[0].Width := w;
end;

end.
