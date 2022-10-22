unit cc_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  MaskUtils,
  System.DateUtils,
  cc_types,
  cc_params,
  cc_epayment,
  cc_level3,
  IQMS.Common.PrincipalSourceTypes,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.Common.VerticalParam,
  MainModule,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit;

{$REGION 'Card Types'}
// Validation:  Have credit card types been selected.  If this function
// returns false, then we cannot allow end-users to charge cards.
// It all starts here.
function CardTypesConfigured: Boolean;
// If card types have not been selected, inform the user.
function CheckCardTypesConfigured: Boolean;
{$ENDREGION 'Card Types'}

/// <summary>  Raise an exception if these credit card values already
/// exist in ARCUSTO_CREDIT_CARD.  The last parameter is the ID value
/// of the ARCUSTO_CREDIT_CARD being edited.
/// </summary>
procedure CheckCheckUniqueCustomerCreditCard(const ACreditCardNumber: string;
  const AArcustoID, ACreditCardID, ACreditCardAccountID,
  ACurrentArcustoCreditCardID: Real);

// Create the EPayment Processor component.  The class type of the
// return object will reflect the correct class for the credit card
// account ID.
function CreateEPaymentProcessor(const AOwner: TComponent;
  const ACreditCardAccountID: Real): TEPaymentProcessor;
procedure PopulateEPaymentProcessorByTransactionID(
  EPaymentProcessor: TEPaymentProcessor; ATransactionID: Integer);

procedure TSYS_CheckCreateTransactionKey(
  AEPaymentProcessor: TEPaymentProcessor; ACreditCardAccountID: Int64);
function TSYS_CreateTransactionKey(
  AEPaymentProcessor: TEPaymentProcessor; ACreditCardAccountID: Int64;
  var AErrorText: string): Boolean;

/// <summary> Update the "last four" fields for the give ARCUSTO_CREDIT_CARD.ID,
/// using the provided credit card account number (PAN).
/// </summary>
procedure UpdateLastFour(const AArcustoCreditCardID: Real;
  const AAccount: string);
/// <summary> Update the "last four" fields for the give ARCUSTO_CREDIT_CARD.ID,
/// using the provided values.
/// </summary>
procedure UpdateLastFourAs(const AArcustoCreditCardID: Real; const ALastFour,
  ALastFourMasked: string);

{$REGION 'Transaction Number'}
{ Transaction Number - returns a unique number from an Oracle sequence.  The
  value has different applications, depending on the gateway. }
function NextTransactionID: UInt64; overload;
function NextTransactionID(const ADigits: Integer)
  : ShortString; overload;
function NextTransactionID(const AGateway: TCreditCardGateway)
  : ShortString; overload;
function NextReferenceNumber(const AGateway: TCreditCardGateway)
  : ShortString;

// Returns the next STAN for gateway FirstData.  Uses special sequence.
function GetNextFirstDataSTAN: Integer;
{$ENDREGION 'Transaction Number'}

{$REGION 'Transaction Information'}
{ Transaction Information - returns information about an existing
  credit card transaction.  These functions are used for speed and
  convenience. }
function GetTransactionGateway(const ACreditCardTransID: Real)
  : TCreditCardGateway;
function GetTransactionCreditCardType(const ACreditCardTransID: Real)
  : TCreditCardType;
{$ENDREGION 'Transaction Information'}

{$REGION 'Validate merchant information'}
{ Validate merchant information - validates merchant account information
  as found in System Parameters settings. }
function ValidateMerchantInformation(const ACreditCardAccountID: Int64)
  : Boolean;
function ValidateMerchantInformationEx(const ACreditCardAccountID
  : Int64): Boolean;
function ValidateMerchantInformationEx2(const ACurrencyID,
  AEPlantID: Int64): Boolean;
// function ValidateExpirationDate(const AMMYY: string; var AMonth: Integer;
// var AYear: Integer; var AModifiedMMYY: string): Boolean;
function GetMerchantTaxID: string;
{$ENDREGION 'Validate merchant information'}

{$REGION 'Populate merchant information'}
{ Populate merchant information - fills either record or component properties
  with merchant data as found in System Parameters settings. }
procedure PopulateMerchantInformation(const ACreditCardAccountID: Real;
  var AChargeComponent: TEPaymentProcessor); overload;
{$ENDREGION 'Populate merchant information'}

{$REGION 'Return Gateway information'}
{ Return Gateway information - returns gateway type, index, or other
  gateway information. }
function GetCreditCardGateway(const ACurrencyID: Int64): TCreditCardGateway;
function GetCreditCardAccountGateway(const ACreditCardAccountID: Real)
  : TCreditCardGateway;
function GetGatewayDisplayName(const ACreditCardAccountID: Real): string;
function GetGatewayDisplayNameEx(const ACreditCardGateway
  : TCreditCardGateway): string;
function GetGatewayURL(const ACreditCardAccountID: Real;
  const ATestURL: Boolean; var AURL: string; var APort: string): Boolean;
{$ENDREGION 'Return Gateway information'}

{$REGION 'Customer information'}
{ Customer information }
function GetDefaultCreditCardID(const AArcustoID: Int64): Int64;
{$ENDREGION 'Customer information'}

// Variable AText returns the English explanation of the CVV response
// The function returns True if the provided CVV Response is valid; False if not.
function EPaymentCVVResponse(const ACVVResponse: string;
  var AText: string): Boolean;

{$REGION 'Permitted actions by Gateway'}
{ Permitted actions }
function IQSysGatewayCanVoid(const ACreditCardAccountID: Real): Boolean;
// can we void with this gateway?
function IQSysGatewayCanAuthOnly(const ACreditCardAccountID: Real): Boolean;
// can we authorize only with this gateway?
function IQSysGatewayCanChargeBack(const ACreditCardAccountID: Real): Boolean;
function IQSysGatewayCanForce(const ACreditCardAccountID: Real): Boolean;
function IQSysGatewayCanCheckAVS(const ACreditCardAccountID: Real): Boolean;
function IQSysGatewayCanSettle(const ACreditCardAccountID: Real): Boolean;
function IQSysGatewaySupportsCurrency(const ACreditCardAccountID: Real)
  : Boolean; // does gateway support multicurrency?
function IQSysGatewayCanProcessCard(const ACreditCardAccountID: Real;
  const ACreditCardType: TCreditCardType): Boolean;
function IQSysGatewayCanModifySettlementAmount(const ACreditCardAccountID
  : Real): Boolean;
function IQSysGatewayCanTokenize(const ACreditCardAccountID
  : Real): Boolean;
// function GatewaysExistThatCanTokenize: Boolean;

{$ENDREGION 'Permitted actions by Gateway'}

{$REGION 'Formatting methods'}
{ Formatting methods }
// Amount
function GetValidAmount(AStringIn: string; var ADisplayValue: string;
  var AAmountNoDecimal: Integer; var AAmountWithDecimal: Real): Boolean;
procedure FormatAmountText(const AEditBox: TUniEdit);
// Number formatting.  Example: IN = $8.25, OUT = '825'
function GetFormattedCurrencyAsStr(const AValue: Real): string;
// Credit card number
function GetMaskedAccount(const AAccount: string): string;
function GetMaskedCVV2(const ACVV2: string): string;
function SourceDisplayText(const ASource: string; ASourceID: Real): string;
procedure CheckCardHolderName(const AFullName: string);
function DecodeExpirationDate(const AValue: string; var AMonth, AYear,
  AFullYear: Integer; var AError: string): Boolean;
function ConvertExpirationDate(const AValue: string;
  var ADate: TDateTime): Boolean;
function DecodeCardHolderName(const AValue: string; var AFirstName, ALastName,
  AError: string): Boolean;
{$ENDREGION 'Formatting methods'}

{$REGION 'Credit Card Status'}
{ Credit Card Status - modifies the status of a credit card transaction. }
procedure SetCardStatus(ACreditCardTransID: Real; AStatus: TTransactionStatus;
  AComment: string; AAmount: Real = 0);
procedure DoMarkAllAsSettled(ABatchNumber: string);
procedure DoMarkAsSettled(ACreditCardTransID: Real; ABatchNumber: string;
  AResponseText: string = '');
procedure DoMarkAsSettleError(ACreditCardTransID: Real; AResponseText: string);
procedure DoMarkAsChargedBack(const ACreditCardTransID, ARefundAmount: Real;
  ACompleted: Boolean);
function NextBatchNumber: Int64;
function FormatBatchNumber(const ABatchNumber: Integer): string;
function GetPurchaseOrderID(const APONo: string): Int64;
function GetPurchaseOrderNumber(const APO_ID: Real;
  const AOrdersID: Real = 0): string;
function GetISOUOMFor(const AUOM: string): string;
function ExpiredCardsExist: Boolean;
function PromptExpiredCardsExist: Boolean;
{$ENDREGION 'Credit Card Status'}

{$REGION 'Printing'}
{ Printing }
function CreditCardReceiptAssigned: Boolean;
function CreditCardReceiptReportName: string;
procedure PromptAndPrintCreditCardReceipt(AOwner: TComponent;
  ACreditCardTransID: Real);
procedure PrintCreditCardReceipt(AOwner: TComponent; ACreditCardTransID: Real);
{$ENDREGION 'Printing'}

function GetSourceCurrencyID(const ASource: string; ASourceID: Int64): Int64;
function GetSourceCurrencyIDEx(const AOrdersID, AARPrepostID,
  AARInvoiceID: Int64): Int64;

procedure UpdateCreditCardTransResponseData(const ACreditCardTransID: Real;
  const AValue: string);

function GetJSonResponseForWeb(AEPaymentProcessor: TEPaymentProcessor): string;

var
  // Value is set in cc_charge constructor, CreateSilent(), for WebDirect.
  SilentMode: Boolean;

implementation

uses
  cc_encrypt,
//  cc_purge_expired_cards_dlg,
  cc_rscstr,
  cc_trans,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
//  prn_cc_receipt,
  System.StrUtils;

function CardTypesConfigured: Boolean;
begin
  try
    Result := SelectValueAsInteger
      ('SELECT 1 FROM credit_card WHERE ROWNUM < 2') = 1;
  except
    Result := False;
  end;
end;

