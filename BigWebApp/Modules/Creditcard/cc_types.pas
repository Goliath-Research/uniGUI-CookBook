unit cc_types;

interface

uses
  System.Classes,
  System.SysUtils,
  cc_rscstr,
  FireDAC.Comp.Client;

{ Returns the display name for a credit card type
  Example:
  IN: 'DISCOVER/NOVUS'
  OUT: 'Discover/Novus'
}
function GetCardTypeDisplayName(const ACardTypeStr: string): string;
{ Returns TRUE if the credit card type supports AVS
  Example:
  IN:  'DISCOVER/NOVUS'
  OUT:  TRUE
}
function CardTypeSupportsAVS(const ACardTypeStr: string): Boolean;

{ Gateways }
const
  // Note:  It does not matter what the number is because we use functions
  // to get the getway type (TCreditCardGateway) from the constant.
  // The numbers used to indicate the IBiz type, but that has
  // been abandoned.  However, the value here must match the values
  // in the System Parameters combo box, and they must match the
  // list of constants in package, CC.
  GATEWAY_TSYS = 0;
  GATEWAY_AUTHORIZE_NET = 1;
  GATEWAY_PAYPAL = 2;
  GATEWAY_MERCHANTESOLUTIONS = 3;
  GATEWAY_MERCHANTACCOUNTSCA = 4;
  GATEWAY_STERLING = 5;
  GATEWAY_PAYFLO_PRO = 10;
  GATEWAY_3DSI = 24;
  GATEWAY_MONERIS_CA = 31;
  GATEWAY_MYVIRTUALMERCHANT = 61;
  GATEWAY_MONERIS_US = 64;
  GATEWAY_FIRSTDATA = 6;
  DEFAULT_TIME_OUT: Integer = 30;

  { This is the list of supported gateways.  These types are independent of
    any IBiz Integrator type list. }
type
  TCreditCardGateway = (cgwUnknown, cgw3DSI, cgwACHPAyments, cgwAuthorizeNet,
    cgwBankOfAmerica, cgwChase, cgwCyberCash, cgwCyberSource, cgwECHOnline,
    cgwECX, cgwEFSNet, cgwEprocessing, cgwEway, cgwFastTransact, cgwFirstData,
    cgwGoEMerchant, cgwGoRealTime, cgwIBill, cgwInnovative, cgwIntellipay,
    cgwITransact, cgwLinkPoint, cgwMerchantAnywhere, cgwMerchantPartners,
    cgwMonerisCanada, cgwMonerisUSA, cgwMPCS, cgwMyVirtualMerchant,
    cgwNetBilling, cgwNetworkMerchants, cgwNexCommerce, cgwOgone, cgwOptimal,
    cgwOrbital, cgwPayFlowLink, cgwPayFlowPro, cgwPayFuse, cgwPaygea,
    cgwPayJunction, cgwPaymentExpress, cgwPaymentsGateway, cgwPayPal,
    cgwPayStream, cgwPlanetPayment, cgwPlugNPay, cgwPRIGate, cgwProtx,
    cgwPSIGate, cgwPSIGateXML, cgwRTWare, cgwSagePayments, cgwSECPay,
    cgwSecurePay, cgwSkipjack, cgwSterling, cgwTransactionCentral,
    cgwTransFirst, cgwTrustCommerce, cgwTSYS, cgwUSAePay, cgwUSight, cgwViaKlix,
    cgwWorldPay, cgwYourPay, cgwMerchantESolutions, cgwMerchantAccountsCa);
  TCreditCardGateways = set of TCreditCardGateway;

