unit cc_custcards;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Wwdbdatetimepicker,
  dm_cc,
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
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniImageList,
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
  uniPageControl, IQUniGrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TFrmCustCredCard = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    sbtnCreditCards: TUniSpeedButton;
    sbtnTableForm: TUniSpeedButton;
    pcMain: TUniPageControl;
    tabGrid: TUniTabSheet;
    tabForm: TUniTabSheet;
    Grid: TIQUniGridControl;
    cmbCreditCardTypeGrid: TUniDBLookupComboBox;
    SrcArcustoCredCard: TDataSource;
    QryArcustoCredCard: TFDQuery;
    QryArcustoCredCardACCTNO: TStringField;
    QryArcustoCredCardNAME_ON: TStringField;
    QryArcustoCredCardEXP_MMYY: TStringField;
    QryArcustoCredCardIS_DEFAULT: TStringField;
    QryArcustoCredCardCREDIT_CARD_ID: TBCDField;
    QryArcustoCredCardID: TBCDField;
    QryArcustoCredCardARCUSTO_ID: TBCDField;
    QryCredCardLookup: TFDQuery;
    QryCredCardLookupDESCRIP: TStringField;
    QryCredCardLookupID: TBCDField;
    UpdateSQLArcustoCredCard: TFDUpdateSQL;
    SR: TIQWebSecurityRegister;
    sbtnValidate: TUniSpeedButton;
    PnlMain: TUniPanel;
    QryCredCardLookupCardType: TStringField;
    QryArcustoCredCardTypeDisplay: TStringField;
    QryCredCardLookupImageIndex: TBCDField;
    QryArcustoCredCardImageIndex: TBCDField;
    QryArcustoCredCardDESCRIP: TStringField;
    ImageList1: TUniImageList;
    Bevel2: TUniPanel;
    QryArcustoCredCardDecryptedAccount: TStringField;
    QryArcustoCredCardDecryptedName: TStringField;
    QryArcustoCredCardDecryptedExp: TStringField;
    PnlFormView: TUniPanel;
    PnlLabels: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Splitter1: TUniSplitter;
    PnlEditControls: TUniPanel;
    cmbCreditCardTypeForm: TUniDBLookupComboBox;
    chkDefault: TUniDBCheckBox;
    edtAccount: TUniEdit;
    edtName: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    race1: TUniMenuItem;
    N1: TUniMenuItem;
    PCardType: TUniPopupMenu;
    AcceptedCreditCards1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Options1: TUniMenuItem;
    PurgeExpiredCards1: TUniMenuItem;
    PurgeCreditCardData1: TUniMenuItem;
    PurgeLogData1: TUniMenuItem;
    QryArcustoCredCardEXPIRATION_DATE: TDateTimeField;
    QryArcustoCredCardIS_TOKEN: TStringField;
    QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID: TBCDField;
    mskExpDate: TUniEdit;
    Label5: TUniLabel;
    sbtnTokenize: TUniSpeedButton;
    N2: TUniMenuItem;
    TokenizeCurrentCreditCard1: TUniMenuItem;
    lblToken: TUniLabel;
    PnlGateway: TUniPanel;
    Splitter2: TUniSplitter;
    PnlTokenOptionsLeft01: TUniPanel;
    lblGateway: TUniLabel;
    PnlTokenOptionsClient01: TUniPanel;
    dbeGatewayDescrip: TUniDBEdit;
    QryArcustoCredCardGATEWAY: TBCDField;
    QryArcustoCredCardGATEWAY_DESCRIP: TStringField;
    Bevel1: TUniPanel;
    QryArcustoCredCardLAST_FOUR: TStringField;
    QryArcustoCredCardLAST_FOUR_MASKED: TStringField;
    SrcCredCard: TDataSource;
    procedure QryArcustoCredCardBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArcustoCredCardBeforeOpen(DataSet: TDataSet);
    procedure DoAcceptedCreditCardsClick(Sender: TObject);
    { TODO : TNavigateBtn not yet converted }
    //procedure CheckRefreshBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnValidateClick(Sender: TObject);
    procedure DoBasicCalcFields(DataSet: TDataSet);
    procedure QryArcustoCredCardAfterPost(DataSet: TDataSet);
    procedure QryArcustoCredCardAfterScroll(DataSet: TDataSet);
    procedure QryArcustoCredCardAfterOpen(DataSet: TDataSet);
    procedure QryArcustoCredCardCalcFields(DataSet: TDataSet);
    procedure DoNonDBAwareNumericOnlyKeyPress(Sender: TObject; var Key: Char);
    procedure DoNonDBAwareKeyPress(Sender: TObject; var Key: Char);
    procedure QryArcustoCredCardAfterCancel(DataSet: TDataSet);
    procedure DoEditControlChange(Sender: TObject);
    procedure QryArcustoCredCardNewRecord(DataSet: TDataSet);
    procedure Close1Click(Sender: TObject);
    procedure race1Click(Sender: TObject);
    procedure cmbCreditCardTypeFormBeforeDropDown(Sender: TObject);
    procedure edtAccountExit(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PurgeExpiredCards1Click(Sender: TObject);
    procedure PurgeCreditCardData1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure PurgeLogData1Click(Sender: TObject);
    procedure QryArcustoCredCardAfterInsert(DataSet: TDataSet);
    procedure SrcArcustoCredCardDataChange(Sender: TObject; Field: TField);
    procedure TokenizeCurrentCreditCard1Click(Sender: TObject);
    procedure QryArcustoCredCardBeforeInsert(DataSet: TDataSet);
    procedure QryArcustoCredCardBeforeDelete(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure EncryptToTableFields;
    procedure DecryptToScreen;
    function ValidateCurrentCard(const ARaiseError: Boolean;
      var AErrorMsg: string): Boolean;
    /// <summary> Update the "last four" fields for the current record.
    /// </summary>
    procedure ApplyLastFour;
    procedure SetControls;
    procedure CheckDeleteToken;
    procedure setvalue(const Value: Int64);
  protected
    DM: TCC_DM;
    FArcusto_ID: Int64;
    FGatewaysExistThatCanTokenize: Boolean;
  public
    { Public declarations }
  published
    property ArcustoID: Int64 read FArcusto_ID write setvalue;
  end;

procedure DoShowCustCreditCards(AArcusto_ID: Int64);

implementation

{$R *.DFM}



uses
  cc_add_credit_card,
  cc_cardtypes,
  cc_encrypt,
  cc_epayment,
  cc_log,
  cc_purgelog,
  cc_rscstr,
  cc_share,
  cc_types,
  cc_valid,
  IQMS.Common.Controls,
  IQMS.Common.FormFocus,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO : iqsecins not yet converted }
  //iqsecins,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.TrBase;

procedure DoShowCustCreditCards( AArcusto_ID: Int64);
var
  i: Integer;
  AForm: TFrmCustCredCard;
begin
  // Initialize ...
  AForm := nil;

  // First, find the instance of this form that has the same parameters
  { TODO : Incompatible types: 'TForm' and 'TFrmCustCredCard' }
  {for i := 0 to Screen.FormCount - 1 do
    if (Screen.Forms[i] is TFrmCustCredCard) then
      with TFrmCustCredCard(Screen.Forms[i]) do
        if (ArcustoID = AArcusto_ID) then
        begin
          AForm := TFrmCustCredCard(Screen.Forms[i]); // set variable
          Break; // form has been found!
        end;  }

  // A previous instance was not found, so go ahead and display this form
  if AForm = nil then
  begin
    AForm := TFrmCustCredCard.Create(UniGUIApplication.UniApplication);
    AForm.ArcustoID := AArcusto_ID;
  end;

  if AForm <> nil then
    with AForm do
    begin
      Show;
      // BringToFront;
      PostMessage(Handle, iq_AfterShowMessage, 0, 0);
    end;

end;

procedure TFrmCustCredCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, Grid, PnlLabels]);
end;