// If card types have not been selected, inform the user.
function CheckCardTypesConfigured: Boolean;
begin
  Result := CardTypesConfigured;
  if not Result then
    // cc_rscstr.cTXT0000510 =
    // cTXT0000510 = 'Please configure the list of accepted credit cards ' +
    // 'before attempting to process credit cards.  Accepted Credit Cards ' +
    // 'may be configured from Customer Maintenance or System Parameters.';
    raise Exception.Create(cc_rscstr.cTXT0000510);
end;

procedure CheckCheckUniqueCustomerCreditCard(const ACreditCardNumber: string;
  const AArcustoID, ACreditCardID, ACreditCardAccountID,
  ACurrentArcustoCreditCardID: Real);
var
  SQL: TStringList;
  AExists: Boolean;
begin
  SQL := TStringList.Create;
  try
    SQL.Add('SELECT 1');
    SQL.Add('  FROM arcusto_credit_card');
    SQL.Add(' WHERE acctno = cc_encrypt.get_encrypted(:ACCTNO) AND ');
    SQL.Add(Format('       arcusto_id = %.0f AND', [AArcustoID]));
    SQL.Add(Format('       credit_card_id = %.0f AND', [ACreditCardID]));
    if ACreditCardAccountID > 0 then
      SQL.Add(Format('       credit_card_account_id = %.0f AND',
        [ACreditCardAccountID]));
    if ACurrentArcustoCreditCardID > 0 then
      SQL.Add(Format('       id <> %.0f', [ACurrentArcustoCreditCardID]))
    else
      SQL.Add('       1=1');
    AExists := SelectValueParam(SQL.Text, ['ACCTNO;S'],
      [ACreditCardNumber]) = 1;
  finally
    SQL.Free;
  end;
  if AExists then
    // 'The account number must be unique per customer.'
    raise Exception.Create(cc_rscstr.cTXT0000016);
end;

function CreateEPaymentProcessor(const AOwner: TComponent;
  const ACreditCardAccountID: Real): TEPaymentProcessor;
var
  AGateway: TCreditCardGateway;
  AURL, APort: string;
begin
  // NOTE:  This method creates a TEPaymentProcessor descendant
  // based on the credit card account.  If you are adding to our
  // list of gateways, be sure to update this function.  By updating
  // this function, be extension you update any area that uses
  // this component.
  Result := nil;
  // Get the gateway type (this unit)
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  // Based on the gateway type, create the correct component class
  if (AGateway = cgwMerchantAccountsCa) then
    Result := TEPaymentMerchantAccountsCa.Create(AOwner)
  else if (AGateway = cgwSterling) then
    Result := TEPaymentSterling.Create(AOwner)
  else if (AGateway = cgwMerchantESolutions) then
    Result := TEPaymentMES.Create(AOwner)
  else if (AGateway = cgwTSYS) then
    Result := TEPaymentTSYS.Create(AOwner)
  else if (AGateway = cgwAuthorizeNet) then
    Result := TEPaymentAuthorizeNet.Create(AOwner)
  else if (AGateway = cgwMonerisCanada) then
    Result := TEPaymentMonerisCanada.Create(AOwner)
  else if (AGateway = cgwMonerisUSA) then
    Result := TEPaymentMonerisUSA.Create(AOwner)
  else if (AGateway = cgwMyVirtualMerchant) then
    Result := TEPaymentElavon.Create(AOwner)
  else if (AGateway = cgwPayPal) then
    Result := TEPaymentPayPal.Create(AOwner)
  else if (AGateway = cgwFirstData) then
    Result := TEPaymentFirstData.Create(AOwner)
  else if (AGateway = cgwPayFlowPro) then
    Result := TEPaymentPayFlowPro.Create(AOwner)
  else
    Result := nil;

  if Result = nil then
    Exit;

  // Set merchant information
  PopulateMerchantInformation(ACreditCardAccountID, Result); // cc_share.pas
  // Get the URL and Port from System Parameters.  If there is an
  // override, then apply it.
  if GetGatewayURL(ACreditCardAccountID, Result.TestMode, AURL, APort) then
  begin
    Result.GatewayURL := AURL;
    if not APort.IsEmpty then
      Result.GatewayPort := StrToInt(APort);
  end;
end;

procedure PopulateEPaymentProcessorByTransactionID(
  EPaymentProcessor: TEPaymentProcessor; ATransactionID: Integer);
var
  AArcustoID, ABillToID, AShipToID: Real;
  AMonth, AYear, AFullYear, ATempInt, i: Integer;
  AFirstName, ALastName, AError: string;
  ATrans: TFDQuery;
  CreditCardParams: TCreditCardParams;
  CustomerInfoRec: TCustomerSource;