const
  CreditCardGatewayName: array [TCreditCardGateway] of string = ('Unknown',
    '3Delta Systems', // cgw3DSI
    'ACH Payments', // cgwACHPAyments
    'Authorize.Net', // cgwAuthorizeNet
    'Bank of America', // cgwBankOfAmerica
    'Chase', // cgwChase
    'CyberCash', // cgwCyberCash
    'CyberSource', // cgwCyberSource
    'ECHOnline', // cgwECHOnline
    'E-Commerce Exchange', // cgwECX
    'EFSnet Merchants', // cgwEFSNet
    'E-Processing', // cgwEprocessing
    'eWAY', // cgwEway
    'FastTransact', // cgwFastTransact
    'First Data Merchants', // cgwFirstData
    'GoEMerchant', // cgwGoEMerchant
    'GoRealTime', // cgwGoRealTime
    'iBill', // cgwIBill
    'Innovative', // cgwInnovative
    'Intellipay', // cgwIntellipay
    'iTransact', // cgwITransact
    'LinkPoint', // cgwLinkPoint
    'Merchant Anywhere', // cgwMerchantAnywhere
    'MerchantPartners', // cgwMerchantPartners
    'Moneris', // cgwMonerisCanada
    'Moneris', // cgwMonerisUSA
    'Merchant Payments Coalition', // cgwMPCS
    'Elavon', // cgwMyVirtualMerchant
    'Net Billing', // cgwNetBilling
    'Network Merchants', // cgwNetworkMerchants
    'NexCommerce', // cgwNexCommerce
    'Ogone', // cgwOgone
    'Optimal', // cgwOptimal
    'Orbital', // cgwOrbital
    'PayFlow Link', // cgwPayFlowLink
    'PayFlow Pro', // cgwPayFlowPro
    'PayFuse', // cgwPayFuse
    'Paygea', // cgwPaygea
    'PayJunction', // cgwPayJunction
    'PaymentExpress', // cgwPaymentExpress
    'Payments Gateway', // cgwPaymentsGateway
    'PayPal', // cgwPayPal
    'PayStream', // cgwPayStream
    'Planet Payment', // cgwPlanetPayment
    'Plug-N-Pay', // cgwPlugNPay
    'PRI Gate', // cgwPRIGate
    'protx', // cgwProtx
    'PSI Gate', // cgwPSIGate
    'PSI Gate XML', // cgwPSIGateXML
    'RT Ware', // cgwRTWare
    'SagePayments', // cgwSagePayments
    'SEC Pay', // cgwSECPay
    'SecurePay', // cgwSecurePay
    'Skipjack', // cgwSkipjack
    'Sterling', // cgwSterling
    'TransactionCentral', // cgwTransactionCentral
    'TransFirst', // cgwTransFirst
    'Trust Commerce', // cgwTrustCommerce
    'TSYS', // cgwTSYS
    'USA ePay', // cgwUSAePay
    'uSight', // cgwUSight
    'ViaKlix', // cgwViaKlix
    'WorldPay', // cgwWorldPay
    'YourPay', // cgwYourPay
    'Merchant e-Solutions', // cgwMerchantESolutions
    'Merchant-Accounts.Ca'); // cgwMerchantAccountsCa
  // Gateways that use a component class that descends from
  // our (IQMS) own cc_epayment TEPaymentProcessor class.
  // EPaymentProcessorGateways = [cgwAuthorizeNet, cgwSterling, cgwTSYS,
  // cgwMerchantESolutions, cgwMerchantAccountsCa, cgwMonerisCanada,
  // cgwMonerisUSA, cgwMyVirtualMerchant, cgwPayPal];
  // These gateways can Settle:
  GatewaysThatCanSettle = [cgwTSYS, cgwAuthorizeNet, cgwIBill, cgwNetBilling,
    cgwPayFlowPro, cgwViaKlix, cgwUSAePay, cgwPlugNPay, cgwPlanetPayment,
    cgwMPCS, cgwRTWare, cgwECX, cgwInnovative, cgwECHOnline, cgw3DSI,
    cgwTrustCommerce, cgwPSIGate, cgwPayFuse, cgwOrbital, cgwLinkPoint,
    cgwMerchantESolutions, cgwMerchantAccountsCa, cgwPayFlowPro, cgwSterling,
    cgwFirstData];
  // These gateways can Charge Back (Refund):
  GatewaysThatCanChargeBack = [cgwTSYS, cgwAuthorizeNet, cgwIBill,
    cgwNetBilling, cgwPayFlowPro, cgwViaKlix, cgwUSAePay, cgwPlugNPay,
    cgwPlanetPayment, cgwMPCS, cgwRTWare, cgwECX, cgwInnovative, cgwECHOnline,
    cgw3DSI, cgwTrustCommerce, cgwPSIGate, cgwPayFuse, cgwOrbital, cgwLinkPoint,
    cgwMerchantESolutions, cgwMerchantAccountsCa, cgwPayFlowPro, cgwSterling,
    cgwPayPal, cgwFirstData];
  // These gateways can Void:
  GatewaysThatCanVoid = [cgwTSYS, cgwAuthorizeNet, cgwNetBilling, cgwPayFlowPro,
    cgwUSAePay, cgwPlugNPay, cgwPlanetPayment, cgwMPCS, cgwRTWare, cgwECX,
    cgwInnovative, cgwPayFuse, cgwLinkPoint, cgwPayPal, cgwMerchantESolutions,
    cgwMerchantAccountsCa, cgwPayFlowPro, cgwSterling, cgwFirstData];
  // These gateways can Authorize only, and settle separately
  GatewaysThatCanAuthOnly = [cgwTSYS, cgwPayPal, cgwAuthorizeNet, cgw3DSI,
    cgwIBill, cgwNetBilling, cgwPayFlowPro, cgwUSAePay, cgwPlugNPay,
    cgwPlanetPayment, cgwMPCS, cgwRTWare, cgwECX, cgwInnovative, cgwECHOnline,
    cgwTrustCommerce, cgwPSIGate, cgwPayFuse, cgwPayFlowLink, cgwOrbital,
    cgwLinkPoint, cgwMerchantESolutions, cgwMerchantAccountsCa, cgwPayFlowPro,
    cgwSterling, cgwFirstData];
  // These gateways can do a Force Settle transaction
  GatewaysThatCanForce = [cgwAuthorizeNet, cgwTSYS, cgw3DSI,
    cgwMerchantESolutions, cgwMerchantAccountsCa, cgwPayFlowPro, cgwSterling];
  // These gateways can process Level III charges for Visa and MasterCard
  GatewaysThatCanProcessLevel3 = [cgwTSYS, cgwMerchantESolutions, cgwPayFlowPro,
    cgwSterling, cgwFirstData];
  // These gateways can check AVS
  GatewaysThatCanCheckAVS = [cgwTSYS, cgwMerchantESolutions,
    cgwMerchantAccountsCa, cgwPayFlowPro, cgwFirstData];
  // These gateways support tokenization.  Before adding to this list,
  // ensure the gateway also provides a way to determine if a token
  // exists (query token) and also to delete the token.
  // Note: TSYS, FirstData, and Sterling (term used, "Card Vault") also
  // support tokenization.
  // TODO for TSYS:  Query token, Delete token.
  GatewaysThatSupportTokenization = [cgwMyVirtualMerchant, cgwTSYS, cgwFirstData {, cgwSterling}];
  // These gateways support adding a new token at the same time a card is
  // authorized.  The new token is returned in the response.
  GatewaysThatSupportCreatingTokenWithAuthorization = [cgwMyVirtualMerchant];
  // If deleting a token from the ARCUSTO_CREDIT_CARD table, these gateways
  // support sending a "delete" request so that it is deleted from the
  // gateway server.  For example, TSYS does not delete tokens.
  GatewaysThatSupportDeletingTokens = [cgwMyVirtualMerchant];
  // These gateways send back printable receipt text with a transaction.
  GatewaysThatProvideReceipts = [cgwTSYS];