procedure TFrmCustCredCard.IQAfterShowMessage(var Msg: TMessage);
begin
  if Showing and edtName.CanFocus then
    edtName.SetFocus;
  { TODO : There is no overloaded version of 'ForceFormFocus' that can be called with these arguments }
  //IQMS.Common.FormFocus.ForceFormFocus(Self, ['THyperPick']);
end;

procedure TFrmCustCredCard.TokenizeCurrentCreditCard1Click(Sender: TObject);
var
  ACreditCardAccountID: Int64;
  AEPaymentProcessor: TEPaymentProcessor;
  ACustomer: TCustomerSource;
  ANewToken, AMsg, AOriginalCardNumber: string;
begin
  // 07/16/2014 create a token for the selected credit card

  // Post changes first
  if (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
    QryArcustoCredCard.Post;

  // Ensure the card is valid first
  ValidateCurrentCard(TRUE, AMsg);

  // Prompt for a merchant account
  if not DM.SelectMerchantAccountForTokenization( { var } ACreditCardAccountID)
  then
    Exit;

  AOriginalCardNumber := QryArcustoCredCardDecryptedAccount.AsString;

  // Tokenize the card
  ACustomer := TCustomerSource.Create(nil);
  try
    ACustomer.UpdateCustomer(Self.FArcusto_ID);
    AEPaymentProcessor := CreateEPaymentProcessor(Self, ACreditCardAccountID);
    try
      // 07/30/2014 If this is TSYS, ensure a transaction key has been generated
      TSYS_CheckCreateTransactionKey(AEPaymentProcessor,
        QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID.AsLargeInt);

      AEPaymentProcessor.TransactionAmount := 0.01;
      AEPaymentProcessor.CreditCard.CardNumber :=
        QryArcustoCredCardDecryptedAccount.AsString;
      AEPaymentProcessor.CreditCard.CustomerFullName :=
        QryArcustoCredCardNAME_ON.AsString;
      AEPaymentProcessor.CreditCard.ExpirationMMYY :=
        QryArcustoCredCardEXP_MMYY.AsString;
      AEPaymentProcessor.CreditCard.CardType := cc_types.GetCardType(
        QryArcustoCredCardDESCRIP.AsString);
      AEPaymentProcessor.CreditCard.CustomerCompany :=
        ACustomer.ARCUSTO_COMPANY;
      AEPaymentProcessor.CreditCard.CustomerAddress := ACustomer.ARCUSTO_ADDR1;
      AEPaymentProcessor.CreditCard.CustomerCity := ACustomer.ARCUSTO_CITY;
      AEPaymentProcessor.CreditCard.CustomerState := ACustomer.ARCUSTO_STATE;
      AEPaymentProcessor.CreditCard.CustomerCountry :=
        ACustomer.ARCUSTO_COUNTRY;
      AEPaymentProcessor.AddToken(ANewToken);
      if (AEPaymentProcessor.Response.StatusClass = rcSuccess) and
        (AEPaymentProcessor.Response.TokenStatusClass = trcSuccess) then
      begin
        // Update with the new data
        ExecuteCommandParam(
          'UPDATE arcusto_credit_card                               '#13 +
          '   SET acctno = :ACCTNO,                                 '#13 +
          '       is_token = ''Y'',                                 '#13 +
          '       credit_card_account_id = :CREDIT_CARD_ACCOUNT_ID  '#13 +
          ' WHERE id = :ID                                          ',
          ['ACCTNO;S', 'CREDIT_CARD_ACCOUNT_ID;INT64', 'ID;INT64'],
          [ANewToken, ACreditCardAccountID, QryArcustoCredCardID.AsLargeInt]);
        // Update the last four
        cc_share.UpdateLastFour(QryArcustoCredCardID.AsLargeInt,
          AOriginalCardNumber);
        // Refresh the dataset
        RefreshDataSetByID(QryArcustoCredCard);
      end
      else if (AEPaymentProcessor.Response.StatusClass <> rcSuccess) and
        not AEPaymentProcessor.Response.ErrorText.IsEmpty then
        raise Exception.Create(AEPaymentProcessor.Response.ErrorText)
      else if (AEPaymentProcessor.Response.TokenStatusClass = trcFailure) and
        not AEPaymentProcessor.Response.TokenStatusDescription.IsEmpty then
        raise Exception.Create
          (AEPaymentProcessor.Response.TokenStatusDescription)
      else
        // cc_rscstr.cTXT0000699 = 'Tokenization failed.';
        raise Exception.Create(cc_rscstr.cTXT0000699);
    finally
      FreeAndNil(AEPaymentProcessor);
    end;
  finally
    FreeAndNil(ACustomer);
  end;
end;

procedure TFrmCustCredCard.UniFormCreate(Sender: TObject);
begin
  DM := TCC_DM.Create(Self);
end;

procedure TFrmCustCredCard.Options1Click(Sender: TObject);
var
  s: string;
begin
  s := Trim(SelectValueFmtAsString(
    'SELECT company FROM arcusto WHERE id = %d',
    [Self.ArcustoID]));
  // cc_rscstr.cTXT0000506 = 'Purge Expired Cards for %s'
  PurgeExpiredCards1.Caption := Format(cc_rscstr.cTXT0000506, [s]);
  PurgeExpiredCards1.Enabled := SR.Enabled['PurgeExpiredCards1'] and
    not (QryArcustoCredCard.BOF and QryArcustoCredCard.EOF);
  // cc_rscstr.cTXT0000507 = 'Purge Credit Card Data for %s';
  PurgeCreditCardData1.Caption := Format(cc_rscstr.cTXT0000507, [s]);
  // cc_rscstr.cTXT0000509 = 'Purge Log Data for %s';
  PurgeLogData1.Caption := Format(cc_rscstr.cTXT0000509, [s]);
end;

procedure TFrmCustCredCard.PurgeCreditCardData1Click(Sender: TObject);
var
  s: string;
  hMsg: TPanelMesg;
begin
  s := Trim(SelectValueFmtAsString(
    'SELECT company FROM arcusto WHERE id = %d',
    [Self.ArcustoID]));
  { cc_rscstr.cTXT0000500 =
    'This action will delete all credit card data for customer, ' +
    '%s.  This includes credit cards and transaction history.  Do you want ' +
    'to continue?' }
  if not IQMS.Common.Dialogs.IQWarningYN(Format(cc_rscstr.cTXT0000500, [s])) then
    Exit;
  { cc_rscstr.cTXT0000505 =
    'Customer credit card data is about to be deleted.  Are ' +
    'you sure you want to proceed?' }
  if not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000505) then
    Exit;
  // cc_rscstr.cTXT0000504 =
  // 'Purging customer credit card data.  Please wait...';
  hMsg := hPleaseWait(cc_rscstr.cTXT0000504);
  try
    ExecuteCommandFmt('BEGIN iqms.cc.purge_customer_data(%d); END;',
      [Self.ArcustoID]);
    ReOpen(QryArcustoCredCard);
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;

  // cc_rscstr.cTXT0000503 = 'Done.';
  IQMS.Common.Dialogs.IQInformation(cc_rscstr.cTXT0000503);