begin
  ATrans := TFDQuery.Create(nil);
  try
    ATrans.Connection := UniMainModule.FDConnection1;
    with ATrans.SQL do
    begin
      Add('SELECT a.arprepost_id, a.invoice_no, a.orders_id, a.orderno, d.ord_date,');
      Add('       a.po_id, a.pono, a.cashrec_detail_id, a.card_number, a.card_exp,');
      Add('       a.card_addr, a.card_zip, a.authorized, a.authorized_amount,');
      Add('       a.authorized_date, a.authorized_by, a.tax_amount, a.freight, a.status,');
      Add('       a.status_amount, a.status_date, a.status_changedby, a.status_note,');
      Add('       a.response_approval_code, a.response_text, a.response_batch_number,');
      Add('       a.response_transaction_id, a.settle_error, a.settle_error_text,');
      Add('       a.bankinfo_dtl_id, a.crprepost_detail_id, a.arinvoice_id, a.arcusto_id,');
      Add('       a.custno, a.company, a.addr1, a.addr2, a.addr3, a.city, a.state, a.zip,');
      Add('       a.country, a.credit_card_descrip, a.currency_id, a.spot_rate,');
      Add('       a.gateway, a.gateway_url, a.settlement_amount, a.refund_amount,');
      Add('       a.onhold, a.manual, a.refund_date, a.settlement_date, a.pk_hide,');
      Add('       a.credit_card_account_id, a.card_holder_name, a.transaction_method,');
      Add('       a.merchant_name, a.transaction_type, a.transaction_descrip,');
      Add('       a.response_data, a.last_four, a.last_four_masked, a.created,');
      Add('       a.createdby, a.changed, a.changedby, a.onacct, a.bill_to_id,');
      Add('       a.bill_to_addr1, a.bill_to_city, a.bill_to_zip, a.bill_to_state,');
      Add('       a.bill_to_country, a.bill_to_country_code, a.ship_to_id,');
      Add('       a.ship_to_addr1, a.ship_to_city, a.ship_to_zip, a.ship_to_state,');
      Add('       a.ship_to_country, a.ship_to_country_code, a.tax_exempt, b.tax_id,');
      Add('       c.curr_code');
      Add('  FROM credit_card_trans a, arcusto b, currency c, orders d');
      Add(Format(' WHERE id = %d AND', [ATransactionID]));
      Add('       b.id = a.arcusto_id AND');
      Add('       c.id(+) = a.currency_id AND');
      Add('       d.id = a.orders_id');
    end;
    ATrans.Open;
    if not (ATrans.Bof and ATrans.Eof) then
    begin
      CreditCardParams := TCreditCardParams.Create(nil,
        ATrans.FieldByName('CREDIT_CARD_ACCOUNT_ID').AsLargeInt);
      try
        AArcustoID := ATrans.FieldByName('ARCUSTO_ID').AsLargeInt;
        ABillToID := ATrans.FieldByName('BILL_TO_ID').AsLargeInt;
        AShipToID := ATrans.FieldByName('SHIP_TO_ID').AsLargeInt;
        CustomerInfoRec := TCustomerSource.Create(nil);
        try
          CustomerInfoRec.Update(AArcustoID, ABillToID, AShipToID);
          if not cc_share.DecodeExpirationDate(
            ATrans.FieldByName('CARD_EXP').AsString, AMonth,
            AYear, AFullYear, AError) and (AError > '') then
            raise Exception.Create(AError);
          // Clear current values
          EPaymentProcessor.Reset;

          // Populate the merchant login information
          PopulateMerchantInformation
            (ATrans.FieldByName('CREDIT_CARD_ACCOUNT_ID').AsLargeInt,
            EPaymentProcessor);
          EPaymentProcessor.Gateway := cc_types.SupportedGatewayByIndex
            (ATrans.FieldByName('GATEWAY').AsInteger);
          EPaymentProcessor.ProcessingClass :=
            CreditCardParams.ProcessingClass;
          EPaymentProcessor.CreditCardAccountID :=
            ATrans.FieldByName('CREDIT_CARD_ACCOUNT_ID').AsLargeInt;
          // Transaction ID
          // - Get the response transaction ID, if available
          EPaymentProcessor.TransactionID :=
            ATrans.FieldByName('RESPONSE_TRANSACTION_ID').AsString;
          // - Assign a new, unique value
          if EPaymentProcessor.TransactionID = '' then
            EPaymentProcessor.TransactionID :=
              NextTransactionID(EPaymentProcessor.Gateway);

          // Get the original response
          with TTransactionResponseTable.Create(nil, ATransactionID) do
            try
              GetNameValuePairs(EPaymentProcessor.OriginalResponse.Items);
            finally
              Free;
            end;
          // Load the Level II and Level III options from the tables
          with TLevel3Items.Create do
            try
              Reset;
              LoadFromTransaction(ATransactionID);

              // Apply the level 3 options to the processor component
              EPaymentProcessor.Level3Options.LocalTaxExempt :=
                LocalTaxExempt;
              EPaymentProcessor.Level3Options.LocalTaxAmount :=
                LocalTaxAmount;
              EPaymentProcessor.Level3Options.NationalTaxAmount :=
                NationalTaxAmount;
              EPaymentProcessor.Level3Options.DutyAmount := DutyAmount;
              EPaymentProcessor.Level3Options.MerchantTaxID := MerchantTaxID;
              EPaymentProcessor.Level3Options.CustomerTaxID := CustomerTaxID;
              EPaymentProcessor.Level3Options.CommodityCode := CommodityCode;

              // Level III Itemization
              for i := 0 to Count - 1 do
                with EPaymentProcessor.Level3Options.Itemization.Add do
                begin
                  ItemNumber := Items[i].InventoryItemno;
                  ItemDescription := Items[i].InventoryItemDescrip;
                  Quantity := Items[i].Quantity;
                  Price := Items[i].UnitPrice;
                  Tax := Items[i].TaxAmount;
                  TotalAmount := Items[i].TotalAmount;
                  CommodityCode := Items[i].CommodityCode;
                  Discount := Items[i].Discount;
                  UOM := Items[i].UOM;
                end;
            finally
              Free;
            end;

          // Merchant Tax ID Required by FirstData
          if EPaymentProcessor.Level3Options.MerchantTaxID = '' then
            EPaymentProcessor.Level3Options.MerchantTaxID :=
              cc_share.GetMerchantTaxID;

          // Credit Card information
          EPaymentProcessor.CreditCard.CustomerId := FloatToStr(AArcustoID);
          EPaymentProcessor.CreditCard.CardNumber :=
            ATrans.FieldByName('CARD_NUMBER').AsString;
          EPaymentProcessor.CreditCard.ExpireMonth := AMonth;
          EPaymentProcessor.CreditCard.ExpireYear := AFullYear;
          EPaymentProcessor.CreditCard.SecurityCode := ''; // never saved
          if not cc_share.DecodeCardHolderName
            (ATrans.FieldByName('CARD_HOLDER_NAME').AsString, AFirstName,
            ALastName, AError) and (AError > '') then
            raise Exception.Create(AError);
          EPaymentProcessor.CreditCard.CustomerFirstName :=
            ShortString(AFirstName);
          EPaymentProcessor.CreditCard.CustomerLastName :=
            ShortString(ALastName);

          // Billing Address
          EPaymentProcessor.CreditCard.CustomerAddress :=
            ATrans.FieldByName('BILL_TO_ADDR1').AsString;
          EPaymentProcessor.CreditCard.CustomerCity :=
            ATrans.FieldByName('BILL_TO_CITY').AsString;;
          EPaymentProcessor.CreditCard.CustomerState :=
            ATrans.FieldByName('BILL_TO_STATE').AsString;
          EPaymentProcessor.CreditCard.CustomerPostalCode :=
            ATrans.FieldByName('BILL_TO_ZIP').AsString;
          EPaymentProcessor.CreditCard.CustomerCountry :=
            ATrans.FieldByName('BILL_TO_COUNTRY').AsString;

          // Ensure a billing address exists
          if (ATrans.FieldByName('BILL_TO_ID').AsLargeInt = 0) or
            ((EPaymentProcessor.CreditCard.CustomerAddress = '') and
            (EPaymentProcessor.CreditCard.CustomerPostalCode = '')) then
          begin
            EPaymentProcessor.CreditCard.CustomerAddress :=
              CustomerInfoRec.BILL_TO_ADDR1;
            EPaymentProcessor.CreditCard.CustomerCity :=
              CustomerInfoRec.BILL_TO_CITY;
            EPaymentProcessor.CreditCard.CustomerState :=
              CustomerInfoRec.BILL_TO_STATE;
            EPaymentProcessor.CreditCard.CustomerPostalCode :=
              CustomerInfoRec.BILL_TO_ZIP;
            EPaymentProcessor.CreditCard.CustomerCountry :=
              CustomerInfoRec.BILL_TO_COUNTRY;
          end;

          // Destination (Ship To)
          EPaymentProcessor.Destination.ID :=
            ATrans.FieldByName('SHIP_TO_ID').AsLargeInt;
          EPaymentProcessor.Destination.CompanyName :=
            ATrans.FieldByName('COMPANY').AsString;
          EPaymentProcessor.Destination.Address1 :=
            ATrans.FieldByName('SHIP_TO_ADDR1').AsString;
          EPaymentProcessor.Destination.City :=
            ATrans.FieldByName('SHIP_TO_CITY').AsString;
          EPaymentProcessor.Destination.StateOrRegion :=
            ATrans.FieldByName('SHIP_TO_STATE').AsString;
          EPaymentProcessor.Destination.PostalCode :=
            ATrans.FieldByName('SHIP_TO_ZIP').AsString;
          EPaymentProcessor.Destination.Country :=
            ATrans.FieldByName('SHIP_TO_COUNTRY').AsString;

          // Ensure a destination address exists
          if (ATrans.FieldByName('SHIP_TO_ID').AsLargeInt = 0) or
            ((EPaymentProcessor.Destination.Address1 = '') and
            (EPaymentProcessor.Destination.PostalCode = '')) then
          begin
            EPaymentProcessor.Destination.ID := CustomerInfoRec.SHIP_TO_ID;
            EPaymentProcessor.Destination.CompanyName :=
              CustomerInfoRec.SHIP_TO_ATTN;
            EPaymentProcessor.Destination.Address1 :=
              CustomerInfoRec.SHIP_TO_ADDR1;
            EPaymentProcessor.Destination.City :=
              CustomerInfoRec.SHIP_TO_CITY;
            EPaymentProcessor.Destination.StateOrRegion :=
              CustomerInfoRec.SHIP_TO_STATE;
            EPaymentProcessor.Destination.PostalCode :=
              CustomerInfoRec.SHIP_TO_ZIP;
            EPaymentProcessor.Destination.Country :=
              CustomerInfoRec.SHIP_TO_COUNTRY;
          end;
          if EPaymentProcessor.Destination.Country = '' then
            EPaymentProcessor.Destination.Country :=
              CustomerInfoRec.SHIP_TO_COUNTRY;

          // Sender (Ship From)
          EPaymentProcessor.Sender.ID := CustomerInfoRec.SHIP_FROM_ID;
          EPaymentProcessor.Sender.CompanyName :=
            CustomerInfoRec.SHIP_FROM_ATTN;
          EPaymentProcessor.Sender.Address1 :=
            CustomerInfoRec.SHIP_FROM_ADDR1;
          EPaymentProcessor.Sender.Address2 :=
            CustomerInfoRec.SHIP_FROM_ADDR2;
          EPaymentProcessor.Sender.Address3 :=
            CustomerInfoRec.SHIP_FROM_ADDR3;
          EPaymentProcessor.Sender.City := CustomerInfoRec.SHIP_FROM_CITY;
          EPaymentProcessor.Sender.StateOrRegion :=
            CustomerInfoRec.SHIP_FROM_STATE;
          EPaymentProcessor.Sender.PostalCode :=
            CustomerInfoRec.SHIP_FROM_ZIP;
          EPaymentProcessor.Sender.Country :=
            CustomerInfoRec.SHIP_FROM_COUNTRY;

          // Transaction information
          EPaymentProcessor.TransactionMethod :=
            TTransactionMethod(ATrans.FieldByName('TRANSACTION_METHOD')
            .AsInteger);
          EPaymentProcessor.TransactionCurrencyCode :=
            ATrans.FieldByName('CURR_CODE').AsString;
          EPaymentProcessor.TransactionAmount :=
            ATrans.FieldByName('AUTHORIZED_AMOUNT').AsFloat;
          EPaymentProcessor.FreightAmount :=
            ATrans.FieldByName('FREIGHT').AsFloat;
          EPaymentProcessor.TaxAmount :=
            ATrans.FieldByName('TAX_AMOUNT').AsFloat;
          EPaymentProcessor.TaxExempt :=
            ATrans.FieldByName('TAX_EXEMPT').AsString = 'Y';
          EPaymentProcessor.DiscountAmount := 0;
          EPaymentProcessor.TransactionDescription :=
            ATrans.FieldByName('TRANSACTION_DESCRIP').AsString;

          // Sales Order
          EPaymentProcessor.SalesOrderID :=
            ATrans.FieldByName('ORDERS_ID').AsLargeInt;
          EPaymentProcessor.SalesOrderNumber :=
            ATrans.FieldByName('ORDERNO').AsString;
          EPaymentProcessor.SalesOrderDate :=
            ATrans.FieldByName('ORD_DATE').AsDateTime;

          // Invoice
          EPaymentProcessor.InvoiceNumber :=
            ATrans.FieldByName('INVOICENO').AsString;

          // PO
          EPaymentProcessor.PurchaseOrderNumber :=
            ATrans.FieldByName('PONO').AsString;
        finally
          FreeAndNil(CustomerInfoRec);
        end;
      finally
        FreeAndNil(CreditCardParams);
      end;
    end;
  finally
    FreeAndNil(ATrans);
  end;
end;

function NextTransactionID: UInt64;
begin
  Result := SelectValueAsInt64(
    'SELECT s_cctransno.nextval FROM dual');
end;

function NextTransactionID(const ADigits: Integer): ShortString;
var
  AValue: Integer;
  AFormat: string;
begin
  AValue := NextTransactionID; // overload, above
  AFormat := Repl('0', ADigits);
  if ADigits > 0 then
    Result := ShortString(FormatFloat(AFormat, AValue))
  else
    Result := ShortString(IntToStr(AValue));
end;

function NextTransactionID(const AGateway: TCreditCardGateway)
  : ShortString;
const
  C_DEFAULT_SEQUENCE_NAME: string = 'S_CCTRANSNO';
  C_MAX_SEQUENCE_LENGTH: Integer = 32;
var
  ASequenceName, AFormat: string;
  ALength, ADigits: Integer;
  AValue: Int64;
begin
  ASequenceName := C_DEFAULT_SEQUENCE_NAME;
  ALength := 4;
  ADigits := 4;
  case AGateway of
    cgwAuthorizeNet: { n/a }
      ;
    // cgwChase: ;
    cgwFirstData:
      begin
        ALength := 22;
        ASequenceName := 'S_CCTRANSNO_FIRSTDATA';
      end;
    cgwMonerisCanada: { n/a }
      ;
    cgwMonerisUSA: { n/a }
      ;
    cgwMyVirtualMerchant: { n/a }
      ;
    cgwPayPal:
      begin
        ALength := 19;
        ASequenceName := 'S_CCTRANSNO_PAYPAL';
      end;
    cgwSterling:
      begin
        ALength := 20;
        ASequenceName := 'S_CCTRANSNO_STERLING';
      end;
    cgwTSYS:
      begin
        ALength := 25;
        ASequenceName := 'S_CCTRANSNO_TSYS';
      end;
    cgwMerchantESolutions:
      begin
        ALength := 32;
        ASequenceName := 'S_CCTRANSNO_MES';
      end;
    cgwMerchantAccountsCa:
      begin
        // Documentation indicates the value can be 100 digits long
        ALength := C_MAX_SEQUENCE_LENGTH;
        ASequenceName := 'S_CCTRANSNO_MERCHANTACOUNTSCA';
      end;
  end;

  if (CompareText(C_DEFAULT_SEQUENCE_NAME, ASequenceName) <> 0) and
    not OracleObjectExists(ASequenceName) then
  begin
    // Get the current value of the default sequence because we
    // do not want conflicts for existing customers
    AValue := IQMS.Common.Sequence.GetCurrentSequenceNumber(C_DEFAULT_SEQUENCE_NAME);
    // Always increment the value
    Inc(AValue);
    // Create the sequence
    ExecuteCommandFmt(
      'CREATE SEQUENCE %s                              '#13 +
      ' INCREMENT BY 1                                 '#13 +
      ' START WITH %d                                  '#13 +
      ' MINVALUE 1                                     '#13 +
      ' MAXVALUE %s                                    '#13 +
      ' CYCLE                                          '#13 +
      ' ORDER                                          '#13 +
      ' CACHE 20                                       ',
      [ASequenceName, AValue, Repl('9', ALength)]);
  end;

  AValue := Trunc(IQMS.Common.Sequence.GetNextSequenceNumber(ASequenceName));
  if ADigits > 0 then
  begin
    AFormat := Repl('0', ADigits);
    Result := ShortString(FormatFloat(AFormat, AValue));
  end
  else
    Result := ShortString(IntToStr(AValue));