type
  { TCreditCardType }
  TCreditCardType = (ccUnknown, ccVisa, ccMasterCard, ccAmex, ccDiscover,
    ccBankCard, ccCartBlanche, ccDelta, ccDinersClub, ccEnroute, ccEuroCard,
    ccJCB, ccMaestro, ccChinaUnionPay);
  { TCreditCardTypes }
  TCreditCardTypes = set of TCreditCardType;
  { Returns the credit card type from the string name
    Example:
    IN: 'DISCOVER/NOVUS'
    OUT: ccDiscover
  }
function GetCardType(const ACardTypeStr: string): TCreditCardType;

const
  // Card types currently supported by IQMS - these are the only cards
  // we are certified to support.
  AcceptedCardTypes = [ccVisa, ccMasterCard, ccAmex, ccDiscover, ccJCB];
  // Card Types that have address verification (AVS)
  AVSCardTypes = [ccVisa, ccMasterCard, ccAmex, ccDiscover];
  // These are the only credit cards that process Level III.  It is a
  // rule that applies, regardless of gateway.
  Level3CardTypes = [ccVisa, ccMasterCard, ccAmex];
  // Card type name.  This string value is a constant, and must never
  // be translated.  It is used in the software to help identify card
  // types.  We don't look at any ID values for this.
  CardTypeName: array [TCreditCardType] of string = ('', 'VISA', 'MASTERCARD',
    'AMERICAN EXPRESS', 'DISCOVER/NOVUS', 'BANKCARD', 'CARTEBLANCHE', 'DELTA',
    'DINERSCLUB', 'ENROUTE', 'EUROCARD', 'JCB', 'MAESTRO', 'CUP');
  CardTypeDisplayName: array [TCreditCardType] of string = ('',
    cc_rscstr.cTXT0000002, // 'Visa'
    cc_rscstr.cTXT0000003, // 'MasterCard'
    cc_rscstr.cTXT0000004, // 'American Express'
    cc_rscstr.cTXT0000005, // 'Discover/Novus'
    cc_rscstr.cTXT0000006, // 'BankCard'
    cc_rscstr.cTXT0000007, // 'CartBlanche'
    cc_rscstr.cTXT0000008, // 'Delta'
    cc_rscstr.cTXT0000009, // 'Diners Club'
    cc_rscstr.cTXT0000010, // 'Enroute'
    cc_rscstr.cTXT0000011, // 'EuroCard'
    cc_rscstr.cTXT0000012, // 'JCB'
    cc_rscstr.cTXT0000013, // 'Maestro'
    cc_rscstr.cTXT0000442); // 'China Union Pay'
  // Standard ImageIndex list to be used for Credit Card icons
  ImageMap: array [TCreditCardType] of Byte = (0, // Unassigned
    1, // 'Visa'
    2, // 'MasterCard'
    3, // 'American Express'
    4, // 'Discover/Novus'
    5, // 'BankCard'
    6, // 'CartBlanche'
    7, // 'Delta'
    8, // 'Diners Club'
    9, // 'Enroute'
    10, // 'EuroCard'
    11, // 'JCB'
    12, // 'Maestro'
    13); // 'China Union Pay'

  // Typical test card numbers
  TestCreditCardNumber: array[TCreditCardType] of string =
   ('',
    '4242424242424242', // 'Visa'
    '5454545454545454', // 'MasterCard'
    '373599005095005', // 'American Express'
    '6011111111111117', // 'Discover/Novus'
    '', // 'BankCard'
    '', // 'CartBlanche'
    '', // 'Delta'
    '36462462742008', // 'Diners Club'
    '', // 'Enroute'
    '', // 'EuroCard'
    '3530111333300000', // 'JCB'
    '', // 'Maestro'
    ''); // 'China Union Pay'