end;

procedure TFrmCustCredCard.PurgeExpiredCards1Click(Sender: TObject);
var
  s: string;
  hMsg: TPanelMesg;
begin
  s := SelectValueFmtAsString(
    'SELECT company FROM arcusto WHERE id = %d',
    [Self.ArcustoID]);
  // cc_rscstr.cTXT0000501 =
  // 'Purge expired credit cards for customer, %s?'
  if not IQMS.Common.Dialogs.IQConfirmYN(Format(cc_rscstr.cTXT0000501, [s])) then
    Exit;

  // cc_rscstr.cTXT0000502 = 'Purging expired credit cards.  Please wait...';
  hMsg := hPleaseWait(cc_rscstr.cTXT0000502);
  try
    // First, for old data (prior to 01/2013), remove the encryption on
    // ARCUSTO_CREDIT_CARD.NAME_ON, and EXP_MMYY.
    cc_encrypt.ResetPackage;
    with TFDQuery.Create(nil) do
      try
        Connection := UniMainModule.FDConnection1;
        SQL.Add('SELECT a.id');
        SQL.Add('  FROM arcusto_credit_card a');
        SQL.Add(Format(' WHERE a.arcusto_id = %d AND ', [Self.ArcustoID]));
        SQL.Add('       a.exp_mmyy IS NOT NULL AND ');
        SQL.Add('       LENGTH(a.exp_mmyy) > 4');
        Open;
        while not EOF do
        begin
          ExecuteCommandFmt(
            'UPDATE arcusto_credit_card                                 '#13 +
            '   SET name_on =                                           '#13 +
            '          SUBSTRB(iqms.cc_encrypt.get_decrypted(name_on),  '#13 +
            '                  1,                                       '#13 +
            '                  60),                                     '#13 +
            '       exp_mmyy =                                          '#13 +
            '          SUBSTRB(iqms.cc_encrypt.get_decrypted(exp_mmyy), '#13 +
            '                  1,                                       '#13 +
            '                  5)                                       '#13 +
            'WHERE id = %d                                              ',
            [Fields[0].AsLargeInt]);
          Next;
        end;
      finally
        Free;
      end;

    // Purge expired cards
    ExecuteCommandFmt('BEGIN iqms.cc.purge_expired_cards_ex(%d); END;',
      [Self.ArcustoID]);
    ReOpen(QryArcustoCredCard);
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
  // cc_rscstr.cTXT0000503 = 'Done.';
  IQMS.Common.Dialogs.IQInformation(cc_rscstr.cTXT0000503);