end;

function NextReferenceNumber(const AGateway: TCreditCardGateway)
  : ShortString;
const
  C_DEFAULT_SEQUENCE_NAME: string = 'S_CCTRANSNO';
  C_MAX_SEQUENCE_LENGTH: Integer = 32;
var
  ASequenceName, AFormat: string;
  ALength, ADigits: Integer;
  AValue: Int64;
begin
  ASequenceName := C_DEFAULT_SEQUENCE_NAME;
  ALength := 4;
  ADigits := 4;
  case AGateway of
    cgwAuthorizeNet: { n/a }
      ;
    // cgwChase: ;
    cgwFirstData:
      begin
        ALength := 7;
        ASequenceName := 'S_CCTREFNUM_FIRSTDATA';
      end;
    cgwMonerisCanada: { n/a }
      ;
    cgwMonerisUSA: { n/a }
      ;
    cgwMyVirtualMerchant: { n/a }
      ;
    cgwPayPal:
      begin
        ALength := 20;
        ASequenceName := 'S_CCTREFNUM_PAYPAL';
      end;
    cgwSterling: { n/a }
      ;
    cgwTSYS: { n/a }
      ;
    cgwMerchantESolutions: { n/a }
      ;
    cgwMerchantAccountsCa: { n/a }
      ;
  end;

  if (CompareText(C_DEFAULT_SEQUENCE_NAME, ASequenceName) <> 0) and
    not OracleObjectExists(ASequenceName) then
  begin
    // Get the current value of the default sequence because we
    // do not want conflicts for existing customers
    AValue := IQMS.Common.Sequence.GetCurrentSequenceNumber(C_DEFAULT_SEQUENCE_NAME);
    // Always increment the value
    Inc(AValue);
    // Create the sequence
    ExecuteCommandFmt(
      'CREATE SEQUENCE %s                              '#13 +
      ' INCREMENT BY 1                                 '#13 +
      ' START WITH %d                                  '#13 +
      ' MINVALUE 1                                     '#13 +
      ' MAXVALUE %s                                    '#13 +
      ' CYCLE                                          '#13 +
      ' ORDER                                          '#13 +
      ' CACHE 20                                       ',
      [ASequenceName, AValue, Repl('9', ALength)]);
  end;

  AValue := Trunc(IQMS.Common.Sequence.GetNextSequenceNumber(ASequenceName));
  if ADigits > 0 then
  begin
    AFormat := Repl('0', ADigits);
    Result := ShortString(FormatFloat(AFormat, AValue));
  end
  else
    Result := ShortString(IntToStr(AValue));
end;

function GetNextFirstDataSTAN: Integer;
begin
  if not IQMS.Common.Sequence.SequenceExists('s_cc_firstdata_stan') then
  begin
    ExecuteCommand(
      'CREATE SEQUENCE s_cc_firstdata_stan             '#13 +
      ' INCREMENT BY 1                                 '#13 +
      ' START WITH 1                                   '#13 +
      ' MINVALUE 1                                     '#13 +
      ' MAXVALUE 999999                                '#13 +
      ' CYCLE                                          '#13 +
      ' ORDER                                          '#13 +
      ' CACHE 20                                       ');
  end;
  Result := SelectValueAsInteger
    ('SELECT s_cc_firstdata_stan.NEXTVAL FROM DUAL');
end;

function GetTransactionGateway(const ACreditCardTransID: Real)
  : TCreditCardGateway;
var
  i: Integer;
begin
  // Initialization
  Result := cgwUnknown;
  // Validation
  if (ACreditCardTransID = 0) then
    Exit;
  // Get database value
  i := SelectValueFmtAsInt64(
    'SELECT gateway FROM credit_card_trans ' +
    'WHERE id = %.0f', [ACreditCardTransID]);
  // Return gateway type
  Result := SupportedGatewayByIndex(i);
end;

function GetTransactionCreditCardType(const ACreditCardTransID: Real)
  : TCreditCardType;
var
  ACardDescrip: string;
begin
  // Initialization
  Result := ccUnknown;
  // Validation
  if (ACreditCardTransID = 0) then
    Exit;
  // Get database value
  ACardDescrip := SelectValueFmtAsString(
    'SELECT credit_card_descrip FROM ' +
    'credit_card_trans WHERE id = %.0f', [ACreditCardTransID]);
  // Return card type
  Result := cc_types.GetCardType(ACardDescrip);
end;

function ValidateMerchantInformation(const ACreditCardAccountID: Int64)
  : Boolean;
var
  AParams: TCreditCardParams;
begin
  AParams := TCreditCardParams.Create(nil, ACreditCardAccountID);
  try
    Result := AParams.Gateway <> cgwUnknown;
    if not Result and not cc_share.SilentMode then // no gateway assigned
      { 'Your Credit Card Merchant account information has either not ' +
        'been completed, or a Credit Card Account is unavailable for the current ' +
        'currency and EPlant.  Please set up Credit Card Merchant information in ' +
        'System Parameters.' }
      raise Exception.Create(cc_rscstr.cTXT0000049);
    // additional validation
    case AParams.Gateway of
      cgwTSYS:
        Result :=
          not AParams.DecryptParam('MERCHANT_ID').IsEmpty and
          not AParams.DecryptParam('DEVICE_ID').IsEmpty and
          not AParams.DecryptParam('OPERATOR').IsEmpty and
          not AParams.DecryptParam('PASSWORD').IsEmpty;
      cgwMerchantESolutions:
        Result :=
          not AParams.DecryptParam('PROFILE_ID').IsEmpty and
          not AParams.DecryptParam('PROFILE_KEY').IsEmpty;
      cgwAuthorizeNet:
        { NOTE:  MerchantPassword may not be required; it isn't
          for our test account }
        Result :=
          not AParams.DecryptParam('LOGIN_NAME').IsEmpty and
          not AParams.DecryptParam('TRANS_KEY').IsEmpty;
      cgwMonerisCanada, cgwMonerisUSA, cgwMyVirtualMerchant, cgwPayPal,
        cgwMerchantAccountsCa:
        Result :=
          not AParams.DecryptParam('LOGIN_NAME').IsEmpty and
          not AParams.DecryptParam('PASSWORD').IsEmpty;
      cgwSterling:
        Result :=
          not AParams.DecryptParam('STORE_ID').IsEmpty and
          not AParams.DecryptParam('MERCHANT_ID').IsEmpty and
          not AParams.DecryptParam('TERMINAL_ID').IsEmpty and
          not AParams.DecryptParam('SECURITY_CODE').IsEmpty;
      cgwFirstData:
        Result :=
          not AParams.DecryptParam('MERCHANT_ID').IsEmpty and
          not AParams.DecryptParam('TERMINAL_ID').IsEmpty and
          not AParams.DecryptParam('DATAWIRE_ID').IsEmpty and
          not AParams.DecryptParam('GROUP_ID').IsEmpty;
    end;
  finally
    if Assigned(AParams) then
      FreeAndNil(AParams);
  end;
  if not Result and not cc_share.SilentMode then
    { 'Your Credit Card Merchant account information has either not ' +
      'been completed, or a Credit Card Account is unavailable for the current ' +
      'currency and EPlant.  Please set up Credit Card Merchant information in ' +
      'System Parameters.' }
    raise Exception.Create(cc_rscstr.cTXT0000049);
end;

// This checks to see if a merchant account has been set up.
// If not, the return is False, and it shows an error dialog
// (not an exception).  This allows the calling method to take
// other System.Actions.  But most importantly, if this is called by
// COM, then the message will display to the user; exceptions will
// not display.
function ValidateMerchantInformationEx(const ACreditCardAccountID
  : Int64): Boolean;