type
  { TProcessingClass }
  TProcessingClass = (pclNone, pclLevel2, pclLevel3);

const
  ProcessingClass: array [TProcessingClass] of string = ('Standard', 'Level 2',
    'Level 3');
  PROCESSING_LEVEL_STANDARD: Byte = 0;
  PROCESSING_LEVEL_2: Byte = 2;
  PROCESSING_LEVEL_3: Byte = 3;
  ProcessingClassInt: array [TProcessingClass] of Byte = (0, 2, 3);

type
  { TFirewallType }
  TFirewallType = (frwNone, frwProxy, frwProxySOCKS4, frwProxySOCKS5);

const
  FirewallTypeName: array [TFirewallType] of string = ('None',
    'Tunneling Proxy', 'SOCKS4 Proxy', 'SOCKS5 Proxy');

type
  TTransactionType = (ttSale, ttAuthOnly, ttCapture, ttCredit, ttVoid, ttForce,
    ttAVSOnly, ttAddToken, ttDeleteToken, ttQueryToken);

const
  TransactionTypeStr: array [TTransactionType] of ShortString = ('Sale/Purchase',
    'Authorization', 'Settlement/Capture', 'Refund', 'Void', 'Force',
    'AVS Check', 'Add Token', 'Delete Token', 'Query Token');
  // Only these transaction types support a reversal (void or refund)
  ReversalTransactionTypes = [ttSale, ttAuthOnly];

type
  { TTransactionMethod
    The first type, card-present, is the only "card-present" type.
    All others are "card-not-present" types. Another type may be
    recurrent billing, but we do not support that type. }
  TTransactionMethod = (tmCardPresent, tmTelephone, tmMail, tmInternet);

  TResponseClass = (rcNone, rcSuccess, rcFailure, rcError, rcWarning,
    rcSecurity);
  TAVSResponseClass = (acNone, acSuccess, acError, acWarning);
  TCVVResponseClass = (cvNone, cvSuccess, cvError, cvWarning);
  TTokenResponseClass = (trcNone, trcSuccess, trcFailure);
  TTransactionStatus = (ccsUnknown, ccsSettled, ccsVoided, ccsChargeBack,
    ccsSettlementError, ccsDeclined);
  // Gateway charge method - when charging a card, this setting
  // determines the kind of charge done.
  // AuthOnly - Authorize and Settle separately
  // Sale - Settle immediately
  TGatewayChargeMethod = (gcmAuthOnly, gcmSale);

const
  TransactionStatusStr: array [TTransactionStatus] of string =
    (cc_rscstr.cTXT0000490, // 'Authorized'
    cc_rscstr.cTXT0000491, // 'Settled'
    cc_rscstr.cTXT0000492, // 'Voided'
    cc_rscstr.cTXT0000493, // 'Refunded'
    cc_rscstr.cTXT0000494, // 'Settlement Error'
    cc_rscstr.cTXT0000495 // 'Declined'
    );

  TransactionMethodStr: array [TTransactionMethod] of string =
    (cc_rscstr.cTXT0000458 { 'Card Present' } ,
    cc_rscstr.cTXT0000459 { 'Telephone (Card not present)' } ,
    cc_rscstr.cTXT0000460 { 'Mail (Card not present)' } ,
    cc_rscstr.cTXT0000461 { 'Internet' } );

  ResponseClassDescription: array [TResponseClass] of string = ('',
    cc_rscstr.cTXT0000446 { 'Transaction approved.' } ,
    cc_rscstr.cTXT0000447 { 'Transaction failed.' } ,
    cc_rscstr.cTXT0000448 { 'Transaction error.' } ,
    cc_rscstr.cTXT0000449 { 'Transaction warning or referral' } ,
    cc_rscstr.cTXT0000450 { 'Transaction security warning.' } );

  ResponseClassWebConstant: array [TResponseClass] of string = ('',
    'SUCCESS',
    'FAILURE',
    'ERROR',
    'WARNING',
    'SECURITY' );

  AVSResponseClass: array [TAVSResponseClass] of string =
    ('',
    cc_rscstr.cTXT0000031 { 'Success' } ,
    cc_rscstr.cTXT0000032 { Error } ,
    cc_rscstr.cTXT0000033 { Warning } );

  // Transaction methods that are permitted on the Charge screen
  ChargeScreenTransactionMethods = [tmCardPresent, tmTelephone, tmMail];

  GatewayChargeMethodStr: array [TGatewayChargeMethod] of string =
    (cc_rscstr.cTXT0000468 { 'Authorization' } ,
    cc_rscstr.cTXT0000469 { 'Sale' } );

  { TTSysTransactionBatchRec }
  { Transaction data storage for TSys (Vital PS) used in batch settlement }
type
  TTSysTransactionBatchRec = packed record
    CREDIT_CARD_TRANS_ID: Real;
    CreditCardType: TCreditCardType;
    TaxAmount: string;
    ResponseData: string;
  end;

{$M+}

  { TCreditCardRec }