end;

procedure TFrmCustCredCard.PurgeLogData1Click(Sender: TObject);
begin
  cc_purgelog.DoCCPurgeLogForCustomer(Self.ArcustoID);
end;

procedure TFrmCustCredCard.QryArcustoCredCardBeforeDelete(DataSet: TDataSet);
begin
  // If the card is a token, then it must first be deleted from the
  // gateway server.
  CheckDeleteToken;
end;

procedure TFrmCustCredCard.CheckDeleteToken;
var
  ACreditCardAccountID: Real;
  AEPaymentProcessor: TEPaymentProcessor;
  ACustomer: TCustomerSource;
  ANewToken, AMsg: string;
begin
  // 07/16/2014 create a token for the selected credit card

  // Post changes first
  if (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
    QryArcustoCredCard.Post;

  // If this is not a token, exit now.
  if (QryArcustoCredCardIS_TOKEN.AsString <> 'Y') or
    (QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID.AsLargeInt = 0) then
    Exit;

  // Delete the token
  ACustomer := TCustomerSource.Create(nil);
  try
    ACustomer.UpdateCustomer(Self.FArcusto_ID);
    AEPaymentProcessor := CreateEPaymentProcessor(Self,
      QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID.AsLargeInt);
    try
      // Exit if this gateway does not delete tokens from the gateway.
      if not (AEPaymentProcessor.Gateway in GatewaysThatSupportDeletingTokens)
      then
        Exit;
      AEPaymentProcessor.TransactionAmount := 0.01;
      AEPaymentProcessor.CreditCard.CardNumber :=
        QryArcustoCredCardACCTNO.AsString;
      AEPaymentProcessor.CreditCard.IsToken :=
        QryArcustoCredCardIS_TOKEN.AsString = 'Y';
      AEPaymentProcessor.CreditCard.CustomerFullName :=
        QryArcustoCredCardNAME_ON.AsString;
      AEPaymentProcessor.CreditCard.ExpirationMMYY :=
        QryArcustoCredCardEXP_MMYY.AsString;
      AEPaymentProcessor.CreditCard.CardType :=
        cc_types.GetCardType(QryArcustoCredCardDESCRIP.AsString);
      AEPaymentProcessor.CreditCard.CustomerCompany :=
        ACustomer.ARCUSTO_COMPANY;
      AEPaymentProcessor.CreditCard.CustomerAddress := ACustomer.ARCUSTO_ADDR1;
      AEPaymentProcessor.CreditCard.CustomerCity := ACustomer.ARCUSTO_CITY;
      AEPaymentProcessor.CreditCard.CustomerState := ACustomer.ARCUSTO_STATE;
      AEPaymentProcessor.CreditCard.CustomerCountry :=
        ACustomer.ARCUSTO_COUNTRY;
      AEPaymentProcessor.QueryToken;

      // If the query was successful, then go ahead and send a "delete" request.
      if (AEPaymentProcessor.Response.StatusClass = rcSuccess) and
        (AEPaymentProcessor.Response.TokenStatusClass = trcSuccess) then
      begin
        AEPaymentProcessor.DeleteToken;
        if (AEPaymentProcessor.Response.StatusClass = rcSuccess) and
          (AEPaymentProcessor.Response.TokenStatusClass = trcSuccess) then
        begin
          // Update with the new data
          ExecuteCommandParam(
            'UPDATE arcusto_credit_card SET acctno = :ACCTNO, ' +
            'is_token = ''Y'' WHERE id = :ID', ['ACCTNO;S', 'ID;INT64'],
            [ANewToken, QryArcustoCredCardID.AsLargeInt]);
          // Refresh the dataset
          RefreshDataSetByID(QryArcustoCredCard);
        end
        else if (AEPaymentProcessor.Response.StatusClass <> rcSuccess) and
          not AEPaymentProcessor.Response.ErrorText.IsEmpty then
          // cc_rscstr.cTXT0000697 = 'Cannot delete token from gateway server:';
          raise Exception.Create(cc_rscstr.cTXT0000697 + '  ' +
            AEPaymentProcessor.Response.ErrorText)
        else if (AEPaymentProcessor.Response.TokenStatusClass = trcFailure) and
          not AEPaymentProcessor.Response.TokenStatusDescription.IsEmpty then
          // cc_rscstr.cTXT0000697 = 'Cannot delete token from gateway server:';
          raise Exception.Create(cc_rscstr.cTXT0000697 + '  ' +
            AEPaymentProcessor.Response.TokenStatusDescription)
        else
          // cc_rscstr.cTXT0000698 = 'Cannot delete token from gateway server.';
          raise Exception.Create(cc_rscstr.cTXT0000698);
      end;
    finally
      FreeAndNil(AEPaymentProcessor);
    end;
  finally
    FreeAndNil(ACustomer);
  end;
end;

procedure TFrmCustCredCard.QryArcustoCredCardBeforeInsert(DataSet: TDataSet);
var
  ANewArcustoCreditCardID: Integer;
begin
  if DM.CountOfTokenizationMerchantAccounts > 0 then
  begin
    // see unit cc_add_credit_card.pas
    if TFrmCCAddCreditCard.DoAddNew(Self, FArcusto_ID,
      ANewArcustoCreditCardID) then
    begin
      ReOpen(QryArcustoCredCard);
      QryArcustoCredCard.Locate('ID', ANewArcustoCreditCardID, []);
    end;
    System.SysUtils.Abort;
  end;
end;

procedure TFrmCustCredCard.QryArcustoCredCardBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arcusto_id', FArcusto_ID);
end;

procedure TFrmCustCredCard.QryArcustoCredCardAfterScroll(DataSet: TDataSet);
begin
  DecryptToScreen;
end;

procedure TFrmCustCredCard.QryArcustoCredCardAfterOpen(DataSet: TDataSet);
begin
  DecryptToScreen;
end;

procedure TFrmCustCredCard.QryArcustoCredCardBeforePost(DataSet: TDataSet);
begin
  // Populate ID values
  if QryArcustoCredCardID.AsFloat = 0 then
    QryArcustoCredCardID.AsFloat := GetNextID('ARCUSTO_CREDIT_CARD');

  if QryArcustoCredCardARCUSTO_ID.AsLargeInt = 0 then
    QryArcustoCredCardARCUSTO_ID.AsLargeInt := FArcusto_ID;

  // Validation occurs after posting
  // Let's ensure the credit card number itself has no extra characters
  edtAccount.Text := cc_valid.TrimCreditCardNumber(edtAccount.Text);

  // Ensure values are supplied
  if (Trim(edtAccount.Text) = '') then
    // cc_rscstr.cTXT0000017 = 'Credit Card number required.'
    raise Exception.Create(cc_rscstr.cTXT0000017);

  if QryArcustoCredCardCREDIT_CARD_ID.AsFloat = 0 then
    // cc_rscstr.cTXT0000018 = 'Credit Card type required.'
    raise Exception.Create(cc_rscstr.cTXT0000018);

  if (Trim(mskExpDate.Text) = '') then
    // cc_rscstr.cTXT0000019 = 'Expiration date required.'
    raise Exception.Create(cc_rscstr.cTXT0000019);

 if (StrtoIntDef(Copy(Trim(mskExpDate.Text),1,2),15)>12) then
    raise Exception.Create(cc_rscstr.cTXT0000057);

  // 07/14/2014 Note:  for now, we update EXPIRATION_DATE using
  // the MMYY field.  In a future version, consider eliminating
  // the MMYY text field.
  QryArcustoCredCardEXPIRATION_DATE.AsDateTime := SelectValueFmtAsFloat(
    'SELECT iqms.cc.get_exp_date(''%s'') FROM DUAL',
    [QryArcustoCredCardEXP_MMYY.AsString]);

  // Check for unique contraint
  // Note:  Even if this is a token, still check it.  TSYS for example
  // uses a pattern in their tokens so that if you create a token with
  // the same credit card information, the token will be the same.
  cc_share.CheckCheckUniqueCustomerCreditCard(
    edtAccount.Text,
    QryArcustoCredCardARCUSTO_ID.AsFloat,
    QryArcustoCredCardCREDIT_CARD_ID.AsFloat,
    QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID.AsFloat,
    QryArcustoCredCardID.AsFloat);

  CheckCardHolderName(edtName.Text); // cc_share.pas

  if QryArcustoCredCardIS_DEFAULT.AsString = 'Y' then
    ExecuteCommandFmt(
      'UPDATE arcusto_credit_card SET is_default = NULL ' +
      'WHERE arcusto_id = %d AND id <> %d',
      [FArcusto_ID, QryArcustoCredCardID.AsLargeInt]);

  EncryptToTableFields;

end;

procedure TFrmCustCredCard.QryArcustoCredCardNewRecord(DataSet: TDataSet);
begin
  QryArcustoCredCardID.AsLargeInt := GetNextID('ARCUSTO_CREDIT_CARD');
end;

procedure TFrmCustCredCard.DoAcceptedCreditCardsClick(Sender: TObject);
begin
  DoAcceptedCreditCards; // cc_cardtypes.pas
  ReOpen(QryCredCardLookup);
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmCustCredCard.CheckRefreshBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID(TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    Abort;
  end;
end;  }

procedure TFrmCustCredCard.sbtnTableFormClick(Sender: TObject);
begin
  TogglePageControl(pcMain);
end;

procedure TFrmCustCredCard.FormShow(Sender: TObject);
begin
  DM.Name := '';
  try
    // 06/20/2012 Update the package encryption keys so that
    // we can see data.
    cc_encrypt.ResetPackage;

    AdjustPageControlToParent(pcMain, 1); // IQMS.Common.Controls.pas
    IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditControls);

    // 'Accessing Customer Credit Cards.  Please wait.';
    IQSetTablesActiveEx(TRUE, Self, cc_rscstr.cTXT0000271);
    IQRegFormRead(Self, [Self, Grid, PnlLabels]);
    // cc_rscstr.cTXT0000001 = 'Credit Cards - %s'
    Caption := Format(cc_rscstr.cTXT0000001,
      [SelectValueFmtAsString(
      'SELECT company FROM arcusto WHERE id = %d',
      [FArcusto_ID])]);
    WriteToLog_ScreenAccess(Caption, lsCustCards); // cc_log.pas

    cmbCreditCardTypeGrid.Visible := FALSE;
  { TODO : TIQUniGridControl has not member controltype }
  (*  Grid.ControlType.Clear;
    Grid.ControlType.Add('IS_DEFAULT;CheckBox;Y;N');
    Grid.ControlType.Add('TypeDisplay;CustomEdit;cmbCreditCardTypeGrid;F');
    Grid.ControlType.Add('ImageIndex;ImageIndex;Shrink To Fit');
    Grid.ControlType.Add('IS_TOKEN;CheckBox;Y;N');
    Grid.ApplySelected;

{$WARN UNSAFE_CAST OFF}
    mskExpDate.EditMask := '!00' + FormatSettings.DateSeparator + '00;0;_';     *)
{$WARN UNSAFE_CAST ON}
    FGatewaysExistThatCanTokenize := DM.CountOfTokenizationMerchantAccounts > 0;

    PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  except
    on E: Exception do
      IQError(E.Message);
  end;
  SetControls;
  { TODO : iqsecins not yet converted }
  //EnsureSecurityInspectorOnTopOf(Self); // iqsecins.pas