begin
  // Determine a valid gateway
  Result := GetCreditCardAccountGateway(ACreditCardAccountID) <> cgwUnknown;
  if not Result then // no gateway assigned
    { 'Your Credit Card Merchant account information has either not
      been completed, or a Credit Card Account is unavailable for the current
      currency and EPlant.  Please set up Credit Card Merchant information in
      System Parameters.' }
    IQError(cc_rscstr.cTXT0000049);
end;

function ValidateMerchantInformationEx2(const ACurrencyID,
  AEPlantID: Int64): Boolean;
var
  ACreditCardAccountID: Int64;
begin
  ACreditCardAccountID := cc_params.GetCreditCardAccountIDEx(ACurrencyID,
    AEPlantID);
  Result := (ACreditCardAccountID > 0) and ValidateMerchantInformationEx
    (ACreditCardAccountID);
  if not Result then // no gateway assigned
    { 'Your Credit Card Merchant account information has either not
      been completed, or a Credit Card Account is unavailable for the current
      currency and EPlant.  Please set up Credit Card Merchant information in
      System Parameters.' }
    IQError(cc_rscstr.cTXT0000049);
end;

function GetMerchantTaxID: string;
var
  AMerchantTaxID: string;
begin
  // Initialization
  Result := '';
  // Get federal tax ID from the company record; default value.
  AMerchantTaxID := Trim(SelectValueAsString
    ('SELECT TRIM(fed_id) FROM iqsys WHERE ROWNUM < 2'));
  // By default, populate with company Tax ID
  Result := AMerchantTaxID;
  // If we are in an EPlant, evaluate for EIN
  if (SecurityManager.EPlant_ID_AsFloat > 0) then
  begin
    // Return the EIN, if it is available
    Result := Trim(SelectValueFmtAsString(
      'SELECT TRIM(b.descrip) ' +
      'FROM eplant a, ein b ' +
      'WHERE a.id = %.0f AND a.ein_id = b.id',
      [SecurityManager.EPlant_ID_AsFloat]));
    // If no EIN exists for the EPlant, then populate
    // with the default, company tax ID.
    if (Result = '') then
      Result := AMerchantTaxID;
  end;
end;

procedure PopulateMerchantInformation(const ACreditCardAccountID: Real;
  var AChargeComponent: TEPaymentProcessor);
var
  AParams: TCreditCardParams;
begin
  if Assigned(AChargeComponent) then
    try
      AChargeComponent.CreditCardAccountID := Trunc(ACreditCardAccountID);
      AParams := TCreditCardParams.Create(nil, Trunc(ACreditCardAccountID));
      // TSYS
      if (AChargeComponent is TEPaymentTSYS) then
      begin
        TEPaymentTSYS(AChargeComponent).MerchantID :=
          AParams.DecryptParam('MERCHANT_ID');
        TEPaymentTSYS(AChargeComponent).MerchantDeviceID :=
          AParams.DecryptParam('DEVICE_ID');
        TEPaymentTSYS(AChargeComponent).MerchantOperator :=
          AParams.DecryptParam('OPERATOR');
        TEPaymentTSYS(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
        TEPaymentTSYS(AChargeComponent).MerchantCountryCode :=
          AParams.DecryptParam('COUNTRY_CODE');
        TEPaymentTSYS(AChargeComponent).MerchantCurrencyCode :=
          AParams.DecryptParam('CURRENCY_CODE');
        TEPaymentTSYS(AChargeComponent).MerchantLanguageCode :=
          AParams.DecryptParam('LANGUAGE_CODE');
        TEPaymentTSYS(AChargeComponent).MerchantTransactionKey :=
          AParams.DecryptParam('TRANSACTION_KEY');
      end
      // MerchantAccounts.CA
      else if (AChargeComponent is TEPaymentMerchantAccountsCa) then
      begin
        TEPaymentMerchantAccountsCa(AChargeComponent).MerchantLogin :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentMerchantAccountsCa(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
      end
      // Sterling
      else if (AChargeComponent is TEPaymentSterling) then
      begin
        TEPaymentSterling(AChargeComponent).MerchantStoreID :=
          AParams.DecryptParam('STORE_ID');
        TEPaymentSterling(AChargeComponent).MerchantSecurityCode :=
          AParams.DecryptParam('SECURITY_CODE');
        TEPaymentSterling(AChargeComponent).MerchantID :=
          AParams.DecryptParam('MERCHANT_ID');
        TEPaymentSterling(AChargeComponent).MerchantTerminalID :=
          AParams.DecryptParam('TERMINAL_ID');
      end
      // Merchant ESolutions
      else if (AChargeComponent is TEPaymentMES) then
      begin
        TEPaymentMES(AChargeComponent).MerchantProfileID :=
          AParams.DecryptParam('PROFILE_ID');
        TEPaymentMES(AChargeComponent).MerchantProfileKey :=
          AParams.DecryptParam('PROFILE_KEY');
      end
      // Authorize.Net
      else if (AChargeComponent is TEPaymentAuthorizeNet) then
      begin
        TEPaymentAuthorizeNet(AChargeComponent).MerchantID :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentAuthorizeNet(AChargeComponent).MerchantTransKey :=
          AParams.DecryptParam('TRANS_KEY');
        TEPaymentAuthorizeNet(AChargeComponent).MerchantHashValue :=
          AParams.DecryptParam('HASH_VALUE');
      end
      // Moneris (either Canada or USA)
      else if (AChargeComponent is TEPaymentMoneris) then
      begin
        TEPaymentMoneris(AChargeComponent).MerchantLogin :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentMoneris(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
        TEPaymentMoneris(AChargeComponent).MerchantLanguageCode :=
          AParams.DecryptParam('LANGUAGE_CODE');
      end
      // Elavon
      else if (AChargeComponent is TEPaymentElavon) then
      begin
        TEPaymentElavon(AChargeComponent).MerchantLogin :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentElavon(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
        TEPaymentElavon(AChargeComponent).MerchantUserID :=
          AParams.DecryptParam('USERID');
      end
      // PayPal
      else if (AChargeComponent is TEPaymentPayPal) then
      begin
        TEPaymentPayPal(AChargeComponent).MerchantLogin :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentPayPal(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
        TEPaymentPayPal(AChargeComponent).MerchantSignature :=
          AParams.DecryptParam('TRANS_KEY');
      end
      // FirstData
      else if (AChargeComponent is TEPaymentFirstData) then
      begin
        TEPaymentFirstData(AChargeComponent).MerchantID :=
          AParams.DecryptParam('MERCHANT_ID');
        TEPaymentFirstData(AChargeComponent).TerminalID :=
          AParams.DecryptParam('TERMINAL_ID');
        TEPaymentFirstData(AChargeComponent).GroupID :=
          AParams.DecryptParam('GROUP_ID');
        TEPaymentFirstData(AChargeComponent).DatawireID :=
          AParams.DecryptParam('DATAWIRE_ID');
      end
      // PayFlow Pro
      else if (AChargeComponent is TEPaymentPayFlowPro) then
      begin
        TEPaymentPayFlowPro(AChargeComponent).MerchantLogin :=
          AParams.DecryptParam('LOGIN_NAME');
        TEPaymentPayFlowPro(AChargeComponent).MerchantPassword :=
          AParams.DecryptParam('PASSWORD');
        TEPaymentPayFlowPro(AChargeComponent).MerchantPartner :=
          AParams.DecryptParam('PARTNER');
        TEPaymentPayFlowPro(AChargeComponent).MerchantVendor :=
          AParams.DecryptParam('VENDOR');
        TEPaymentPayFlowPro(AChargeComponent).NonReferencedCreditsAllowed :=
          AParams.DecryptParam('NON_REF_CREDITS_ALLOWED') = 'Y';
      end;

      AChargeComponent.ProcessingClass := AParams.ProcessingClass;
      if AParams.TimeOut > 0 then
        AChargeComponent.TimeOut := AParams.TimeOut;
      AChargeComponent.TestMode := AParams.TestAccount;
      AChargeComponent.Firewall.Reset;
      AChargeComponent.Firewall.Detect := AParams.FirewallDetect;
      // Configuration settings
      if AParams.FirewallDetect then
      begin
        AChargeComponent.Firewall.Host := AParams.FirewallHost;
        AChargeComponent.Firewall.Password := AParams.FirewallPassword;
        AChargeComponent.Firewall.Port := AParams.FirewallPort;
        AChargeComponent.Firewall.User := AParams.FirewallUser;
        AChargeComponent.Firewall.FirewallType := AParams.FirewallType;
      end;
    finally
      if Assigned(AParams) then
        FreeAndNil(AParams);
    end;
end;

function GetCreditCardGateway(const ACurrencyID: Int64): TCreditCardGateway;
var
  AIndex: Integer;
  AID: Int64;
begin
  Result := TCreditCardGateway(0);
  AID := cc_params.GetCreditCardAccountID(ACurrencyID);
  if AID = 0 then
    Exit;
  // The TCreditCardGateway type is declared in cc_types.pas
  // The TCreditCardGateway listing is uniquely ours (IQMS), and is not
  // linked to any /n Software IBiz component listing.
  AIndex := Trunc(SelectValueFmtAsFloat('SELECT NVL(gateway, -1) ' +
    'FROM credit_card_account WHERE id = %d', [AID]));
  // Regardless of the index we store from System Parameters, we translate
  // it here to a TCreditCardGateway type.
  Result := SupportedGatewayByIndex(AIndex);
end;

function GetCreditCardAccountGateway(const ACreditCardAccountID: Real)
  : TCreditCardGateway;
var
  AGateway: Integer;
begin
  try
    AGateway := SelectValueFmtAsInteger(
      'SELECT gateway FROM credit_card_account WHERE id = %.0f',
      [ACreditCardAccountID]);
    Result := SupportedGatewayByIndex(AGateway);
  except
    Result := TCreditCardGateway(0);
  end;
end;

function GetGatewayDisplayName(const ACreditCardAccountID: Real): string;
var
  AGateway: TCreditCardGateway;
begin
  Result := 'Unknown';
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := GetGatewayDisplayNameEx(AGateway);
end;

function GetGatewayDisplayNameEx(const ACreditCardGateway
  : TCreditCardGateway): string;
begin
  try
    Result := CreditCardGatewayName[ACreditCardGateway];
  except
    Result := 'Unknown';
  end;
end;

function GetGatewayURL(const ACreditCardAccountID: Real;
  const ATestURL: Boolean; var AURL: string; var APort: string): Boolean;
begin
  if ATestURL then
  begin
    AURL := SelectValueFmtAsString(
      'SELECT iqms.cc.get_param(%.0f, ''TEST_URL'') FROM DUAL',
      [ACreditCardAccountID]);
    APort := SelectValueFmtAsString(
      'SELECT iqms.cc.get_param(%.0f, ''TEST_PORT'') FROM DUAL',
      [ACreditCardAccountID]);
  end
  else
  begin
    AURL := SelectValueFmtAsString(
      'SELECT iqms.cc.get_param(%.0f, ''PRODUCTION_URL'') FROM DUAL',
      [ACreditCardAccountID]);
    APort := SelectValueFmtAsString(
      'SELECT iqms.cc.get_param(%.0f, ''PRODUCTION_PORT'') FROM DUAL',
      [ACreditCardAccountID]);
  end;
  AURL := Trim(AURL);
  APort := Trim(APort);
  Result := AURL > '';
end;

function EPaymentCVVResponse(const ACVVResponse: string;
  var AText: string): Boolean;
begin
  // The following is documented in the IBiz EPayment Integrator help file
  // for topic ResponseCVVResult Property
  Result := True; // default
  AText := ''; // default
  if ACVVResponse = 'M' then
    // 'Success!  CVV2 match.'
    AText := cc_rscstr.cTXT0000087
  else if ACVVResponse = 'N' then
    // 'Failed!  CVV2 no match.'
    AText := cc_rscstr.cTXT0000088
  else if ACVVResponse = 'P' then
    // 'Not processed.'
    AText := cc_rscstr.cTXT0000089
  else if ACVVResponse = 'S' then
    // 'Warning!  Merchant has indicated that CVV2 is not present on this card.'
    AText := cc_rscstr.cTXT0000090
  else if ACVVResponse = 'U' then
    // 'Warning!  Issuer not certified and/or has not provided Visa encryption keys.';
    AText := cc_rscstr.cTXT0000091
    // 06/12/2008 Final check is based on field length
  else
    Result := Length(ACVVResponse) < 2;
end;

function IQSysGatewayCanVoid(const ACreditCardAccountID: Real): Boolean;
var
  AParams: TCreditCardParams;
begin
  AParams := TCreditCardParams.Create(nil, Trunc(ACreditCardAccountID));
  try
    // Can this gateway do an AuthOnly so that we can settle later?
    // TGatewayChargeMethod = (gcmAuthOnly, gcmSale);
    Result := (AParams.Gateway in GatewaysThatCanVoid);
    // PayPal only allows voids if a transaction was a Sale
    // transaction.  We have no way of determining if the
    // transaction was a sale or auth only after it is settled.
    // So, we check the account settings.
    if (AParams.Gateway = cgwPayPal) and (AParams.ChargeMethod = gcmAuthOnly) then
      Result := False;
  finally
    if Assigned(AParams) then
      FreeAndNil(AParams);
  end;
end;

function IQSysGatewayCanChargeBack(const ACreditCardAccountID: Real): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in cc_types.GatewaysThatCanChargeBack);
  // Note:  Although PayPal allows "refunds," our method of charging a
  // card (authorize and sale, both) do not allow us to refund.
end;

function IQSysGatewayCanAuthOnly(const ACreditCardAccountID: Real): Boolean;
var
  AGateway: TCreditCardGateway; // cc_types.pas
begin
  // From the documentation:
  // "Authorization-Only and means obtaining an authorization for a certain
  // amount on a customer's credit card without actually charging the card."
  // Can this gateway authorize a card, but delay settlement until later?
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in cc_types.GatewaysThatCanAuthOnly);
end;

function IQSysGatewayCanForce(const ACreditCardAccountID: Real): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in cc_types.GatewaysThatCanForce);
end;

function IQSysGatewayCanCheckAVS(const ACreditCardAccountID: Real): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  // Our standard gateway type
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in cc_types.GatewaysThatCanCheckAVS);
end;

function IQSysGatewayCanSettle(const ACreditCardAccountID: Real): Boolean;
var
  AParams: TCreditCardParams;
begin
  AParams := TCreditCardParams.Create(nil, Trunc(ACreditCardAccountID));
  try
    // Can this gateway do an AuthOnly so that we can settle later?
    // TGatewayChargeMethod = (gcmAuthOnly, gcmSale);
    Result := AParams.ChargeMethod = gcmAuthOnly;
  finally
    if Assigned(AParams) then
      FreeAndNil(AParams);
  end;
end;

function IQSysGatewaySupportsCurrency(const ACreditCardAccountID: Real)
  : Boolean;
var
  AGateway: TCreditCardGateway;
begin
  // How our gateways handle currency:
  // 1.	Authorize.Net requires all transactions to be in USD.  European customers
  // must bank with a U.S. bank.  The API can take a "currency code" per
  // transaction, which is used to convert the amount into U.S. dollars on the
  // back end.
  // 2.	TSYS (Vital) works directly with European accounts in whatever currency the
  // customer desires.  The currency code is setup once for all transactions and
  // they can work in whatever currency they want.
  // 3.	Moneris works in either U.S. Dollars or Canadian dollars, not both.  Like
  // TSYS, the currency depends on the account settings, and all amounts are
  // expected to be in that currency.
  // 4.	Elavon works only in U.S. dollars.  The DCC program which Elavon offers to
  // customers for multicurrency conversion is available only through a Web
  // interface.  Our software cannot support DCC.
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in [cgwTSYS, cgwAuthorizeNet, cgwMonerisCanada,
    cgwMonerisUSA, cgwMerchantESolutions]);
end;

function IQSysGatewayCanProcessCard(const ACreditCardAccountID: Real;
  const ACreditCardType: TCreditCardType): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  // Returns True/False whether the Gateway can process the given credit card type
  case AGateway of
    cgwTSYS, cgwMerchantESolutions, cgwMerchantAccountsCa:
      Result := True;
    cgw3DSI:
      Result := ACreditCardType in [ccVisa, ccMasterCard, ccAmex, ccDinersClub,
        ccDiscover];
    cgwPayPal:
      Result := ACreditCardType in [ccVisa, ccMasterCard, ccAmex, ccDiscover,
        ccMaestro];
  else
    Result := True;
  end;
end;

function IQSysGatewayCanModifySettlementAmount(const ACreditCardAccountID
  : Real): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  // Can the selected gateway modify the amount to be settled?
  // Some gateways allow users to change the amount settled to
  // a value different from the amount originally authorized.
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in [cgwAuthorizeNet, cgwTSYS, cgwPayPal,
    cgwMerchantESolutions, cgwMerchantAccountsCa]);
end;

function IQSysGatewayCanTokenize(const ACreditCardAccountID
  : Real): Boolean;
var
  AGateway: TCreditCardGateway;
begin
  AGateway := GetCreditCardAccountGateway(ACreditCardAccountID);
  Result := (AGateway in GatewaysThatSupportTokenization);
end;

function GetFormattedCurrencyAsStr(const AValue: Real): string;
const
  cNumbers = ['0' .. '9'];
var
  i: Integer;
  S, ATemp: string;
begin
  // Returns floating point values without a decimal.
  // For example, a value of "1.00" would be returned as "100".
  Result := '';
  ATemp := '';
  S := FormatFloat('###0.00', AValue); // ensure we have 2 zeroes in the decimal
  try
    for i := 1 to Length(S) do
      if System.SysUtils.CharInSet(S[i], cNumbers) then
        ATemp := ATemp + S[i];
    Result := ATemp;
  except
    // An error may occur; return an empty string.
    Result := '';
  end;
end;

function GetValidAmount(AStringIn: string; var ADisplayValue: string;
  var AAmountNoDecimal: Integer; var AAmountWithDecimal: Real): Boolean;
var
  ATemp: string;
begin
{$WARN UNSAFE_CAST OFF}
  ATemp := AStringIn;
  if ATemp = '' then
    ATemp := '0';
  ATemp := Trim(StringReplace(ATemp, FormatSettings.CurrencyString, '', []));
  ATemp := Trim(StringReplace(ATemp, FormatSettings.ThousandSeparator, '', []));
  Result := IQMS.Common.Numbers.IsStringValidFloat(ATemp, AAmountWithDecimal);
  if not Result then
    Exit;
  ADisplayValue := FormatFloat1000SeparatorB(AAmountWithDecimal, 2);
  AAmountNoDecimal := Trunc(AAmountWithDecimal * 100);
{$WARN UNSAFE_CAST ON}
end;

procedure FormatAmountText(const AEditBox: TUniEdit);
var
  S: string;
  i: Integer;
  R: Real;
begin
  if GetValidAmount(AEditBox.Text, S, i, R) then
    AEditBox.Text := S;
end;

function SourceDisplayText(const ASource: string; ASourceID: Real): string;

  function _FormatCaptionText(AFormatString, ASourceText: string): string;
  begin
    if ASourceText > '' then
      Result := Format(AFormatString, [ASourceText]);
  end;

  function _SourceIs(const AEvalute: string): Boolean;
  begin
    Result := CompareText(ASource, AEvalute) = 0;
  end;


begin
  // This method is called for form captions
  Result := ''; // initial
  // Applies to tables which contain the field, ARCUSTO_CREDIT_CARD_ID
  if _SourceIs('ARPREPOST') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000261 { 'Invoice # %s' } ,
      Trim(SelectValueFmtAsString
      ('SELECT invoice_no FROM arprepost WHERE id = %.0f',
      [ASourceID])))
  else if _SourceIs('ARINVOICE') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000261 { 'Invoice # %s' } ,
      Trim(SelectValueFmtAsString
      ('SELECT invoice_no FROM arinvoice WHERE id = %.0f',
      [ASourceID])))
  else if _SourceIs('ARINVOICE_VOID') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000261 { 'Invoice # %s' } ,
      Trim(SelectValueFmtAsString
      ('SELECT invoice_no FROM arinvoice_void WHERE id = %.0f',
      [ASourceID])))
  else if _SourceIs('ORDERS') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000262 { 'Order # %s' } ,
      Trim(SelectValueFmtAsString('SELECT orderno FROM orders WHERE id = %.0f',
      [ASourceID])))
  else if _SourceIs('HIST_ORDERS') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000262 { 'Order # %s' } ,
      Trim(SelectValueFmtAsString
      ('SELECT orderno FROM hist_orders WHERE id = %.0f',
      [ASourceID])))
  else if _SourceIs('CRM_ACTIVITY') then
    Result := _FormatCaptionText(cc_rscstr.cTXT0000263 { 'CRM Activity # %s' } ,
      FloatToStr(ASourceID))
  else if _SourceIs('CRM_QUOTE') then
    Result := _FormatCaptionText
      (cc_rscstr.cTXT0000264 { 'Sales Quotation # %s' } , FloatToStr(ASourceID))
  else if _SourceIs('ARCUSTO') then
    Result := Trim(SelectValueFmtAsString(
      'SELECT TRIM(company) || '' ['' || TRIM(custno) || '']'' ' +
      'FROM arcusto WHERE id = %.0f',
      [ASourceID]))
  else
    Result := '';