type
  TCreditCardRec = class(TObject)
  private
    FID, FARCUSTO_ID, FCREDIT_CARD_ACCOUNT_ID, FCREDIT_CARD_ID: Real;
    FCardDescription, FAccountNumber, FExpires, FCVV2, FNameOnCard,
      FCustomerAddress1, FCustomerCity, FCustomerState, FCustomerPostalCode,
      FCustomerCountry: string;
    FExpirationDate: TDateTime;
    FIsToken: Boolean;
    FIsDefault: Boolean;
    FCreditCardType: TCreditCardType;
    function GetMaskedAccountNumber: string;
    function GetLastFour: string;
    procedure SetExpires(const Value: string);
    procedure AssignLastFour;
    procedure SetCardDescription(const Value: string);
    procedure SetTCreditCardType(const Value: TCreditCardType);
  public
    procedure Reset;
    procedure AssignFromCreditCardID(const AArcustoCreditCardID: Int64);
    procedure SaveAsNewRecord(var AArcustoCreditCardID: Int64);
    procedure SaveRecord;
    procedure SaveExpirationDate;
    procedure SaveIsDefault(const AIsDefault: Boolean);
  published
    property ID: Real read FID write FID;
    property ARCUSTO_ID: Real read FARCUSTO_ID write FARCUSTO_ID;
    property CREDIT_CARD_ID: Real read FCREDIT_CARD_ID write FCREDIT_CARD_ID;
    property CREDIT_CARD_ACCOUNT_ID: Real read FCREDIT_CARD_ACCOUNT_ID
      write FCREDIT_CARD_ACCOUNT_ID;
    property CardDescription: string read FCardDescription
      write SetCardDescription;
    property CreditCardType: TCreditCardType read FCreditCardType write SetTCreditCardType;
    property AccountNumber: string read FAccountNumber write FAccountNumber;
    property LastFour: string read GetLastFour;
    property MaskedAccountNumber: string read GetMaskedAccountNumber;
    property Expires: string read FExpires write SetExpires;
    property ExpirationDate: TDateTime read FExpirationDate;
    property CVV2: string read FCVV2 write FCVV2;
    property NameOnCard: string read FNameOnCard write FNameOnCard;
    property CustomerAddress1: string read FCustomerAddress1
      write FCustomerAddress1;
    property CustomerCity: string read FCustomerCity write FCustomerCity;
    property CustomerState: string read FCustomerState write FCustomerState;
    property CustomerPostalCode: string read FCustomerPostalCode
      write FCustomerPostalCode;
    property CustomerCountry: string read FCustomerCountry
      write FCustomerCountry;
    property IsToken: Boolean read FIsToken write FIsToken;
    property IsDefault: Boolean read FIsDefault write FIsDefault;
  end;

procedure ClearCreditCardRec(var ACreditCardRec: TCreditCardRec);
procedure CopyCreditCardRec(const ASource: TCreditCardRec;
  var ATarget: TCreditCardRec);

{ TGatewayResponse }
type
  TGatewayResponse = packed record
    Gateway: Byte;
    GatewayURL, ResponseApprovalCode, ResponseAVS, ResponseCode,
      ResponseRetrievalNumber, ResponseText, ResponseStoreNumber,
      ResponseTerminalNumber, ResponseTransactionDate, ResponseTransactionId,
      ResponseTransactionNumber, ResponseTransactionTime, ResponseInvoiceNumber,
      ResponseValidationCode, ResponseACI, ResponseAuthSource,
      ResponseData: string;
  end;

function SupportedGatewayByIndex(const AIndex: Integer): TCreditCardGateway;
function IndexBySupportedGateway(const ACreditCardGateway
  : TCreditCardGateway): Integer;
// function ConvertExpirationDate(const AValue: string;
// var ADate: TDateTime): Boolean;

implementation

uses
  cc_encrypt,
  Data.SqlExpr,
  MainModule,
  IQMS.Common.Boolean,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.Regional;

function GetCardTypeDisplayName(const ACardTypeStr: string): string;
var
  o: TCreditCardType;
begin
  Result := ''; // default
  o := GetCardType(ACardTypeStr);
  Result := CardTypeDisplayName[o];
end;

function CardTypeSupportsAVS(const ACardTypeStr: string): Boolean;
var
  o: TCreditCardType;
begin
  o := GetCardType(ACardTypeStr);
  Result := o in AVSCardTypes;
end;

function GetCardType(const ACardTypeStr: string): TCreditCardType;
var
  o: TCreditCardType;
begin
  Result := ccUnknown; // default
  for o := low(TCreditCardType) to high(TCreditCardType) do
    if CompareText(CardTypeName[o], ACardTypeStr) = 0 then
      begin
        Result := o;
        BREAK;
      end;
end;

procedure ClearCreditCardRec(var ACreditCardRec: TCreditCardRec);
begin
  if not Assigned(ACreditCardRec) then
    Exit;
  ACreditCardRec.ID := 0;
  ACreditCardRec.CardDescription := '';
  ACreditCardRec.AccountNumber := '';
  ACreditCardRec.Expires := '';
  ACreditCardRec.CVV2 := '';
  ACreditCardRec.NameOnCard := '';
  ACreditCardRec.CustomerAddress1 := '';
  ACreditCardRec.CustomerCity := '';
  ACreditCardRec.CustomerState := '';
  ACreditCardRec.CustomerPostalCode := '';
  ACreditCardRec.CustomerCountry := '';