end;

procedure TFrmCustCredCard.sbtnValidateClick(Sender: TObject);
var
  AMsg: string;
begin
  if (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
  begin
    QryArcustoCredCard.Post; // exception will be raised if there are errors
    // cc_rscstr.cTXT0000700 = 'Card is valid.';
    IQInformation(cc_rscstr.cTXT0000700);
  end
  else if ValidateCurrentCard(TRUE, AMsg) then
    // cc_rscstr.cTXT0000700 = 'Card is valid.';
    IQInformation(cc_rscstr.cTXT0000700);
end;

function TFrmCustCredCard.ValidateCurrentCard(const ARaiseError: Boolean;
  var AErrorMsg: string): Boolean;
var
  AType: TCreditCardType;
  AAcct: string;
begin
  AType := cc_types.GetCardType(QryArcustoCredCardDESCRIP.AsString);
  AAcct := edtAccount.Text;
  if QryArcustoCredCardIS_TOKEN.AsString = 'Y' then
    AAcct := TestCreditCardNumber[AType];
  // Validate the card
  Result := cc_valid.ValidateCreditCardA(AAcct,
    mskExpDate.Text, // Expiration Date
    QryArcustoCredCardDESCRIP.AsString, // Credit Card Type
    QryArcustoCredCardIS_TOKEN.AsString = 'Y',
    AErrorMsg, // Error message, if any
    TRUE); // Yes, raise error, if any
end;

procedure TFrmCustCredCard.QryArcustoCredCardCalcFields(DataSet: TDataSet);
begin
  DoBasicCalcFields(DataSet);
  QryArcustoCredCardDecryptedAccount.AsString :=
    cc_encrypt.CCKeyDecrypt(QryArcustoCredCardACCTNO.AsString);
  QryArcustoCredCardDecryptedName.AsString :=
    cc_encrypt.CCKeyDecrypt(QryArcustoCredCardNAME_ON.AsString);
  QryArcustoCredCardDecryptedExp.AsString :=
    cc_encrypt.CCKeyDecrypt(QryArcustoCredCardEXP_MMYY.AsString);
end;

procedure TFrmCustCredCard.DoBasicCalcFields(DataSet: TDataSet);

  procedure _setCalcFldVals(const ACardType: string;
    const AImageIndex: Integer);
  begin
    if DataSet.FindField('CARDTYPE') <> nil then
      DataSet.FieldByName('CARDTYPE').AsString := ACardType;
    if DataSet.FindField('IMAGEINDEX') <> nil then
      DataSet.FieldByName('IMAGEINDEX').AsInteger := AImageIndex;
  end;

var
  o: TCreditCardType;
begin
  if (DataSet = nil) or not DataSet.Active or
    (DataSet.FindField('DESCRIP') = nil) or
    (DataSet.FieldByName('DESCRIP').AsString = '') then
    Exit;

  o := GetCardType(DataSet.FieldByName('DESCRIP').AsString); // in cc_types.pas
  _setCalcFldVals(CardTypeDisplayName[o], ImageMap[o]); // see cc_types.pas
end;

procedure TFrmCustCredCard.QryArcustoCredCardAfterPost(DataSet: TDataSet);
var
  AMsg: string;
begin
  ApplyLastFour;
  RefreshDataSetByID(QryArcustoCredCard);
  ValidateCurrentCard(TRUE, AMsg);
end;

procedure TFrmCustCredCard.ApplyLastFour;
var
  AAccount, ALastFour, ALastFourMasked: string;
begin
  // Don't execute this for tokens because a token can be a random
  // string of numbers and letters.
  if (QryArcustoCredCardID.AsLargeInt > 0) and
    (QryArcustoCredCardIS_TOKEN.AsString <> 'Y') then
  begin
    cc_share.UpdateLastFour(QryArcustoCredCardID.AsLargeInt,
      QryArcustoCredCardDecryptedAccount.AsString);
  end;
end;

procedure TFrmCustCredCard.DecryptToScreen;
var
  s: string;
begin
  if (QryArcustoCredCardIS_TOKEN.AsString = 'Y') then
    ForceValue(edtAccount, QryArcustoCredCardLAST_FOUR_MASKED.AsString)
  else
    ForceValue(edtAccount, QryArcustoCredCardDecryptedAccount.AsString);
  ForceValue(edtName, QryArcustoCredCardDecryptedName.AsString);
  s := QryArcustoCredCardDecryptedExp.AsString;
  try
    mskExpDate.OnChange := nil;
    mskExpDate.Text := s;
  finally
    mskExpDate.OnChange := DoEditControlChange;
  end;
end;

procedure TFrmCustCredCard.EncryptToTableFields;
begin
  if (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
  begin
    if (QryArcustoCredCardIS_TOKEN.AsString <> 'Y') then
      QryArcustoCredCardACCTNO.AsString :=
        cc_encrypt.CCKeyEncrypt(edtAccount.Text);
    QryArcustoCredCardNAME_ON.AsString := edtName.Text;
    QryArcustoCredCardEXP_MMYY.AsString := mskExpDate.Text;
  end;
end;

procedure TFrmCustCredCard.DoNonDBAwareNumericOnlyKeyPress(Sender: TObject;
  var Key: Char);
const
  BACKSPACE_KEY = #8;
  EDIT_PASTE = #22;
begin
  if not System.SysUtils.CharInSet(Key, ['0' .. '9', BACKSPACE_KEY, EDIT_PASTE])
  then
    Key := #0
  else
    DoNonDBAwareKeyPress(Sender, Key);
end;

procedure TFrmCustCredCard.DoNonDBAwareKeyPress(Sender: TObject; var Key: Char);
var
  AReadOnly: Boolean;
begin
  AReadOnly := FALSE;
  { TODO : TCustomedit is vcl }
  {if Sender is TCustomEdit then
    AReadOnly := TCustomEdit(Sender).ReadOnly;   }

  if not AReadOnly and not (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
    QryArcustoCredCard.Edit;
end;

procedure TFrmCustCredCard.QryArcustoCredCardAfterCancel(DataSet: TDataSet);
begin
  DecryptToScreen;
end;

procedure TFrmCustCredCard.QryArcustoCredCardAfterInsert(DataSet: TDataSet);
begin
  if Showing and edtName.CanFocus then
    edtName.SetFocus;
end;

procedure TFrmCustCredCard.DoEditControlChange(Sender: TObject);
begin
  if not (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
    QryArcustoCredCard.Edit;
end;

procedure TFrmCustCredCard.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCustCredCard.race1Click(Sender: TObject);
begin
  DoShowTrace('ARCUSTO_CREDIT_CARD', QryArcustoCredCardID.AsLargeInt);
  // TR_Base.pas
end;

procedure TFrmCustCredCard.cmbCreditCardTypeFormBeforeDropDown(Sender: TObject);
begin
  ReOpen(QryCredCardLookup);
end;

procedure TFrmCustCredCard.edtAccountExit(Sender: TObject);
var
  ACreditCardType: TCreditCardType;
  tmp: string;
begin
  // 05/20/2010 Predict the credit card type
  ACreditCardType := PredictCreditCardType(edtAccount.Text);
  if not (ACreditCardType = ccUnknown) and
    (QryArcustoCredCard.State in [dsEdit, dsInsert]) then
  begin
    tmp := CardTypeName[ACreditCardType];
    QryCredCardLookup.Locate('DESCRIP', tmp, [loCaseInsensitive]);
    cmbCreditCardTypeForm.Text := QryCredCardLookupCardType.AsString;
    { TODO : TUniDBLookupComboBox has not member performsearch }
    //cmbCreditCardTypeForm.PerformSearch;
  end;
end;

procedure TFrmCustCredCard.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile('CC.chm', 'CC.hhp'); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCustCredCard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCustCredCard.SrcArcustoCredCardDataChange(Sender: TObject;
  Field: TField);
begin
  SetControls;
end;

procedure TFrmCustCredCard.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([sbtnTokenize, TokenizeCurrentCreditCard1],
    FGatewaysExistThatCanTokenize and
    (QryArcustoCredCardIS_TOKEN.AsString <> 'Y'));
  IQMS.Common.Controls.IQReadOnlyControl([edtAccount, cmbCreditCardTypeForm,
    edtName, mskExpDate],
    QryArcustoCredCardIS_TOKEN.AsString = 'Y');
  PnlGateway.Visible := QryArcustoCredCardIS_TOKEN.AsString = 'Y';
  lblToken.Visible := QryArcustoCredCardIS_TOKEN.AsString = 'Y';
end;

procedure TFrmCustCredCard.setvalue(const Value: Int64);
begin
  FArcusto_ID := Value;
end;

end.