end;

procedure CheckCardHolderName(const AFullName: string);
var
  i1, i2: Integer;
  AError: Boolean;
  AMsg: string;
begin
  // Cardholder Name (Name on Card)
  // We parse the cardholder name FIRST_NAME + SPACE + LAST_NAME.  We check here
  // to ensure the name was entered correctly.
  i1 := Pos(' ', AFullName); // find the space
  i2 := Pos(',', AFullName);
  // is there a comma? we dont' want last name, first name formats
  if i2 = 0 then
    i2 := i1; // adjust this value for evaluation purposes
  AError := (Trim(AFullName) = '') or (NumToken(AFullName, ' ') < 2) or
    ((i1 - i2) >= 1);
  if not AError then
    Exit;
  // 'A separate first and last card holder name is recommended.'
  AMsg := cc_rscstr.cTXT0000212;
  if not cc_share.SilentMode then
    IQMS.Common.Dialogs.IQWarningChk(AMsg, 'CARDHOLDERNAME_WARNING');
end;

function DecodeExpirationDate(const AValue: string; var AMonth, AYear,
  AFullYear: Integer; var AError: string): Boolean;
var
  AFull, ATempStr: string;
begin
  // Initialization
  AMonth := 0;
  AYear := 0;
  AFullYear := 0;
  // First get values for expiration date
  AFull := AValue;
  // If the incoming string is just the four numbers, then format it.
  if Length(AFull) = 4 then
    AFull := Copy(AFull, 1, 2) + '/' + Copy(AFull, 3, 2);
  AFull := IQMS.Common.StringUtils.StrTran(AFull, '-', '/');
  // 10/17/2011 Compensate for locale
  AFull := IQMS.Common.StringUtils.StrTran(AFull, FormatSettings.DateSeparator, '/');
  // Month
  ATempStr := GetToken(AFull, '/', 1);
  if not IQMS.Common.Numbers.IsStringValidInteger(ATempStr, AMonth) or
    not (AMonth in [1 .. 12]) then
  begin
    // cc_rscstr.cTXT0000057 =
    // 'Not a valid month (01 to 12).  Please check the Expiration Date.'
    AError := cc_rscstr.cTXT0000057;
    Exit(False);
  end;
  // Year
  ATempStr := GetToken(AFull, '/', 2);
  if not IQMS.Common.Numbers.IsStringValidInteger(ATempStr, AYear) then
  begin
    // cc_rscstr.cTXT0000058 =
    // 'Not a valid year.  Please check the Expiration Date.'
    AError := cc_rscstr.cTXT0000058;
    Exit(False);
  end;
  ATempStr := IntToStr(IQMS.Common.Dates.FullYear(AYear));
  if not IQMS.Common.Numbers.IsStringValidInteger(ATempStr, AFullYear) then
  begin
    // cc_rscstr.cTXT0000058 =
    // 'Not a valid year.  Please check the Expiration Date.'
    AError := cc_rscstr.cTXT0000058;
    Exit(False);
  end;
  Result := True;