end;

procedure CopyCreditCardRec(const ASource: TCreditCardRec;
  var ATarget: TCreditCardRec);
begin
  if not Assigned(ASource) or not Assigned(ATarget) then
    Exit;
  ATarget.ID := ASource.ID;
  ATarget.CardDescription := ASource.CardDescription;
  ATarget.AccountNumber := ASource.AccountNumber;
  ATarget.Expires := ASource.Expires;
  ATarget.CVV2 := ASource.CVV2;
  ATarget.NameOnCard := ASource.NameOnCard;
  ATarget.CustomerAddress1 := ASource.CustomerAddress1;
  ATarget.CustomerCity := ASource.CustomerCity;
  ATarget.CustomerState := ASource.CustomerState;
  ATarget.CustomerPostalCode := ASource.CustomerPostalCode;
  ATarget.CustomerCountry := ASource.CustomerCountry;
end;

function SupportedGatewayByIndex(const AIndex: Integer): TCreditCardGateway;
begin
  // Regardless of the index we store from System Parameters, we translate
  // it here to a TCreditCardGateway type.
  case AIndex of
    GATEWAY_TSYS:
      Result := cgwTSYS; // 0
    GATEWAY_AUTHORIZE_NET:
      Result := cgwAuthorizeNet; // 1
    GATEWAY_PAYPAL:
      Result := cgwPayPal; // 2
    GATEWAY_PAYFLO_PRO:
      Result := cgwPayFlowPro; //  10
    GATEWAY_3DSI:
      Result := cgw3DSI; // 24
    GATEWAY_MONERIS_CA:
      Result := cgwMonerisCanada; // 31
    GATEWAY_MYVIRTUALMERCHANT:
      Result := cgwMyVirtualMerchant; // 61
    GATEWAY_MONERIS_US:
      Result := cgwMonerisUSA; // 64
    GATEWAY_MERCHANTESOLUTIONS:
      Result := cgwMerchantESolutions;
    GATEWAY_MERCHANTACCOUNTSCA:
      Result := cgwMerchantAccountsCa;
    GATEWAY_STERLING:
      Result := cgwSterling;
    GATEWAY_FIRSTDATA:
      Result := cgwFirstData;
  else
    Result := cgwUnknown;
  end;
end;

function IndexBySupportedGateway(const ACreditCardGateway
  : TCreditCardGateway): Integer;
begin
  case ACreditCardGateway of
    cgwTSYS:
      Result := GATEWAY_TSYS;
    cgwAuthorizeNet:
      Result := GATEWAY_AUTHORIZE_NET;
    cgwPayPal:
      Result := GATEWAY_PAYPAL;
    cgwPayFlowPro:
      Result := GATEWAY_PAYFLO_PRO;
    cgw3DSI:
      Result := GATEWAY_3DSI;
    cgwMonerisCanada:
      Result := GATEWAY_MONERIS_CA;
    cgwMyVirtualMerchant:
      Result := GATEWAY_MYVIRTUALMERCHANT;
    cgwMonerisUSA:
      Result := GATEWAY_MONERIS_US;
    cgwMerchantESolutions:
      Result := GATEWAY_MERCHANTESOLUTIONS;
    cgwMerchantAccountsCa:
      Result := GATEWAY_MERCHANTACCOUNTSCA;
    cgwSterling:
      Result := GATEWAY_STERLING;
    cgwFirstData:
      Result := GATEWAY_FIRSTDATA;
  else
    Result := - 1;
  end;
end;

{$REGION 'TCreditCardRec'}

{ TCreditCardRec }

procedure TCreditCardRec.Reset;
begin
  FID := 0;
  FARCUSTO_ID := 0;
  FCREDIT_CARD_ACCOUNT_ID := 0;
  FCREDIT_CARD_ID := 0;
  FCardDescription := '';
  FAccountNumber := '';
  FExpires := '';
  FCVV2 := '';
  FNameOnCard := '';
  FCustomerAddress1 := '';
  FCustomerCity := '';
  FCustomerState := '';
  FCustomerPostalCode := '';
  FCustomerCountry := '';
  FExpirationDate := Now;
  FIsToken := False;
end;

procedure TCreditCardRec.SaveAsNewRecord(var AArcustoCreditCardID: Int64);
var
  ASQL: TStringList;