end;

function ConvertExpirationDate(const AValue: string;
  var ADate: TDateTime): Boolean;
var
  AMonth, AYear, AFullYear: Integer;
  AError: string;
begin
  Result := DecodeExpirationDate(AValue, { var } AMonth, AYear, AFullYear,
    { var } AError);

  if Result then
  begin
    ADate := EncodeDateTime(AFullYear, AMonth, 1, 0, 0, 0, 0);
    Result := IQMS.Common.Dates.ValidDate(ADate);
  end;
end;

function DecodeCardHolderName(const AValue: string; var AFirstName, ALastName,
  AError: string): Boolean;

  function _GetNamePart(AFullName: string; APart: Integer): string;
  begin
    // Look for the expected space between names
    if (Pos(' ', AFullName) > 0) then
      Result := IQMS.Common.StringUtils.GetToken(AFullName, ' ', APart);
  end;

begin
  // NOTE:  These two return values are no longer necessary
  Result := True;
  AError := '';

  AFirstName := _GetNamePart(AValue, 1);
  ALastName := _GetNamePart(AValue, 2);

  // By default, only one name was passed, then just return
  // it.  This is an arbitrary decision,
  // as long as an empty string is not returned.
  if (AFirstName = '') and (ALastName = '') then
   ALastName := AValue;

end;

procedure DoMarkAsChargedBack(const ACreditCardTransID, ARefundAmount: Real;
  ACompleted: Boolean);
var
  AErrorDtl: string;
begin
  try
    // First, update only the refund amount value
    AErrorDtl := IQFormat(
      'UPDATE credit_card_trans '#13 +
      '   SET refund_amount = NVL(refund_amount,0) + %f, '#13 +
      '       refund_date = TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS'')'#13 +
      ' WHERE id = %.0f',
      [ARefundAmount,
      FormatDateTime('mm/dd/yyyy hh:nn:ss', IQOracleAdjustedDateTime),
      ACreditCardTransID]);
    ExecuteCommand(AErrorDtl);
    // If this is completely refunded, then flag it as refunded
    if ACompleted then
    begin
      AErrorDtl := IQFormat(
        'UPDATE credit_card_trans '#13 +
        '   SET status = 3, '#13 +
        '       status_date = TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS''), '#13 +
        '       status_changedby = ''%s'', '#13 +
        '       onhold = NULL, '#13 +
        '       status_amount = refund_amount '#13 +
        ' WHERE id = %.0f',
        [FormatDateTime('mm/dd/yyyy hh:nn:ss', IQOracleAdjustedDateTime),
        SecurityManager.UserName, ACreditCardTransID]);
      ExecuteCommand(AErrorDtl);
    end;
  except
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        // cc_rscstr.cTXT0000111 = 'Error updating database.'
        ShowIqErrorMessage(cc_rscstr.cTXT0000111, E.Message, AErrorDtl);
    // IQMS.Common.ErrorDialog.pas
  end;
end;

procedure SetCardStatus(ACreditCardTransID: Real; AStatus: TTransactionStatus;
  AComment: string; AAmount: Real);
begin
  ExecuteCommandFmt(
    'BEGIN                                                  '#13 +
    ' iqms.cc.set_transaction_status(%.0f, %d, %f, ''%s''); '#13 +
    'END;                                                   ',
    [ACreditCardTransID, Ord(AStatus), AAmount, FixStr(AComment)]);
end;

procedure DoMarkAsSettled(ACreditCardTransID: Real;
  ABatchNumber, AResponseText: string);
var
  AErrorDtl: string;
begin
  try
    AErrorDtl :=
      'UPDATE credit_card_trans '#13 +
      '   SET status_date = :STATUS_DATE, '#13 +
      '       status_changedby = :STATUS_CHANGEDBY, '#13 +
      '       status_amount = settlement_amount, '#13 +
      '       settlement_date = :SETTLEMENT_DATE,'#13 +
      '       response_batch_number = :RESPONSE_BATCH_NUMBER, '#13 +
      '       onhold = NULL, '#13 +
      '       settle_error = NULL, '#13 +
      '       settle_error_text = NULL, '#13 +
      '       status = 1 '#13 +
      ' WHERE id = :ID';
    ExecuteCommandParam(AErrorDtl,
      ['STATUS_DATE;D', 'STATUS_CHANGEDBY',
      'SETTLEMENT_DATE;D', 'RESPONSE_BATCH_NUMBER', 'ID;F'],
      [IQOracleAdjustedDateTime, SecurityManager.UserName,
      IQOracleAdjustedDateTime, IQMS.Common.StringUtils.LeftStr(ABatchNumber, 6),
      ACreditCardTransID]);
    // 09/17/2009
    if AResponseText > '' then
    begin
      AErrorDtl := 'UPDATE credit_card_trans SET ' +
        'response_text = :RESPONSE_TEXT WHERE id = :ID';
      ExecuteCommandParam(AErrorDtl, ['RESPONSE_TEXT', 'ID;F'],
        [AResponseText, ACreditCardTransID]);
    end;
  except
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        // cc_rscstr.cTXT0000111 = 'Error updating database.'
        ShowIqErrorMessage(cc_rscstr.cTXT0000111, E.Message, AErrorDtl);
  end;
end;

procedure DoMarkAllAsSettled(ABatchNumber: string);
var
  AErrorDtl: string;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('  SELECT id ');
      SQL.Add('    FROM credit_card_trans');
      SQL.Add('   WHERE status in (0,4) AND');
      SQL.Add('         NVL(onhold, ''N'') <> ''Y'' ');
      SQL.Add('ORDER BY id');
      Open;
      // we update each record individually
      while not Eof do
      begin
        // Mark the record as settled (see above)
        DoMarkAsSettled(FieldByName('ID').AsLargeInt, ABatchNumber);
        Next; // next record
      end;
      AErrorDtl := ''; // reset; we are done with SQL
    finally
      Free; // free the query
    end;
end;

procedure DoMarkAsSettleError(ACreditCardTransID: Real; AResponseText: string);
begin
  // 01/02/2007 Changed to param method
  ExecuteCommandParam(
    'UPDATE credit_card_trans SET               '#13 +
    '  settle_error = ''Y'',                    '#13 +
    '  settle_error_text = :SETTLE_ERROR_TEXT,  '#13 +
    '  status = 4                               '#13 +
    'WHERE id = :ID                             ',
    ['SETTLE_ERROR_TEXT', 'ID;INT64'],
    [AResponseText, Trunc(ACreditCardTransID)]);
end;

function GetMaskedAccount(const AAccount: string): string;
var
  ALast4: string;
  i: Integer;
begin
  Result := '';
  if (Trim(AAccount) = '') then
    Exit;
  ALast4 := IQMS.Common.StringUtils.RightStr(AAccount, 4);
  for i := 1 to Length(AAccount) - 4 do
    Result := Result + '*';
  Result := Result + ALast4;
end;

function GetMaskedCVV2(const ACVV2: string): string;
var
  i: Integer;
begin
  Result := '';
  if (Trim(ACVV2) = '') then
    Exit;
  for i := 1 to Length(ACVV2) do
    Result := Result + '*';
end;

function NextBatchNumber: Int64;
begin
  Result := SelectValueAsInt64('SELECT s_ccbatch.NEXTVAL FROM dual');
end;

function FormatBatchNumber(const ABatchNumber: Integer): string;
begin
  Result := FormatFloat('000', ABatchNumber);
end;

function GetPurchaseOrderID(const APONo: string): Int64;
begin
  Result := SelectValueFmtAsInt64(
    'SELECT id FROM po WHERE TRIM(pono) = TRIM(''%s'') AND ROWNUM < 2',
    [FixStr(APONo)]);
  if (Result = 0) then
    Result := SelectValueFmtAsInt64(
      'SELECT id FROM po_hist WHERE TRIM(pono) = TRIM(''%s'') AND ROWNUM < 2',
      [FixStr(APONo)]);
end;

function GetPurchaseOrderNumber(const APO_ID, AOrdersID: Real): string;
begin
  Result := SelectValueFmtAsString(
    'SELECT pono FROM po WHERE id = %.0f ',
    [APO_ID]);
  // If not found in PO, look in PO_HIST
  if Length(Result) = 0 then
    Result := SelectValueFmtAsString
      ('SELECT pono FROM po_hist WHERE id = %.0f ',
      [APO_ID]);
  // 11/05/2009 if the PO number is not provided, attempt to get it
  // from the Sales Order.
  if (Length(Result) = 0) and (AOrdersID > 0) then
    Result := SelectValueFmtAsString
      ('SELECT pono FROM orders WHERE id = %.0f',
      [AOrdersID]);
end;

function GetISOUOMFor(const AUOM: string): string;
  function _Eval(const APossibles: array of string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := low(APossibles) to high(APossibles) do
      if (CompareText(APossibles[i], AUOM) = 0) then
      begin
        Result := True;
      end;
  end;

begin
  Result := SelectValueStrParam(
    'SELECT UOM.GET_ISO_UOM(:UOM) AS UOM FROM DUAL',
    ['UOM;S'],
    [AUOM]);
end;

function GetDefaultCreditCardID(const AArcustoID: Int64): Int64;
begin
  Result := 0;
  if (AArcustoID > 0) then
    Result := SelectValueFmtAsInt64(
      'SELECT id FROM arcusto_credit_card ' +
      'WHERE arcusto_id = %d AND NVL(is_default, ''N'') = ''Y'' AND ' +
      'ROWNUM < 2',
      [AArcustoID]);
end;

function CreditCardReceiptAssigned: Boolean;
begin
  Result := not CreditCardReceiptReportName.IsEmpty;
end;


function CreditCardReceiptReportName: string;
const
  c_credit_card_receipt_report: string = 'cc_receipt_report';
begin
  Result := IQMS.Common.Print.GetReportName(c_credit_card_receipt_report);
end;

procedure PromptAndPrintCreditCardReceipt(AOwner: TComponent;
  ACreditCardTransID: Real);
begin
  // cc_rscstr.cTXT0000477 = 'Print receipt?';
  if CreditCardReceiptAssigned and not SilentMode and
    IQMS.Common.Dialogs.IQConfirmYN(cc_rscstr.cTXT0000477) then
    PrintCreditCardReceipt(AOwner, ACreditCardTransID);
end;

procedure PrintCreditCardReceipt(AOwner: TComponent; ACreditCardTransID: Real);
var
  ASelectionList: TStringList;
begin
//  prn_cc_receipt.DoCreditCardReceipt(FloatToStr(ACreditCardTransID),
//    FloatToStr(ACreditCardTransID));
end;

function ExpiredCardsExist: Boolean;
begin
  Result := False;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT 1');
      SQL.Add('  FROM arcusto_credit_card a');
      SQL.Add(' WHERE a.exp_mmyy IS NOT NULL AND');
      SQL.Add('       LENGTH(a.exp_mmyy) IN (4, 5) AND');
      SQL.Add('       iqms.cc.get_exp_date(a.exp_mmyy) < SYSDATE AND');
      SQL.Add('       ROWNUM < 2');
      try
        Open;
      except
        Result := False;
      end;
      Result := Fields[0].AsInteger = 1;
    finally
      Free;
    end;
end;

function PromptExpiredCardsExist: Boolean;
begin
  if ExpiredCardsExist then
    // cc_rscstr.cTXT0000499 =
    // 'One or more customer credit cards have expired.  Do you ' +
    // 'want to purge expired customer credit cards now?';
//    Result := cc_purge_expired_cards_dlg.DoPurgeExpiredCardsDlg
//      (cc_rscstr.cTXT0000499)
  else
    Result := False;
end;

procedure TSYS_CheckCreateTransactionKey(
  AEPaymentProcessor: TEPaymentProcessor; ACreditCardAccountID: Int64);
var
  AErrorText: string;
begin
  if (AEPaymentProcessor is TEPaymentTSYS) then
  begin
    if (TEPaymentTSYS(AEPaymentProcessor).MerchantTransactionKey = '') and
      TEPaymentTSYS(AEPaymentProcessor).GenerateTransactionKey(
      { var } AErrorText) then
      // Save the MerchantTransactionKey
      with TCreditCardParams.Create(nil,
        ACreditCardAccountID) do
        try
          ParamByName('TRANSACTION_KEY').Value :=
            cc_encrypt.CCKeyEncrypt(TEPaymentTSYS(AEPaymentProcessor)
            .MerchantTransactionKey);
          WriteValues;
        finally
          Free;
        end;
  end;
end;

function TSYS_CreateTransactionKey(
  AEPaymentProcessor: TEPaymentProcessor; ACreditCardAccountID: Int64;
  var AErrorText: string): Boolean;
begin
  Result := False;
  if (AEPaymentProcessor is TEPaymentTSYS) then
  begin
    Result := TEPaymentTSYS(AEPaymentProcessor).GenerateTransactionKey(
      { var } AErrorText);
    if Result then
      // Save the MerchantTransactionKey
      with TCreditCardParams.Create(nil,
        ACreditCardAccountID) do
        try
          ParamByName('TRANSACTION_KEY').Value :=
            cc_encrypt.CCKeyEncrypt(TEPaymentTSYS(AEPaymentProcessor)
            .MerchantTransactionKey);
          WriteValues;
        finally
          Free;
        end;
  end;
end;

procedure UpdateLastFour(const AArcustoCreditCardID: Real;
  const AAccount: string);
var
  ALastFour, ALastFourMasked: string;
begin
  if (AArcustoCreditCardID > 0) and (AAccount > '') then
  begin
    ALastFour := IQMS.Common.StringUtils.RightStr(AAccount, 4);
    ALastFourMasked := cc_share.GetMaskedAccount(AAccount);
    UpdateLastFourAs(AArcustoCreditCardID, ALastFour, ALastFourMasked);
  end;
end;

procedure UpdateLastFourAs(const AArcustoCreditCardID: Real;
  const ALastFour, ALastFourMasked: string);
begin
  ExecuteCommandParam(
    'UPDATE arcusto_credit_card SET last_four = :LAST_FOUR, ' +
    'last_four_masked = :LAST_FOUR_MASKED WHERE id = :ID',
    ['LAST_FOUR;S', 'LAST_FOUR_MASKED;S', 'ID;F'],
    [ALastFour, ALastFourMasked, AArcustoCreditCardID]);
end;

function GetSourceCurrencyID(const ASource: string; ASourceID: Int64): Int64;
begin
  Result := SelectValueFmtAsInt64('SELECT id FROM currency'#13 +
    ' WHERE id = iqms.cc.get_source_currency_id(''%s'', %d)',
    [ASource, ASourceID]);
end;

function GetSourceCurrencyIDEx(const AOrdersID, AARPrepostID,
  AARInvoiceID: Int64): Int64;
begin
  // Returns the Currency ID from the Sales Order or Invoice, if applicable.
  Result := SelectValueFmtAsInt64('SELECT id FROM currency'#13 +
    ' WHERE id = iqms.cc.get_source_currency_id_ex(%d, %d, %d)',
    [AOrdersID, AARPrepostID, AARInvoiceID]);
end;

procedure UpdateCreditCardTransResponseData(const ACreditCardTransID: Real;
  const AValue: string);
begin
  // Note:  The string value coming in is NOT encrypted.  The package
  // procedure handles the encryption part.
  with TFDStoredProc.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      StoredProcName := 'IQMS.CC.SET_TRANS_DATA';
      Params.CreateParam(ftInteger, 'l_credit_card_trans_id', ptInput).AsFMTBCD
        := Trunc(ACreditCardTransID);
      Params.CreateParam(ftOraClob, 'l_value', ptInput).Value := AValue;
      Prepare;
      Execute;
    finally
      Free;
    end;
end;

function GetJSonResponseForWeb(AEPaymentProcessor: TEPaymentProcessor): string;
var
  AResponse: TStringList;
  S: string;
  i: Integer;
begin
  if Assigned(AEPaymentProcessor) then
  begin
    AResponse := TStringList.Create;
    try
      // Construct JSon message
      AResponse.Add(Format('"statusType": "%s"',
        [cc_types.ResponseClassWebConstant
        [AEPaymentProcessor.Response.StatusClass]]));
      AResponse.Add(Format('"friendlyMessage": "%s"',
        [cc_types.ResponseClassDescription
        [AEPaymentProcessor.Response.StatusClass]]));
      AResponse.Add(Format('"statusDescription": "%s"',
        [AEPaymentProcessor.Response.StatusDescription]));
      AResponse.Add(Format('"statusCode": "%s"',
        [AEPaymentProcessor.Response.StatusCode]));
      AResponse.Add(Format('"approvalCode": "%s"',
        [AEPaymentProcessor.Response.ApprovalCode]));
      AResponse.Add(Format('"responseTransactionID": "%s"',
        [AEPaymentProcessor.Response.TransactionID]));
      AResponse.Add(Format('"errorMessage": "%s"',
        [AEPaymentProcessor.Response.ErrorDescription]));
      AResponse.Add(Format('"errorCode": "%s"',
        [AEPaymentProcessor.Response.ErrorCode]));
      AResponse.Add(Format('"avsDescription": "%s"',
        [AEPaymentProcessor.Response.AVSResultDescription]));
      AResponse.Add(Format('"cvvDescription": "%s"',
        [AEPaymentProcessor.Response.SecurityResultDescription]));
      AResponse.Add(Format('"transactionID": "%s"',
        [AEPaymentProcessor.TransactionID]));

      // Note:  ISO Code is only used by Moneris Canada, but is required by
      // them to be displayed in order to be certified.
      S := AEPaymentProcessor.Response.GetReturnValue('iso_code');
      if S > '' then
        AResponse.Add(Format('"isoCode": "%s"', [S]));

      // Note:  Moneris USA wants something special here.  Instead of the
      // "Transaction ID", we need to use the caption "Reference #".  It
      // is required to be displayed in order to be certified.
      if (AEPaymentProcessor.Gateway = cgwMonerisUSA) then
      begin
        S := AEPaymentProcessor.Response.ReferenceNumber;
        if S > '' then
          AResponse.Add(Format('"referenceNumber": "%s"', [S]));
      end;

      Result := '{';
      for i := 0 to AResponse.Count - 1 do
      begin
        if i < AResponse.Count - 1 then
          Result := Result + AResponse.Strings[i] + ', '
        else
          Result := Result + AResponse.Strings[i];
      end;
      Result := Result + '}';
    finally
      AResponse.Free;
    end;
  end;
end;

end.