begin
  // Must have these ID values.
  if (Trunc(ARCUSTO_ID) = 0) or (Trunc(CREDIT_CARD_ID) = 0) then
    Exit;

  if IsToken and (Trunc(CREDIT_CARD_ACCOUNT_ID) = 0) then
    // cc_rscstr.cTXT0000683 = 'Please select a Credit Card Merchant Account.';
    raise Exception.Create(cc_rscstr.cTXT0000683);

  AArcustoCreditCardID := GetNextID('ARCUSTO_CREDIT_CARD');
  ASQL := TStringList.Create;
  try
    ID := AArcustoCreditCardID;
    ASQL.Add('INSERT INTO arcusto_credit_card(id,');
    ASQL.Add('                                arcusto_id,');
    ASQL.Add('                                credit_card_id,');
    ASQL.Add('                                acctno,');
    ASQL.Add('                                name_on,');
    ASQL.Add('                                exp_mmyy,');
    ASQL.Add('                                expiration_date,');
    ASQL.Add('                                is_default,');
    ASQL.Add('                                last_four,');
    ASQL.Add('                                last_four_masked,');
    ASQL.Add('                                created,');
    ASQL.Add('                                createdby,');
    ASQL.Add('                                is_token,');
    ASQL.Add('                                credit_card_account_id)');
    ASQL.Add('    VALUES (:id,');
    ASQL.Add('            :arcusto_id,');
    ASQL.Add('            :credit_card_id,');
    ASQL.Add('            iqms.cc_encrypt.get_encrypted(:acctno),');
    ASQL.Add('            :name_on,');
    ASQL.Add('            :exp_mmyy,');
    ASQL.Add('            :expiration_date,');
    ASQL.Add('            ''N'',');
    ASQL.Add('            :last_four,');
    ASQL.Add('            :last_four_masked,');
    ASQL.Add('            SYSDATE,');
    ASQL.Add('            misc.getusername,');
    ASQL.Add('            :is_token,');
    ASQL.Add('            :credit_card_account_id)');

    ExecuteCommandParam(ASQL.Text,
      ['ID;INT64', 'ARCUSTO_ID;INT64', 'CREDIT_CARD_ID;INT64', 'ACCTNO;S',
      'NAME_ON;S', 'EXP_MMYY;S', 'EXPIRATION_DATE;D', 'LAST_FOUR;S',
      'LAST_FOUR_MASKED;S', 'IS_TOKEN;S', 'CREDIT_CARD_ACCOUNT_ID;INT64'],
      [AArcustoCreditCardID, Trunc(ARCUSTO_ID), Trunc(CREDIT_CARD_ID),
      AccountNumber, NameOnCard, Expires, ExpirationDate, LastFour,
      MaskedAccountNumber, IQMS.Common.Boolean.BoolToYN(IsToken)[1],
      IQMS.Common.Numbers.NullIfZero(Trunc(CREDIT_CARD_ACCOUNT_ID))]);
    // Assign IsDefault
    SaveIsDefault(IsDefault);
    // Assign the last four PAn
    AssignLastFour;
    // Now, refresh the data for this object
    AssignFromCreditCardID(AArcustoCreditCardID);
  finally
    FreeAndNil(ASQL);
  end;
end;

procedure TCreditCardRec.AssignFromCreditCardID
  (const AArcustoCreditCardID: Int64);
begin
  Reset;
  ResetPackage;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT a.id AS id,');
      SQL.Add('       a.arcusto_id,');
      SQL.Add('       a.credit_card_id,');
      SQL.Add('       a.credit_card_account_id,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.acctno) AS acctno,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.name_on) AS name_on,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.exp_mmyy) AS exp_mmyy,');
      SQL.Add('       a.expiration_date,');
      SQL.Add('       NVL(a.is_default, ''N'') AS is_default,');
      SQL.Add('       NVL(a.is_token, ''N'') AS is_token,');
      SQL.Add('       b.addr1 AS addr1,');
      SQL.Add('       b.city AS city,');
      SQL.Add('       b.state AS state,');
      SQL.Add('       b.zip AS zip,');
      SQL.Add('       b.country AS country,');
      SQL.Add('       c.descrip AS credit_card_descrip');
      SQL.Add('  FROM arcusto_credit_card a, arcusto b, credit_card c');
      SQL.Add(Format(' WHERE a.id = %d AND', [AArcustoCreditCardID]));
      SQL.Add('       b.id = a.arcusto_id AND');
      SQL.Add('       c.id(+) = a.credit_card_id');
      Open;
      if not (BOF and EOF) then
        begin
          ID := AArcustoCreditCardID;
          ARCUSTO_ID := FieldByName('ARCUSTO_ID').AsLargeInt;
          CREDIT_CARD_ID := FieldByName('credit_card_id').AsLargeInt;
          CREDIT_CARD_ACCOUNT_ID := FieldByName('credit_card_account_id')
            .AsLargeInt;
          CardDescription := FieldByName('credit_card_descrip').AsString;
          AccountNumber := FieldByName('acctno').AsString;
          Expires := FieldByName('exp_mmyy').AsString;
          FExpirationDate := FieldByName('expiration_date').AsDateTime;
          if FExpirationDate = IQMS.Common.Dates.MinValue then
            FExpirationDate := SelectValueFmtAsFloat(
              'SELECT iqms.cc.get_exp_date(''%s'') FROM DUAL',
              [Expires]);

          NameOnCard := FieldByName('name_on').AsString;
          CustomerAddress1 := FieldByName('addr1').AsString;
          CustomerCity := FieldByName('city').AsString;
          CustomerState := FieldByName('state').AsString;
          CustomerPostalCode := FieldByName('zip').AsString;
          CustomerCountry := FieldByName('country').AsString;
          IsToken := FieldByName('is_token').AsString = 'Y';
          IsDefault := FieldByName('is_default').AsString = 'Y';
        end;
    finally
      Free;
    end;
end;

procedure TCreditCardRec.SaveIsDefault(const AIsDefault: Boolean);
begin
  FIsDefault := AIsDefault;
  if (ID > 0) and (ARCUSTO_ID > 0) then
    begin
      ExecuteCommandFmt(
        'UPDATE arcusto_credit_card SET is_default = ''%s'' ' +
        'WHERE id = %.0f', [IQMS.Common.Boolean.BoolToYN(AIsDefault)[1], ID]);
      if AIsDefault then
        ExecuteCommandFmt(
          'UPDATE arcusto_credit_card SET is_default = NULL ' +
          'WHERE arcusto_id = %.0f AND id <> %.0f',
          [ARCUSTO_ID, ID]);
    end;
end;

procedure TCreditCardRec.AssignLastFour;
begin
  if (Trunc(ID) > 0) and (AccountNumber > '') then
    begin
      ExecuteCommandParam(
        'UPDATE arcusto_credit_card                   '#13 +
        '   SET last_four = :LAST_FOUR,               '#13 +
        '       last_four_masked = :LAST_FOUR_MASKED  '#13 +
        'WHERE id = :ID                               ',
        ['LAST_FOUR;S','LAST_FOUR_MASKED;S','ID;INT64'],
        [GetLastFour, GetMaskedAccountNumber, Trunc(ID)]);
    end;
end;

function TCreditCardRec.GetLastFour: string;
begin
  Result := '';
  if (Trim(AccountNumber) > '') then
  { TODO -oysingh -cWebConvert : IQMS.Common.StringUtils has no RightStr method }
    Result := IQMS.Common.StringUtils.RightStr(AccountNumber, 4);
end;

function TCreditCardRec.GetMaskedAccountNumber: string;
var
  ALast4: string;
  i: Integer;
begin
  Result := '';
  if (Trim(AccountNumber) = '') then
    Exit;
    { TODO -oysingh -cWebConvert : IQMS.Common.StringUtils has no RightStr method }
  ALast4 := IQMS.Common.StringUtils.RightStr(AccountNumber, 4);
  for i := 1 to Length(AccountNumber) - 4 do
    Result := Result + '*';
  Result := Result + ALast4;
end;

procedure TCreditCardRec.SaveExpirationDate;
var
  AMMYY: string;
begin
  if Trunc(ID) > 0 then
    begin
      AMMYY := IQMS.Common.StringUtils.Numerics(Expires);
      ExecuteCommandParam(
        'UPDATE arcusto_credit_card                                 '#13 +
        '   SET exp_mmyy = :EXP_MMYY,                               '#13 +
        '       expiration_date = iqms.cc.get_exp_date(:EXP_MMYY2)  '#13 +
        'WHERE id = :ID                                             ',
        ['EXP_MMYY;S', 'EXP_MMYY2;S', 'ID;INT64'],
        [AMMYY, AMMYY, Trunc(ID)]);
    end;
end;

procedure TCreditCardRec.SaveRecord;
var
  ACreditCardAccountID: Int64;
begin
  ACreditCardAccountID := 0;
  if IsToken then
    ACreditCardAccountID := Trunc(CREDIT_CARD_ACCOUNT_ID);
  if Trunc(ID) > 0 then
    begin
      ExecuteCommandParam(
        'UPDATE arcusto_credit_card                                      '#13 +
        '   SET credit_card_id = :CREDIT_CARD_ID,                        '#13 +
        '       acctno = :ACCTNO,                                        '#13 +
        '       name_on = :NAME_ON,                                      '#13 +
        '       is_token = :IS_TOKEN,                                    '#13 +
        '       credit_card_account_id = :CREDIT_CARD_ACCOUNT_ID         '#13 +
        ' WHERE id = :ID                                                 ',
        ['CREDIT_CARD_ID;INT64','ACCTNO;S','NAME_ON;S','IS_TOKEN;S',
         'CREDIT_CARD_ACCOUNT_ID;INT64','ID;INT64'],
         [Trunc(CREDIT_CARD_ID), AccountNumber, NameOnCard,
          IQMS.Common.Boolean.BoolToYN(IsToken)[1],
          IQMS.Common.Numbers.NullIfZero(ACreditCardAccountID), Trunc(ID)]);
      AssignLastFour;
      SaveExpirationDate;
      SaveIsDefault(IsDefault);
    end;
end;

procedure TCreditCardRec.SetExpires(const Value: string);
begin
  FExpires := IQMS.Common.StringUtils.Numerics(Value);
  FExpirationDate := SelectValueFmtAsFloat(
    'SELECT iqms.cc.get_exp_date(''%s'') FROM DUAL',
    [FExpires]);
end;

procedure TCreditCardRec.SetCardDescription(const Value: string);
begin
  FCardDescription := Value;
  FCreditCardType := GetCardType(Value);
end;

procedure TCreditCardRec.SetTCreditCardType(const Value: TCreditCardType);
begin
  FCreditCardType := Value;
  FCardDescription := CardTypeName[Value];
end;

{$ENDREGION 'TCreditCardRec'}

end.
