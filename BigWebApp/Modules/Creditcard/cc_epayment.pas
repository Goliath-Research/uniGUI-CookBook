unit cc_epayment;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  cc_types,
  IQMS_WebService_TLB,
  IQMS.Common.Regional,
  System.Math,
  cc_helper_classes;

type
  { Fowards }
  TTransactionItemization = class;
  TTransactionItemizationItem = class;
  { TEPaymentCreditCardNumericOptions }
  TEPaymentNumericsOnlyOptions = (cnoPostalCode, cnoTelephone);
  TEPaymentNumericsOnly = set of TEPaymentNumericsOnlyOptions;
  { THttpContentType - Correspondes to ContentTypes enum in DLL }
  THttpContentType = (ctXML, ctHTMLForm, ctJSon);

  { TEPaymentCommandString }
  TEPaymentCommandString = class(TComponent)
  strict private
    { Private declarations }
    FCommand: string;
    FListDelimiter: string;
    FHTMLEncoding: Boolean;
    FAllowEmptyValues: Boolean;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Clear;
    /// <summary> Append a string to the command.  The value will be added to
    /// the command string, as is.
    /// </summary>
    procedure Add(const AValue: string); overload;
    /// <summary> Append a field/value pair to the command, using default
    /// settings.
    /// </summary>
    procedure AddFieldA(const AField, AValue: string;
      const AMaxLength: Integer = 0); overload;
    /// <summary> Append a field/value pair to the command.
    /// </summary>
    procedure AddFieldB(const AField, AValue: string;
      const AMaxLength: Integer = 0; const AHtmlEncoding: Boolean = False;
      AAllowEmptyValue: Boolean = True);
  published
    { Published declarations }
    property Command: string read FCommand write FCommand;
    // Delimiter for each list item.  The default is character is, '&'
    property ListDelimiter: string read FListDelimiter write FListDelimiter;
    /// <summary> Encode strings for HTML.</summary>
    property HTMLEncoding: Boolean read FHTMLEncoding write FHTMLEncoding
      default False;
    /// <summary> Allow empty values in the command string. </summary>
    property AllowEmptyValues: Boolean read FAllowEmptyValues
      write FAllowEmptyValues default True;
  end;

  { TEPaymentCreditCard }
  TEPaymentCreditCard = class(TComponent)
  strict private
    { Private declarations }
    FExpireYear: Integer;
    FCardNumber: ShortString;
    FExpireMonth: Integer;
    FCardType: TCreditCardType;
    FSecurityCode: ShortString;
    FCustomerCity: ShortString;
    FCustomerAddress: ShortString;
    FCustomerFirstName: ShortString;
    FCustomerLastName: ShortString;
    FCustomerEmail: string;
    FCustomerFax: ShortString;
    FCustomerPostalCode: ShortString;
    FCustomerState: ShortString;
    FCustomerTelephone: ShortString;
    FCustomerId: string;
    FCustomerCountry: ShortString;
    FCustomerCompany: ShortString;
    FCustomerCountryCode: ShortString;
    FNumericsOnly: TEPaymentNumericsOnly;
    FIsToken: Boolean;
    FAddAsNewToken: Boolean;
    procedure SetCardNumber(const Value: ShortString);
    function GetExpireMonthStr: ShortString;
    function GetExpireYearAsStr: ShortString;
    function GetCustomerFullName: ShortString;
    procedure SetCustomerFullName(const Value: ShortString);
    function GetExpirationMMYY: ShortString;
    procedure SetExpirationMMYY(const Value: ShortString);
  protected
    { Protected declarations }
    function GetExpire4DigitYearAsStr: ShortString;
    function GetCustomerPostalCode: ShortString;
    function GetCustomerFax: ShortString;
    function GetCustomerTelephone: ShortString;
    procedure ParseStreetAddress(const AAddress: string;
      var ANumber, AStreet: string);
    function GetCardTypeDescription: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Reset;
    function CanCheckAVS: Boolean;
    function GetStreetNumber: string;
    function GetStreetName: string;

    property ExpirationMMYY: ShortString read GetExpirationMMYY
      write SetExpirationMMYY;
  published
    { Published declarations }
    property IsToken: Boolean read FIsToken write FIsToken;
    property AddAsNewToken: Boolean read FAddAsNewToken write FAddAsNewToken;
    // Customer's credit card number for this transaction.
    property CardNumber: ShortString read FCardNumber write SetCardNumber;
    // Credit card type
    property CardType: TCreditCardType read FCardType write FCardType;
    property CardDescription: string read GetCardTypeDescription;
    // A three digit security code located on the back of many credit cards (optional).
    property SecurityCode: ShortString read FSecurityCode write FSecurityCode;
    // Expiration month of the credit card specified in Number .
    property ExpireMonth: Integer read FExpireMonth write FExpireMonth;
    property ExpireMonthAsStr: ShortString read GetExpireMonthStr;
    // Expiration year of the credit card specified in Number .
    property ExpireYear: Integer read FExpireYear write FExpireYear;
    property ExpireYearAsStr: ShortString read GetExpireYearAsStr;
    property Expire4DigitYearAsStr: ShortString read GetExpire4DigitYearAsStr;
    // Customer company name
    property CustomerCompany: ShortString read FCustomerCompany
      write FCustomerCompany;
    // Customer's street address.
    property CustomerAddress: ShortString read FCustomerAddress
      write FCustomerAddress;
    // Customer's city.
    property CustomerCity: ShortString read FCustomerCity write FCustomerCity;
    // Customer's country.
    property CustomerCountry: ShortString read FCustomerCountry
      write FCustomerCountry;
    // Customer's country.
    property CustomerCountryCode: ShortString read FCustomerCountryCode
      write FCustomerCountryCode;
    // Customer's email address.
    property CustomerEmail: string read FCustomerEmail write FCustomerEmail;
    // Customer's fax number.
    property CustomerFax: ShortString read GetCustomerFax write FCustomerFax;
    // Customer's first name.
    property CustomerFirstName: ShortString read FCustomerFirstName
      write FCustomerFirstName;
    // Customer's full name.
    property CustomerFullName: ShortString read GetCustomerFullName
      write SetCustomerFullName;
    // Merchant-generated customer Id (ARCUSTO_ID).
    property CustomerId: string read FCustomerId write FCustomerId;
    // Customer's last name.
    property CustomerLastName: ShortString read FCustomerLastName
      write FCustomerLastName;
    // Customer's phone number.
    property CustomerTelephone: ShortString read GetCustomerTelephone
      write FCustomerTelephone;
    // Customer's state.
    property CustomerState: ShortString read FCustomerState
      write FCustomerState;
    // Customer's zip code (or postal code if outside of the USA).
    property CustomerPostalCode: ShortString read GetCustomerPostalCode
      write FCustomerPostalCode;
    property NumericsOnly: TEPaymentNumericsOnly read FNumericsOnly
      write FNumericsOnly;
  end;

  { TEPaymentResponse }
  TEPaymentResponse = class(TComponent)
  strict private
    { Private declarations }
    FTransactionID: ShortString;
    FResponseData: string;
    FStatusCode: ShortString;
    FStatusDescription: string;
    FStatusClass: TResponseClass;
    FApprovalCode: ShortString;
    FApproved: Boolean;
    FInvoiceNumber: ShortString;
    FErrorText: string;
    FSecurityResultCode: ShortString;
    FIsSecurityCodeApproved: Boolean;
    FAVSCode: ShortString;
    FIsAVSApproved: Boolean;
    FProcessorCode: ShortString;
    FErrorCode: ShortString;
    FAVSDescription: string;
    FSecurityResultDescription: string;
    FAVSResponseClass: TAVSResponseClass;
    FSecurityResponseClass: TCVVResponseClass;
    FErrorDescription: string;
    FReturnCode: ShortString;
    FReturnValues: TStringList;
    FTimeStamp: ShortString;
    FErrorDetails: string;
    FReferenceNumber: ShortString;
    FTransactionType: ShortString;
    FAVSRetry: Boolean;
    FSecurityRetry: Boolean;
    FNewToken: string;
    FTokenStatusClass: TTokenResponseClass;
    FTokenStatusCode: ShortString;
    FTokenStatusDescription: string;
    procedure SetSecurityResultCode(const Value: ShortString);
    procedure SetAVSCode(const Value: ShortString);
    function GetRetry: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
    procedure Reset;
    procedure ProcessSecurityCode(const ACode: ShortString;
      var ADescription: string; var AResponseClass: TCVVResponseClass);
    procedure ProcessAVSCode(const ACode: ShortString; var ADescription: string;
      var AResponseClass: TAVSResponseClass);
    procedure AddReturnValue(AName, AValue: string);
    function GetReturnValue(AName: string): string;
    // If a gateway returns something non-standard, then this way, we
    // save the returned value (for submission in future requests),
    // but still display the correct description to the user.
    procedure SetNonStandardSecurityResultCode(const AReturnedValue,
      AStandardValue: ShortString);
    procedure SetNonStandardAVSResultCode(const AReturnedValue,
      AStandardValue: ShortString);
    procedure GetSummary(var ALines: TStringList);
    procedure GetSummaryDetails(const ATransactionType: TTransactionType;
      var AText: string);
    property Retry: Boolean read GetRetry;
  published
    // The entire raw response data string returned by the gateway processor.
    property ResponseData: string read FResponseData write FResponseData;
    // The response code returned by the gateway processor
    property ReturnCode: ShortString read FReturnCode write FReturnCode;
    // Note:  The "Status" properties contain status generic status
    // information for the transaction.  Based on the code returned
    // by the gateway, we return the description and class.
    // It is a human-readable summary describing the response.
    // Indicates the status of the authorization request.
    property StatusCode: ShortString read FStatusCode write FStatusCode;
    property StatusDescription: string read FStatusDescription
      write FStatusDescription;
    property StatusClass: TResponseClass read FStatusClass write FStatusClass;

    // Tokenization response. These values can be distinct from the overall
    // response.
    property TokenStatusCode: ShortString read FTokenStatusCode
      write FTokenStatusCode;
    property TokenStatusDescription: string read FTokenStatusDescription
      write FTokenStatusDescription;
    property TokenStatusClass: TTokenResponseClass read FTokenStatusClass
      write FTokenStatusClass;
    // If a new token was requested, it is returned here
    property NewToken: string read FNewToken write FNewToken;

    // Indicates the status of the last transaction.
    property Approved: Boolean read FApproved write FApproved;
    // Contains an authorization code when a transaction has been approved.
    // Depending on the gateway, this may be the same as the return code,
    // or it may not.
    property ApprovalCode: ShortString read FApprovalCode write FApprovalCode;
    // Contains the Address Verification System result code.  The AVS
    // codes are standardized, regardless of gateway.  So, separate
    // processor classes only need to set the AVSCode property for
    // everything else to fill in.
    property IsAVSApproved: Boolean read FIsAVSApproved write FIsAVSApproved;
    property AVSCode: ShortString read FAVSCode write SetAVSCode;
    property AVSResultDescription: string read FAVSDescription
      write FAVSDescription;
    property AVSResponseClass: TAVSResponseClass read FAVSResponseClass
      write FAVSResponseClass;
    // Contains the returned CVV2 result code if it was requested.
    // Like the AVS codes, the security codes (CVV2, or whatever you
    // want to call them) are standardized, regardless of gateway.
    // Just set the SecurityResultCode property for the other properties
    // to populate.
    property IsSecurityCodeApproved: Boolean read FIsSecurityCodeApproved
      write FIsSecurityCodeApproved;
    property SecurityResultCode: ShortString read FSecurityResultCode
      write SetSecurityResultCode;
    property SecurityResultDescription: string read FSecurityResultDescription
      write FSecurityResultDescription;
    property SecurityResponseClass: TCVVResponseClass
      read FSecurityResponseClass write FSecurityResponseClass;
    // Contains the Visa Transaction Identifier or MasterCard Reference Number.
    property TransactionID: ShortString read FTransactionID
      write FTransactionID;
    // Response Transaction Type -- the gateway's term for the transaction
    // type.  Note:  this may or may not be returned as a response field.
    // If not, then the original request respose type should be used.
    property TransactionType: ShortString read FTransactionType
      write FTransactionType;
    // Additional error code returned by some gateways.
    property ErrorCode: ShortString read FErrorCode write FErrorCode;
    // Additional error description returned by some gateways.
    property ErrorDescription: string read FErrorDescription
      write FErrorDescription;
    // Full error text returned by gateway server
    property ErrorText: string read FErrorText write FErrorText;
    // Error details: Additional, helpful information about the
    // error, including causes and solutions.  This value is provided
    // by our own code, not the gateway.
    property ErrorDetails: string read FErrorDetails write FErrorDetails;
    // Invoice number submitted in authorization request (if applicable).
    // Optional:  Not all gateways return this value.
    property InvoiceNumber: ShortString read FInvoiceNumber
      write FInvoiceNumber;
    // Time stamp as it was returned in the response.  Not all
    // gateways return this value.
    property TimeStamp: ShortString read FTimeStamp write FTimeStamp;
    // Response code from the underlying processor.
    // Optional:  Not all gateways return this value.
    property ProcessorCode: ShortString read FProcessorCode
      write FProcessorCode;
    // Response reference number
    // Optional:  Not all gateways return this value.
    property ReferenceNumber: ShortString read FReferenceNumber
      write FReferenceNumber;
    // Additional elements, unique to a given gateway API
    property ReturnValues: TStringList read FReturnValues;
  end;

  { TEPaymentFirewall }
  TEPaymentFirewall = class(TComponent)
  strict private
    { Private declarations }
    FDetect: Boolean;
    FPort: Integer;
    FPassword: string;
    FFirewallType: TFirewallType;
    FHost: string;
    FUser: string;
    FDomain: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Reset;
  published
    property Detect: Boolean read FDetect write FDetect;
    property Host: string read FHost write FHost;
    property Domain: string read FDomain write FDomain;
    property Port: Integer read FPort write FPort;
    property User: string read FUser write FUser;
    property Password: string read FPassword write FPassword;
    property FirewallType: TFirewallType read FFirewallType write FFirewallType;
  end;

  { TEPaymentLevel3Options }
  TEPaymentLevel3Options = class(TComponent)
  strict private
    { Private declarations }
    FLocalTaxAmount: Real;
    FLocalTaxExempt: Boolean;
    FNationalTaxAmount: Real;
    FDutyAmount: Real;
    FCustomerTaxID: string;
    FCommodityCode: string;
    FItems: TTransactionItemization;
    FMerchantTaxID: string;
    FDiscountAmount: Real;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
    procedure Reset;
  published
    { Published declarations }
    property LocalTaxAmount: Real read FLocalTaxAmount write FLocalTaxAmount;
    property LocalTaxExempt: Boolean read FLocalTaxExempt write FLocalTaxExempt;
    property NationalTaxAmount: Real read FNationalTaxAmount
      write FNationalTaxAmount;
    property DutyAmount: Real read FDutyAmount write FDutyAmount;
    property DiscountAmount: Real read FDiscountAmount write FDiscountAmount;
    property MerchantTaxID: string read FMerchantTaxID write FMerchantTaxID;
    property CustomerTaxID: string read FCustomerTaxID write FCustomerTaxID;
    property CommodityCode: string read FCommodityCode write FCommodityCode;
    property Itemization: TTransactionItemization read FItems write FItems;
  end;

  { TChargeSourceItems }
  TTransactionItemization = class(TCollection)
  strict private
    { Private declarations }
    function GetItems(index: Integer): TTransactionItemizationItem;
    procedure SetItems(index: Integer;
      const Value: TTransactionItemizationItem);
    function AddItem: TTransactionItemizationItem;
  private
    function GetModifiedFreight(const AOriginalQuantity, ANewQuantity,
      AOriginalFreight: Real): Real;
  public
    { Public declarations }
    constructor Create;
    // function SafeAddItem(AItemNumber, AItemDescription: string;
    // AQuantity, APrice, ATax, ATotalAmount, ADiscount: Real;
    // AUOM, ACommodityCode: string): TTransactionItemizationItem;
    function Add: TTransactionItemizationItem;
    property Items[index: Integer]: TTransactionItemizationItem read GetItems
      write SetItems; default;
  end;

  { TChargeSourceItem }
  TTransactionItemizationItem = class(TCollectionItem)
  strict private
    { Private declarations }
    FPrice: Real;
    FTax: Real;
    FFreight: Real;
    FTotalAmount: Real;
    FItemDescription: string;
    FItemNumber: string;
    FQuantity: Real;
    FCommodityCode: string;
    FUOM: string;
    FDiscount: Real;
    FTaxRate: Real;
    // function GetTaxRate: Real;
    function GetItemNumber: string;
    function GetItemDescription: string;
    procedure SetTax(const Value: Real);
    procedure SetTotalAmount(const Value: Real);
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property ItemNumber: string read GetItemNumber write FItemNumber;
    property ItemDescription: string read GetItemDescription
      write FItemDescription;
    property Quantity: Real read FQuantity write FQuantity;
    property Price: Real read FPrice write FPrice;
    property Tax: Real read FTax write SetTax;
    property Freight: Real read FFreight write FFreight;
    property TotalAmount: Real read FTotalAmount write SetTotalAmount;
    property CommodityCode: string read FCommodityCode write FCommodityCode;
    property TaxRate: Real read FTaxRate write FTaxRate; // GetTaxRate;
    property Discount: Real read FDiscount write FDiscount;
    property UOM: string read FUOM write FUOM;
  end;

  { TEPaymentCompany }
  TEPaymentCompany = class(TComponent)
  strict private
    { Private declarations }
    FPostalCode: string;
    FCompanyName: string;
    FID: Real;
    FAddress2: string;
    FAddress3: string;
    FCountry: string;
    FAddress1: string;
    FCity: string;
    FStateOrRegion: string;
    FEmail: string;
    FFax: string;
    FTelephone: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Reset;
    function CountryCode(const AFormat: IQMS.Common.Regional.TCountryCodeType): string;
    function CountryCode2Char: string;
    function CountryCode3Char: string;
    function CountryCode3Digit: string;
  published
    { Published declarations }
    property ID: Real read FID write FID;
    property CompanyName: string read FCompanyName write FCompanyName;
    property Address1: string read FAddress1 write FAddress1;
    property Address2: string read FAddress2 write FAddress2;
    property Address3: string read FAddress3 write FAddress3;
    property City: string read FCity write FCity;
    property StateOrRegion: string read FStateOrRegion write FStateOrRegion;
    property PostalCode: string read FPostalCode write FPostalCode;
    property Country: string read FCountry write FCountry;
    property Telephone: string read FTelephone write FTelephone;
    property Fax: string read FFax write FFax;
    property Email: string read FEmail write FEmail;
  end;

  { TEPaymentReversalData }
  TEPaymentReversalData = class(TComponent)
  strict private
    { Private declarations }
    FOriginalTransactionType: TTransactionType;
    FRequestedAmount: Real;
    FOriginalAmount: Real;
    FReferenceNumber: string;
    FIsPreSettlement: Boolean;
    FOriginalTransDate: TDateTime;
    FOriginalApprovalCode: string;
    FOriginalReturnCode: string;
    FCurrentAmount: Real;
    FParams: TStringList;
    function GetIsPartial: Boolean;
    procedure SetOriginalTransactionType(const Value: TTransactionType);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
    procedure Reset;
  published
    /// <summary>The original transaction type, such as ttAuthOnly or
    /// ttSale.</summary>
    property OriginalTransactionType: TTransactionType
      read FOriginalTransactionType write SetOriginalTransactionType;
    /// <summary>The amount of the original authorization or sale</summary>
    property OriginalAmount: Real read FOriginalAmount write FOriginalAmount;
    /// <summary>The date of the original transaction</summary>
    property OriginalTransDate: TDateTime read FOriginalTransDate
      write FOriginalTransDate;
    /// <summary>The approval code returned with the original
    /// transaction</summary>
    property OriginalApprovalCode: string read FOriginalApprovalCode
      write FOriginalApprovalCode;
    /// <summary>The return code returned with the original
    /// transaction</summary>
    property OriginalReturnCode: string read FOriginalReturnCode
      write FOriginalReturnCode;
    /// <summary>The original transaction amount less any refunds.
    /// It is the transaction amount that is currently on record.</summary>
    property CurrentAmount: Real read FCurrentAmount write FCurrentAmount;
    /// <summary>The amount requested for this void or refund.</summary>
    property RequestedAmount: Real read FRequestedAmount write FRequestedAmount;
    /// <summary>Indicates whether or not the transaction was an authorization
    /// only (ttAuthOnly) and has not yet been settled.</summary>
    property IsPreSettlement: Boolean read FIsPreSettlement
      write FIsPreSettlement;
    /// <summary>The reference number returned in the response from the
    /// original transaction.</summary>
    property ReferenceNumber: string read FReferenceNumber
      write FReferenceNumber;
    /// <summary>Indicates whether or not this is a partial reversal.
    /// Partial reversals are not permitted for voids.</summary>
    property IsPartial: Boolean read GetIsPartial;

    property Params: TStringList read FParams;
  end;

  { TEPaymentSettlementData }
  TEPaymentSettlementData = class(TComponent)
  private
    { Private declarations }
    FRequestedAmount: Real;
    FOriginalAmount: Real;
    FOriginalTransDate: TDateTime;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Reset;
  published
    { Published declarations }
    /// <summary>The amount of the original authorization or sale</summary>
    property OriginalAmount: Real read FOriginalAmount write FOriginalAmount;
    /// <summary>The date of the original transaction</summary>
    property OriginalTransDate: TDateTime read FOriginalTransDate
      write FOriginalTransDate;
    /// <summary>The amount requested for this settlement.</summary>
    property RequestedAmount: Real read FRequestedAmount write FRequestedAmount;
  end;

  { TEPaymentAddendum }
  TEPaymentAddendum = class(TComponent)
  private
    { Private declarations }
    FItems: TStrings;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
    procedure Reset;
    procedure Add(const ACode, AValue: string);
  published
    { Published declarations }
    property Items: TStrings read FItems;
  end;

  { TEPaymentTimeOutReversalStatus }
  TEPaymentTimeOutReversalStatus = class(TComponent)
  private
    { Private declarations }
    FAttempt: Integer;
    FRequired: Boolean;
    FResolved: Boolean;
    FProcessing: Boolean;
    procedure SetRequired(const Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure Reset;
    procedure IncAttempt;
    property Processing: Boolean read FProcessing write FProcessing;
    property Required: Boolean read FRequired write SetRequired;
    property Resolved: Boolean read FResolved write FResolved;
    property Attempt: Integer read FAttempt write FAttempt;
  end;

  { TEPaymentProcessorClass }
  TEPaymentProcessorClass = class of TEPaymentProcessor;

  { TEPaymentProcessor }
  { Base class for all epayment processors specific to a gateway }
  TEPaymentProcessor = class(TComponent)
  strict private
    { Private declarations }
    FTransactionID: ShortString;
    FTransactionAmount: Real;
    FTestMode: Boolean;
    FTransactionDesc: string;
    FInvoiceNumber: ShortString;
    FTimeout: Integer;
    FEPaymentCreditCard: TEPaymentCreditCard;
    FProcessingClass: TProcessingClass;
    FPONumber: string;
    FTaxAmount: Real;
    FFreightAmount: Real;
    FDiscountAmount: Real;
    FResponse: TEPaymentResponse;
    FFirewall: TEPaymentFirewall;
    FLastRequest: string;
    FLastResponse: string;
    FSalesOrderNumber: string;
    // FDestinationPostalCode: string;
    // FDestinationCountryCode: string;
    FTaxExempt: Boolean;
    // FSenderPostalCode: string;
    FLevel3Options: TEPaymentLevel3Options;
    FSalesOrderDate: TDateTime;
    FTransactionMethod: TTransactionMethod;
    FHttpContentType: THttpContentType;
    FTransactionCurrencyCode: string;
    FTransactionCurrencyCode3Digit: string;
    FDestinationCompany: TEPaymentCompany;
    FSenderCompany: TEPaymentCompany;
    FTransactionDate: TDateTime;
    FSalesOrderID: Integer;
    FReversalData: TEPaymentReversalData;
    FSettlementData: TEPaymentSettlementData;
    FEPaymentAddendum: TEPaymentAddendum;
    FEPaymentTimeOutReversalStatus: TEPaymentTimeOutReversalStatus;
    FCreditCardAccountID: Integer;
    FInvoiceDate: TDateTime;
    procedure SetTestMode(const Value: Boolean);
    function GetDestinationCountryCode: string;
    function GetSenderCountryCode: string;
    function GetRetry: Boolean;
  protected const
    DEFAULT_TIME_OUT: Integer = 60;
  protected
    { Protected declarations }
    FTransactionType: TTransactionType;
    FCountryCodeFormat: TCountryCodeType;
    FCommand: TEPaymentCommandString;
    FForceVoiceAuthCode: string;
    FGatewayURL: string;
    FGatewayPort: Integer;
    FGateway: TCreditCardGateway;
    FRetry: Boolean;
    FHttpUserAgent: string;
    // FTimeOutReversal: Boolean;
    // FTimeOutReversalRequired: Boolean;
    // Verify that this setting has been populated by the end
    // user.  This method is called within the Validate() method
    // to ensure the required merchant account settings have
    // been provided.
    procedure ValidateSetting(const ASettingValue, ASettingName: string);

    { Helper methods }
    procedure GetResponseStatusMasterCard(const AResponseCode: string;
      var AResponseClass: TResponseClass);
    procedure GetResponseStatusVisa(const AResponseCode: string;
      var AResponseClass: TResponseClass);

    { Abstracts }
    procedure GetURL(var AURL: string; var APort: Integer); virtual; abstract;
    procedure ParseResponseText; virtual; abstract;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); virtual; abstract;

    { Virtuals }
    function FormatFloatValue(const AValue: Real): string; virtual;
    function FixText(const AValue: string): string; virtual;
    /// <summary> Append a field/value pair to the command, using default
    /// settings.
    /// </summary>
    procedure AddFieldA(const AField, AValue: string;
      const AMaxLength: Integer = 0);
    /// <summary> Append a field/value pair to the command.
    /// </summary>
    procedure AddFieldB(const AField, AValue: string;
      const AMaxLength: Integer = 0; const AHtmlEncoding: Boolean = False;
      AAllowEmptyValue: Boolean = True);

    procedure BuildCommand(const ATransactionType: TTransactionType); virtual;
    function ExecuteCommand(const ACommand: string;
      const ASimulation: Boolean = False): Boolean;
    procedure Validate; virtual;
    // Determine if this transaction type permits sending credit card
    // data.  Sending credit card information with some transaction types
    // is inappropriate (frowned upon) because it indicates we are
    // retaining credit card information.
    function CanSendCardData(const ATransactionType: TTransactionType)
      : Boolean; virtual;
    procedure CheckSendTimeOutReversal;
  public
    { Public declarations }
    { Constructor and destructor }
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
    { Core, public methods }
    procedure Reset;
    function LastRequest: string;
    function LastResponse: string;
    { Virtual methods }
    function Authorize: Boolean; virtual;
    function Sale: Boolean; virtual;
    function Force(AVoiceAuthCode: string): Boolean; virtual;
    function Capture: Boolean; virtual;
    function Refund: Boolean; virtual;
    function Void: Boolean; virtual;
    function AVSCheck: Boolean; virtual;
    function AuthenticateCard: Boolean; virtual;
    function AddToken(var ANewToken: string): Boolean; virtual;
    function DeleteToken: Boolean; virtual;
    function QueryToken: Boolean; virtual;
    function SendTimeOutReversal: Boolean; virtual;
    procedure AssignDestinationCountry(const ACountryName: string); virtual;
    function CanProcessLevel3: Boolean;
    function GetLastTransactionType: TTransactionType;
    function MerchantName: string;
    function MerchantWebSite: string;
    property OriginalResponse: TEPaymentAddendum read FEPaymentAddendum;
    property Retry: Boolean read GetRetry;
    // property TimeOutReversalRequired: Boolean read FTimeOutReversalRequired;

    /// <summary> Simulate the results of a request. </summary>
    procedure SimulateRequest(const ATransactionType: TTransactionType;
      const ARequest: string; var AResult: string);
    /// <summary> Simulate the results of a response. </summary>
    procedure SimulateResponse(const ATransactionType: TTransactionType;
      const AResponse: string; var AResult: string);

    /// <summary> Update the response status class and description for a
    /// simple, algorithmic verification of a credit card.  Since no
    /// information is sent to the gateway, the response status is
    /// artificially updated to reflect a success or failure.
    /// </summary>
    procedure UpdateStatusForSimpleVerificationCheck(const APassed: Boolean;
      const AErrorMsg: string);

  published
    { Published declarations }
    property CreditCardAccountID: Integer read FCreditCardAccountID
      write FCreditCardAccountID;

    property CreditCard: TEPaymentCreditCard read FEPaymentCreditCard;
    // Gateway to process transactions with.
    property Gateway: TCreditCardGateway read FGateway write FGateway;
    // Default URL for a specific Gateway.
    property GatewayURL: string read FGatewayURL write FGatewayURL;
    // Default Port for a specific Gateway.
    property GatewayPort: Integer read FGatewayPort write FGatewayPort;
    // Transaction method
    property TransactionMethod: TTransactionMethod read FTransactionMethod
      write FTransactionMethod;
    // Response values:  this is supplied and interpreted by descendent
    property Response: TEPaymentResponse read FResponse;
    // Firewall
    property Firewall: TEPaymentFirewall read FFirewall;
    // HTTP Requests
    property HttpContentType: THttpContentType read FHttpContentType
      write FHttpContentType;
    // Turns test mode on and off for transactions sent to the current Gateway.
    property TestMode: Boolean read FTestMode write SetTestMode;
    // A timeout for the component.
    property TimeOut: Integer read FTimeout write FTimeout;
    // Purchase amount for an authorization transaction.
    property TransactionAmount: Real read FTransactionAmount
      write FTransactionAmount;
    property TaxAmount: Real read FTaxAmount write FTaxAmount;
    property TaxExempt: Boolean read FTaxExempt write FTaxExempt;
    property FreightAmount: Real read FFreightAmount write FFreightAmount;
    property DiscountAmount: Real read FDiscountAmount write FDiscountAmount;

    // Merchant-generated transaction Id used for all transactions.
    property TransactionID: ShortString read FTransactionID
      write FTransactionID;
    property TransactionCurrencyCode: string read FTransactionCurrencyCode
      write FTransactionCurrencyCode;
    // FTransactionCurrencyCode3Digit
    // Description of goods purchased.
    property TransactionDescription: string read FTransactionDesc
      write FTransactionDesc;
    property TransactionDate: TDateTime read FTransactionDate
      write FTransactionDate;
    property InvoiceNumber: ShortString read FInvoiceNumber
      write FInvoiceNumber;
    property InvoiceDate: TDateTime read FInvoiceDate
      write FInvoiceDate;
    property SalesOrderNumber: string read FSalesOrderNumber
      write FSalesOrderNumber;
    property SalesOrderDate: TDateTime read FSalesOrderDate
      write FSalesOrderDate;
    property SalesOrderID: Integer read FSalesOrderID write FSalesOrderID;
    property PurchaseOrderNumber: string read FPONumber write FPONumber;
    // Processing class or level
    property ProcessingClass: TProcessingClass read FProcessingClass
      write FProcessingClass;
    // Level III product itemization from order or invoice
    property Level3Options: TEPaymentLevel3Options read FLevel3Options;
    // This data is generally required for Level II processing
    // Sender (Ship From) address
    property Sender: TEPaymentCompany read FSenderCompany;
    // Shipping (Ship To) address
    property Destination: TEPaymentCompany read FDestinationCompany;
    // Reversal data.  Options/information to process voids and refunds.
    property ReversalData: TEPaymentReversalData read FReversalData;
    // Settlement data. Options/information to process a settlement.
    property SettlementData: TEPaymentSettlementData read FSettlementData;
    // Time-out reversal status
    property TimeOutReversalStatus: TEPaymentTimeOutReversalStatus read
      FEPaymentTimeOutReversalStatus;
    // property SenderPostalCode: string read FSenderPostalCode
    // write FSenderPostalCode;
    // property DestinationPostalCode: string read FDestinationPostalCode
    // write FDestinationPostalCode;
    property SenderCountryCode: string read GetSenderCountryCode;
    property DestinationCountryCode: string read GetDestinationCountryCode;
  end;

  { TEPaymentTSYS }
  TEPaymentTSYS = class sealed(TEPaymentProcessor)
  strict private
  const
    TSYS_DEVELOPER_ID = '001602';
    TSYS_SOFTWARE_VERSION: string[20] = '001602G012';
  strict private
    { Private declarations }
    FMerchantCurrencyCode: string;
    FMerchantCountryCode: string;
    FMerchantLanguage: string;
    FMerchantPassword: string;
    FMerchantID: string;
    FMerchantOperator: string;
    FMerchantDeviceID: string;
    FMerchantTransactionKey: string;
    FGeneratingTransactionKey: Boolean;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    function ToDateTime(const AValue: TDateTime): string;
    function ToDate(const AValue: TDateTime): string;
    function GetCardTypeCode: string;
    procedure BuildCommand_API_1(ATransactionType: TTransactionType);
    procedure BuildCommand_ItemDetails_API_1;
    procedure BuildCommand_API_3(const ATransactionType: TTransactionType);
    procedure ParseResponseText_API_1;
    procedure ParseResponseText_API_3;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseText; override;
    function FormatFloatValue(const AValue: Real): string; override;
    function FormatFloatValue_API_1(const AValue: Real): string;
    procedure Validate; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function Authorize: Boolean; override;
    function Force(AVoiceAuthCode: string): Boolean; override;
    function Sale: Boolean; override;
    function Capture: Boolean; override;
    function Refund: Boolean; override;
    function Void: Boolean; override;
    function AVSCheck: Boolean; override;

    // Commands that are unique to TSYS
    /// <summary> Generate a TSYS transaction key. </summary>
    function GenerateTransactionKey(var AErrorText: string): Boolean;
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    // Merchant Account Information
    property MerchantID: string read FMerchantID write FMerchantID;
    property MerchantDeviceID: string read FMerchantDeviceID
      write FMerchantDeviceID;
    property MerchantOperator: string read FMerchantOperator
      write FMerchantOperator;
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    property MerchantCurrencyCode: string read FMerchantCurrencyCode
      write FMerchantCurrencyCode;
    property MerchantCountryCode: string read FMerchantCountryCode
      write FMerchantCountryCode;
    property MerchantLanguageCode: string read FMerchantLanguage
      write FMerchantLanguage;
    property MerchantTransactionKey: string read FMerchantTransactionKey
      write FMerchantTransactionKey;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentMerchantAccountsCa }
  TEPaymentMerchantAccountsCa = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantPassword: string;
    FMerchantLogin: string;
    procedure BuildCommand_Start(ATransactionType: TTransactionType;
      var ACommand: TStringList);
    procedure BuildCommand_CreditCardInformation(AAmount: Real;
      var ACommand: TStringList);
    procedure BuildCommand_ItemDetails(ACommand: TStringList);
    procedure BuildCommand_Level2(var ACommand: TStringList);
    procedure BuildCommand_End(var ACommand: TStringList);
  strict protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseText; override;
    procedure Validate; override;
    function FormatFloatValue(const AValue: Real): string; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function Authorize: Boolean; override;
    function Force(AVoiceAuthCode: string): Boolean; override;
    function Sale: Boolean; override;
    function Capture: Boolean; override;
    function Refund: Boolean; override;
    function Void: Boolean; override;
    function AVSCheck: Boolean; override;
    function AuthenticateCard: Boolean; override;
  published
    { Published declarations }
    // property AuthCode;
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    // Merchant's Gateway login.
    property MerchantLogin: string read FMerchantLogin write FMerchantLogin;
    // Merchant's Gateway password.
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
  end;

  { TEPaymentSterling }
  TEPaymentSterling = class sealed(TEPaymentProcessor)
  strict private
  const
    // STERLING_VENDOR_NAME: string[20] = 'IQMS';
    STERLING_SOFTWARE_NAME: string[20] = 'IQMS';//'TBD';
    STERLING_SOFTWARE_VERSION: string[10] = '2016';//'2012';
    STERLING_API_VERSION: string[10] = '5.0.02'; // '3.0';
  strict private
    { Private declarations }
    FMerchantTerminalID: string;
    FMerchantID: string;
    FBatchID: ShortString;
    FBatchCount: Integer;
    FBatchStatus: string;
    FMerchantStoreID: string;
    FMerchantSecurityCode: string;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure BuildCommand_CustomerOrderInfo(ATransactionType
      : TTransactionType);
    procedure BuildCommand_PaymentInfo;
    procedure BuildCommand_ItemDetails;
    procedure BuildCommand_Header;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseText; override;
    procedure Validate; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function Authorize: Boolean; override;
    function Sale: Boolean; override;
    function CloseBatch: Boolean;
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property MerchantStoreID: string read FMerchantStoreID
      write FMerchantStoreID;
    property MerchantSecurityCode: string read FMerchantSecurityCode
      write FMerchantSecurityCode;
    property MerchantID: string read FMerchantID write FMerchantID;
    property MerchantTerminalID: string read FMerchantTerminalID
      write FMerchantTerminalID;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
    property BatchID: ShortString read FBatchID;
    property BatchStatus: string read FBatchStatus;
    property BatchCount: Integer read FBatchCount;
  end;

  { TEPaymentMES - Merchant e-Solutions }
  TEPaymentMES = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantProfileID: string;
    FMerchantCurrencyCode: string;
    FMerchantProfileKey: string;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure BuildCommand_Header;
    procedure BuildCommand_ItemDetails;
  strict protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseText; override;
    procedure Validate; override;
    function FormatFloatValue(const AValue: Real): string; override;
    function FormatTaxRateValue(const AValue: Real): string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property MerchantProfileID: string read FMerchantProfileID
      write FMerchantProfileID;
    property MerchantProfileKey: string read FMerchantProfileKey
      write FMerchantProfileKey;
    property MerchantCurrencyCode: string read FMerchantCurrencyCode
      write FMerchantCurrencyCode;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentAuthorizeNet }
  TEPaymentAuthorizeNet = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantID: string;
    FMerchantTransKey: string;
    FMerchantHashValue: string;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure BuildCommand_ItemDetails;
  private
    function GetInternalError(ACode: ShortString): string;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseText; override;
    procedure Validate; override;
    function CanSendCardData(const ATransactionType: TTransactionType)
      : Boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    function Refund: Boolean; override;
    function Void: Boolean; override;
    function AVSCheck: Boolean; override;
    function AuthenticateCard: Boolean; override;
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property MerchantID: string read FMerchantID write FMerchantID;
    property MerchantTransKey: string read FMerchantTransKey
      write FMerchantTransKey;
    property MerchantHashValue: string read FMerchantHashValue
      write FMerchantHashValue;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentMoneris }
  TEPaymentMoneris = class(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantLogin: string;
    FMerchantPassword: string;
    FMerchantLanguage: string;
  strict protected
    { Protected declarations }
    function FixText(const AValue: string): string; override;
    procedure Validate; override;
    // procedure BuildCommand; virtual; abstract;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    procedure ParseResponseList(var AElements: TStringList);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);

    property MerchantLogin: string read FMerchantLogin write FMerchantLogin;
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    property MerchantLanguageCode: string read FMerchantLanguage
      write FMerchantLanguage;
  end;

  { TEPaymentMonerisCanada }
  TEPaymentMonerisCanada = class sealed(TEPaymentMoneris)
  strict private
    { Private declarations }
    // procedure BuildCommand_ItemDetails;
  strict protected
    { Protected declarations }
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ParseResponseText; override;
  public
    constructor Create(AOwner: TComponent);
    { Public declarations }
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property MerchantLogin;
    property MerchantPassword;
    property MerchantLanguageCode;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentMonerisUSA }
  TEPaymentMonerisUSA = class sealed(TEPaymentMoneris)
  strict private
    { Private declarations }
    // procedure BuildCommand_ItemDetails;
  strict protected
    { Protected declarations }
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure ParseResponseText; override;
  public
    constructor Create(AOwner: TComponent);
    { Public declarations }
  published
    { Published declarations }
    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property MerchantLogin;
    property MerchantPassword;
    property MerchantLanguageCode;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentElavon }
  TEPaymentElavon = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantLogin: string;
    FMerchantPassword: string;
    FMerchantUserID: string;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure Validate; override;
    procedure ParseResponseText; override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    function FormatFloatValue(const AValue: Real): string; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);

    // MerchantLogin ("Account ID")
    property MerchantLogin: string read FMerchantLogin write FMerchantLogin;
    // MerchantPassword ("PIN #")
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    // MerchantUserID ("User ID")
    property MerchantUserID: string read FMerchantUserID write FMerchantUserID;

    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;

  end;

  { TEPaymentPayPal }
  TEPaymentPayPal = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantLogin: string;
    FMerchantPassword: string;
    FMerchantTransKey: string;
  private
    function CardTypeStr: string;
    function GetPayPalInternalError527(ACode: ShortString): string;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure Validate; override;
    procedure ParseResponseText; override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    // MerchantLogin ("Account ID")
    property MerchantLogin: string read FMerchantLogin write FMerchantLogin;
    // MerchantPassword ("PIN #")
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    // MerchantSignature ("Signature")
    property MerchantSignature: string read FMerchantTransKey
      write FMerchantTransKey;

    function Refund: Boolean; override;

    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;

  end;

  { TEPaymentFirstDataTimeOutReversalRec }
  TEPaymentFirstDataTimeOutReversalRec = packed record
    OrigSTAN: string;
    OrigAuthID: string;
    OrigLocalDateTime: string;
    OrigTranDateTime: string;
    OrigRespCode: string;
    OrigAVSResultCode: string;
    OrigCCVResultCode: string;
  end;

  { TEPaymentFirstData }
  TEPaymentFirstData = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantID: string;
    FTerminalID: string;
    FGroupID: string;
    FDatawireID: string;
    FOriginalTransactionTypeForVoid: TTransactionType;
    FSTAN: string;
    FLocalDateTime: string;
    FTranDateTime: string;
    FTimeOutReversalRec: TEPaymentFirstDataTimeOutReversalRec;
    function CardTypeStr: string;
    function ToDate(const AValue: TDateTime): string;
    function ToDateTime(const AValue: TDateTime): string;
  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure Validate; override;
    procedure ParseResponseText; override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
    function FormatFloatValue(const AValue: Real): string; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    property MerchantID: string read FMerchantID write FMerchantID;
    property TerminalID: string read FTerminalID write FTerminalID;
    property GroupID: string read FGroupID write FGroupID;
    property DatawireID: string read FDatawireID write FDatawireID;
    property STAN: string read FSTAN write FSTAN;
    function Refund: Boolean; override;
    function Void: Boolean; override;

    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;
  end;

  { TEPaymentPayFlowPro }
  TEPaymentPayFlowPro = class sealed(TEPaymentProcessor)
  strict private
    { Private declarations }
    FMerchantLogin: string;
    FMerchantPassword: string;
    FMerchantTransKey: string;
  private
    FMerchantVendor: string;
    FMerchantPartner: string;
    FNonReferencedCreditsAllowed: Boolean;
    function CardTypeStr: string;
    function ToDate(const AValue: TDateTime): string;
    function ToDateTime(const AValue: TDateTime): string;
    procedure AddTextFieldWithLength(const AField, AValue: string;
      const AMaxLength: Integer);
    procedure BuildCommand_ItemDetails;
    function ParsePayFlowProFraudError(AElements: TStringList): string;

  protected
    { Protected declarations }
    procedure GetURL(var AURL: string; var APort: Integer); override;
    procedure BuildCommand(const ATransactionType: TTransactionType); override;
    procedure Validate; override;
    procedure ParseResponseText; override;
    procedure ProcessResponseStatusCode(const AResponse: ShortString;
      var ACode: ShortString; var ADescription: string;
      var AResponseClass: TResponseClass); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    // MerchantLogin ("User")
    property MerchantLogin: string read FMerchantLogin write FMerchantLogin;
    // MerchantPassword ("Password/User Login")
    property MerchantPassword: string read FMerchantPassword
      write FMerchantPassword;
    // MerchantPartner ("Partner")
    property MerchantPartner: string read FMerchantPartner
      write FMerchantPartner;
    // MerchantVendor ("Vendor")
    property MerchantVendor: string read FMerchantVendor
      write FMerchantVendor;
    /// <summary> Non-Referenced credits (refunds) are allowed.  Value
    /// comes from merchant account options. </summary>
    property NonReferencedCreditsAllowed: Boolean read
      FNonReferencedCreditsAllowed write FNonReferencedCreditsAllowed;

    function Refund: Boolean; override;

    property CreditCard;
    property Gateway;
    property GatewayURL;
    property GatewayPort;
    property Level3Options;
    property Response;
    property TestMode;
    property TimeOut;
    property TransactionAmount;
    property TransactionDescription;
    property TransactionID;
    property ProcessingClass;
    property TaxAmount;
    property TaxExempt;
    property FreightAmount;
    property InvoiceNumber;
    property PurchaseOrderNumber;
    property Sender;
    property Destination;

  end;

  // const
  // TSYS - Certified on 2012 version
  // c_tsys_software_version: string[20] = '001602G012'; // '001602|G012';
  // Sterling - Certified on 2012 version
  // c_sterling_vendor_name: string[20] = 'IQMS';
  // c_sterling_software_name: string[20] = 'TBD';
  // c_sterling_software_version: string[10] = '2012';
  // c_sterling_api_version: string[10] = '3.0';

implementation

uses
  AnsiStrings,
  cc_firstdata_utils,
  cc_log,
  cc_payflowpro_utils,
  cc_rscstr,
  cc_share,
  cc_timeout_reversal,
  cc_tsys_utils,
  cc_valid,
  IQMS.Common.GuidUtils,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.SysInfo,
  IQMS.Common.Version,
  IQMS.Common.Mcshare,
  System.StrUtils,
  IQMS.Common.XML,
  xml.XMLDoc,
  xml.XMLIntf,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication;

const
  /// <summary> Do not allow empty values to be added to the command string.
  /// </summary>
  DO_NOT_ALLOW_EMPTY_VALUE = False;
  ALLOW_EMPTY_VALUE = True;
  DO_NOT_ENCODE_FOR_HTML = False;
  ENCODE_FOR_HTML = True;

{$REGION 'TEPaymentCommandString'}
  { TEPaymentCommandString }

constructor TEPaymentCommandString.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListDelimiter := '&';
  FHTMLEncoding := False;
  FAllowEmptyValues := True;
  Clear;
end;

procedure TEPaymentCommandString.Clear;
begin
  FCommand := '';
end;

procedure TEPaymentCommandString.Add(const AValue: string);
begin
  // Append the value
  if FCommand.IsEmpty then
    FCommand := AValue
  else
    FCommand := FCommand + FListDelimiter + AValue;
end;

procedure TEPaymentCommandString.AddFieldA(const AField, AValue: string;
  const AMaxLength: Integer);
begin
  AddFieldB(AField, AValue, AMaxLength, FHTMLEncoding, FAllowEmptyValues);
end;

procedure TEPaymentCommandString.AddFieldB(const AField, AValue: string;
  const AMaxLength: Integer; const AHtmlEncoding: Boolean;
  AAllowEmptyValue: Boolean);
var
  AUseValue: string;
begin
  // If not allowing an empty value and that value is empty,
  // then exit now.
  if not AAllowEmptyValue and AValue.IsEmpty then
    Exit;

  // Assign value we will use (default)
  AUseValue := AValue;
  if AMaxLength > 0 then
    AUseValue := LeftStr(AValue, AMaxLength);

  // If Html encoding is requested, encode for Html
  { TODO : IQMS.Common.StringUtils.HTMLEncode undeclared }
 { if AHtmlEncoding then
    AUseValue := IQMS.Common.StringUtils.HTMLEncode(AUseValue);  }
  Add(Format('%s=%s', [AField, AUseValue]));
end;

{$ENDREGION 'TEPaymentCommandString'}

{$REGION 'TEPaymentLevel3Options'}
{ TEPaymentLevel3Options }

constructor TEPaymentLevel3Options.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TTransactionItemization.Create;
  Reset;
end;

destructor TEPaymentLevel3Options.Destroy;
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
  inherited;
end;

procedure TEPaymentLevel3Options.Reset;
begin
  FLocalTaxAmount := 0;
  FLocalTaxExempt := False;
  FNationalTaxAmount := 0;
  FDutyAmount := 0;
  FDiscountAmount := 0;
  FCustomerTaxID := '';
  FCommodityCode := '';
  FMerchantTaxID := '';
  FItems.Clear;
end;

{$ENDREGION 'TEPaymentLevel3Options'}

{$REGION 'TTransactionItemization'}
{ TTransactionItemization }

constructor TTransactionItemization.Create;
begin
  inherited Create(TTransactionItemizationItem);
end;

function TTransactionItemization.Add: TTransactionItemizationItem;
begin
  Result := AddItem;
end;

function TTransactionItemization.AddItem: TTransactionItemizationItem;
begin
  Result := TTransactionItemizationItem(inherited Add);
end;

function TTransactionItemization.GetItems(index: Integer)
  : TTransactionItemizationItem;
begin
  Result := TTransactionItemizationItem(inherited Items[index]);
end;

function TTransactionItemization.GetModifiedFreight(const AOriginalQuantity,
  ANewQuantity, AOriginalFreight: Real): Real;
var
  AQuantityDifference, AMultiplier: Real;
begin
  AQuantityDifference := AOriginalQuantity - ANewQuantity;
  AMultiplier := 100 - ((AQuantityDifference / AOriginalQuantity) * 100);
  Result := AMultiplier * AOriginalFreight;
end;

procedure TTransactionItemization.SetItems(index: Integer;
  const Value: TTransactionItemizationItem);
begin
  inherited Items[index] := Value;
end;

{ TTransactionItemizationItem }

constructor TTransactionItemizationItem.Create(Collection: TCollection);
begin
  inherited Create(TTransactionItemization(Collection));
end;

function TTransactionItemizationItem.GetItemDescription: string;
begin
  if FItemDescription = '' then
    Result := Format('Miscellaneous Item %d', [index])
  else
    Result := FItemDescription;
end;

function TTransactionItemizationItem.GetItemNumber: string;
begin
  if FItemNumber = '' then
    Result := Format('MISC%d', [index])
  else
    Result := FItemNumber;
end;

procedure TTransactionItemizationItem.SetTax(const Value: Real);
begin
  FTax := Value;
end;

procedure TTransactionItemizationItem.SetTotalAmount(const Value: Real);
begin
  FTotalAmount := Value;
end;

{$ENDREGION 'TTransactionItemization'}

{$REGION 'TEPaymentCompany'}
{ TEPaymentCompany }

constructor TEPaymentCompany.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

procedure TEPaymentCompany.Reset;
begin
  FID := 0;
  FCompanyName := '';
  FAddress1 := '';
  FAddress2 := '';
  FAddress3 := '';
  FCountry := '';
  FCity := '';
  FStateOrRegion := '';
  FPostalCode := '';
end;

function TEPaymentCompany.CountryCode(const AFormat
  : IQMS.Common.Regional.TCountryCodeType): string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(FCountry, AFormat);
end;

function TEPaymentCompany.CountryCode2Char: string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(FCountry, cctChr2);
end;

function TEPaymentCompany.CountryCode3Char: string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(FCountry, cctChr3);
end;

function TEPaymentCompany.CountryCode3Digit: string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(FCountry, cctDigit3);
end;

{$ENDREGION 'TEPaymentCompany'}

{$REGION 'TEPaymentCreditCard'}
{ TEPaymentCreditCard }

constructor TEPaymentCreditCard.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Initialization
  FCardNumber := '';
  FCardType := TCreditCardType(0);
  FExpireMonth := 0;
  FExpireYear := 0;
  FSecurityCode := '';
  FNumericsOnly := [];
end;

procedure TEPaymentCreditCard.Reset;
begin
  FExpireYear := 0;
  FCardNumber := '';
  FExpireMonth := 0;
  FCardType := TCreditCardType(0);
  FSecurityCode := '';
  FCustomerCity := '';
  FCustomerAddress := '';
  FCustomerFirstName := '';
  FCustomerLastName := '';
  FCustomerEmail := '';
  FCustomerFax := '';
  FCustomerPostalCode := '';
  FCustomerState := '';
  FCustomerTelephone := '';
  FCustomerId := '';
  FCustomerCountry := '';
  FCustomerCompany := '';
  FCustomerCountryCode := '';
  FIsToken := False;
  FAddAsNewToken := False;
end;

function TEPaymentCreditCard.CanCheckAVS: Boolean;
begin
  Result := not CustomerAddress.IsNullOrWhiteSpace and
    not CustomerPostalCode.IsNullOrWhiteSpace;
end;

function TEPaymentCreditCard.GetExpirationMMYY: ShortString;
begin
  Result := ShortString(GetExpireMonthStr + GetExpireYearAsStr);
end;

procedure TEPaymentCreditCard.SetExpirationMMYY(const Value: ShortString);
var
  AMonth, AYear, AFullYear: Integer;
  AError: string;
begin
  if cc_share.DecodeExpirationDate(Value, { var } AMonth, AYear, AFullYear,
    AError) then
  begin
    ExpireMonth := AMonth;
    ExpireYear := AFullYear;
  end;
end;

function TEPaymentCreditCard.GetCardTypeDescription: string;
begin
  Result := CardTypeDisplayName[FCardType];
end;

function TEPaymentCreditCard.GetCustomerFax: ShortString;
begin
  if (cnoTelephone in FNumericsOnly) then
    Result := ShortString(IQMS.Common.StringUtils.Numerics(FCustomerFax))
  else
    Result := ShortString(Trim(FCustomerFax));
end;

function TEPaymentCreditCard.GetCustomerFullName: ShortString;
begin
  Result := ShortString(Trim(Trim(CustomerFirstName) + ' ' +
    Trim(CustomerLastName)));
end;

procedure TEPaymentCreditCard.SetCustomerFullName(const Value: ShortString);
var
  AError, AFirstName, ALastName: string;
begin
  if cc_share.DecodeCardHolderName(Value, AFirstName, ALastName, AError) then
  begin
    FCustomerFirstName := ShortString(AFirstName);
    FCustomerLastName := ShortString(ALastName);
  end;
end;

function TEPaymentCreditCard.GetCustomerPostalCode: ShortString;
begin
  if (cnoPostalCode in FNumericsOnly) then
    Result := ShortString(IQMS.Common.StringUtils.Numerics(FCustomerPostalCode))
  else
    Result := ShortString(Trim(FCustomerPostalCode));
end;

function TEPaymentCreditCard.GetCustomerTelephone: ShortString;
begin
  if (cnoTelephone in FNumericsOnly) then
    Result := ShortString(IQMS.Common.StringUtils.Numerics(FCustomerTelephone))
  else
    Result := ShortString(Trim(FCustomerTelephone));
end;

function TEPaymentCreditCard.GetExpireMonthStr: ShortString;
begin
  Result := ShortString(FormatFloat('00', FExpireMonth));
end;

function TEPaymentCreditCard.GetExpireYearAsStr: ShortString;
var
  s: string;
begin
  s := FormatFloat('00', FExpireYear);
  Result := ShortString(System.StrUtils.RightStr(s, 2));
end;

function TEPaymentCreditCard.GetStreetName: string;
var
  ANumber, AStreet: string;
begin
  Self.ParseStreetAddress(FCustomerAddress, { var } ANumber, AStreet);
  Result := AStreet;
end;

function TEPaymentCreditCard.GetStreetNumber: string;
var
  ANumber, AStreet: string;
begin
  Self.ParseStreetAddress(FCustomerAddress, { var } ANumber, AStreet);
  Result := ANumber;
end;

procedure TEPaymentCreditCard.ParseStreetAddress(const AAddress: string;
  var ANumber, AStreet: string);
const
  cNUMBERS = ['0' .. '9'];
var
  APos: Integer;
begin
  APos := Pos(' ', AAddress);
  ANumber := Trim(Copy(AAddress, 1, APos));
  AStreet := Trim(Copy(AAddress, APos, Length(AAddress)));
  if (Length(ANumber) > 0) and not System.SysUtils.CharInSet(ANumber[1],
    cNUMBERS) then
  begin
    ANumber := '';
    AStreet := AAddress;
  end;
end;

function TEPaymentCreditCard.GetExpire4DigitYearAsStr: ShortString;
begin
  Result := '';
  if (FExpireYear < 0) then
    Exit;
  if FExpireYear < 30 then
    Result := ShortString(FormatFloat('2000', FExpireYear))
  else if (FExpireYear > 30) and (FExpireYear < 100) then
    Result := ShortString(FormatFloat('1900', FExpireYear))
  else
    Result := ShortString(FormatFloat('0000', FExpireYear));
end;

procedure TEPaymentCreditCard.SetCardNumber(const Value: ShortString);
begin
  // 08/12/2014 Since adding tokens, we cannot do this.  Some tokens
  // have characters along with numbers.
  // FCardNumber := ShortString(IQMS.Common.StringUtils.Numerics(Value));
  // 04/01/2016 Simply remove spaces.  This will not affect tokens.
  FCardNumber := StringReplace(Value, ' ', '', [rfReplaceAll]);
  //FCardNumber := Value;
  if (Self.FCardType = ccUnknown) then
  begin
    Self.FCardType := PredictCreditCardType(FCardNumber);
  end;
end;

{$ENDREGION 'TEPaymentCreditCard'}

{$REGION 'TEPaymentResponse'}
{ TEPaymentResponse }

constructor TEPaymentResponse.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FReturnValues := TStringList.Create;
  Reset;
end;

destructor TEPaymentResponse.Destroy;
begin
  if Assigned(FReturnValues) then
    FreeAndNil(FReturnValues);
  inherited Destroy;
end;

procedure TEPaymentResponse.Reset;
begin
  FTransactionID := '';
  FResponseData := '';

  FStatusCode := '';
  FStatusDescription := '';
  FStatusClass := TResponseClass(0);

  FTokenStatusCode := '';
  FTokenStatusDescription := '';
  FTokenStatusClass := TTokenResponseClass(0);
  FNewToken := '';

  FSecurityResultCode := '';
  FSecurityResultDescription := '';
  FSecurityResponseClass := TCVVResponseClass(0);
  FIsSecurityCodeApproved := False;
  FSecurityRetry := False;

  FAVSCode := '';
  FAVSDescription := '';
  FAVSResponseClass := TAVSResponseClass(0);
  FIsAVSApproved := False;
  FAVSRetry := False;

  FApprovalCode := '';
  FReturnCode := '';
  FApproved := False;

  FErrorCode := '';
  FErrorDescription := '';
  FErrorText := '';
  ErrorDetails := '';

  FInvoiceNumber := '';
  FProcessorCode := '';
  FTimeStamp := '';
  FReferenceNumber := '';
  FTransactionType := '';

  FReturnValues.Clear;
end;

procedure TEPaymentResponse.SetAVSCode(const Value: ShortString);
begin
  FAVSCode := Value;
  ProcessAVSCode(Value, FAVSDescription, FAVSResponseClass);
  IsAVSApproved := Value.IsEmpty or
    (FAVSResponseClass in [acNone, acSuccess]);
end;

procedure TEPaymentResponse.SetNonStandardAVSResultCode(const AReturnedValue,
  AStandardValue: ShortString);
begin
  SetAVSCode(AStandardValue);
  FAVSCode := AReturnedValue;
end;

procedure TEPaymentResponse.SetNonStandardSecurityResultCode
  (const AReturnedValue, AStandardValue: ShortString);
begin
  SetSecurityResultCode(AStandardValue);
  FSecurityResultCode := AReturnedValue;
end;

procedure TEPaymentResponse.SetSecurityResultCode(const Value: ShortString);
begin
  FSecurityResultCode := Value;
  ProcessSecurityCode(Value, FSecurityResultDescription,
    FSecurityResponseClass);
  IsSecurityCodeApproved := Value.IsEmpty or
    (FSecurityResponseClass in [cvNone, cvSuccess]);
end;

procedure TEPaymentResponse.AddReturnValue(AName, AValue: string);
begin
  FReturnValues.Add(Format('%s=%s', [AName, AValue]));
end;

function TEPaymentResponse.GetRetry: Boolean;
begin
  Result := FAVSRetry and FSecurityRetry and not Approved;
end;

function TEPaymentResponse.GetReturnValue(AName: string): string;
begin
  Result := FReturnValues.Values[AName];
end;

procedure TEPaymentResponse.GetSummary(var ALines: TStringList);
var
  AText: string;
  ATransactionType: TTransactionType;
begin
  if Assigned(ALines) then
  begin
    ALines.Clear;

    ATransactionType := TEPaymentProcessor(Owner).GetLastTransactionType;

    // cc_rscstr.cTXT0000224 = 'Status'
    ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000224,
      ResponseClassDescription[StatusClass]]));

    if not (ATransactionType in [ttAVSOnly]) then
    begin
      // Gateway Response Status
      AText := StatusDescription;
      if not String.IsNullOrWhiteSpace(AText) then
        // cc_rscstr.cTXT0000463 = 'Response Text';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000463, AText]));

      // cc_rscstr.cTXT0000482 = 'Approval';
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000482, ApprovalCode]));

      // cc_rscstr.cTXT0000227 = 'Response Code'
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000227, ReturnCode]));

      // cc_rscstr.cTXT0000483 = 'Transaction Type';
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000483,
        TransactionType]));

      // cc_rscstr.cTXT0000484 = 'Amount';
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000484,
        IQMS.Common.Numbers.FloatToAnsiStr(TEPaymentProcessor(Owner)
        .TransactionAmount, 0, 2)]));

      // Note:  ISO Code is only used by Moneris Canada, but is required by
      // them to be displayed in order to be certified.
      AText := GetReturnValue('iso_code');
      if AText > '' then
        // cc_rscstr.cTXT0000485 = 'ISO Code';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000485, AText]));

      if TimeStamp > '' then
        // cc_rscstr.cTXT0000486 = 'Time Stamp';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000486, TimeStamp]));

      // Error
      if not Approved and not ErrorText.IsEmpty then
      begin
        // cc_rscstr.cTXT0000443 = 'Error';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000443, ErrorText]));
        // cc_rscstr.cTXT0000511 = 'Error Details';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000511,
          ErrorDetails]));
      end;

      if AVSResultDescription > '' then
        // cc_rscstr.cTXT0000228 = 'AVS Response'
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000228,
          AVSResultDescription]));

      if SecurityResultDescription > '' then
        // cc_rscstr.cTXT0000230 = 'CVV Response'
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000230,
          SecurityResultDescription]));

      // Note:  Moneris USA wants something special here.  Instead of the
      // "Transaction ID", we need to use the caption "Reference #".  It
      // is required to be displayed in order to be certified.
      if (TEPaymentProcessor(Owner).Gateway = cgwMonerisUSA) then
        // cc_rscstr.cTXT0000481 = 'Reference #';
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000481,
          ReferenceNumber]))
      else
      begin
        // cc_rscstr.cTXT0000233 = 'Transaction ID'
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000233,
          TEPaymentProcessor(Owner).TransactionID]));
        if ReferenceNumber > '' then
          // cc_rscstr.cTXT0000481 = 'Reference #';
          ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000481,
            ReferenceNumber]));
      end;

      // cc_rscstr.cTXT0000470= 'Response Transaction ID'
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000470, TransactionID]));

      AText := TEPaymentProcessor(Owner).InvoiceNumber;
      if AText > '' then
        // cc_rscstr.cTXT0000472 = 'Invoice #'
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000472, AText]));

      if not InvoiceNumber.IsEmpty then
        // cc_rscstr.cTXT0000471 = 'Response Invoice #'
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000471,
          InvoiceNumber]));

      // Note:  Card Holder Name is required by Moneris to be displayed, so that
      // it can be sent back to the customer.  This value is not encrypted.
      // cc_rscstr.cTXT0000487 = 'Card Holder';
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000487,
        TEPaymentProcessor(Owner).CreditCard.CustomerFullName]));

      // Note:  Merchant and Merchant Web Site are required to be displayed
      // by Moneris for certification.
      // cc_rscstr.cTXT0000488 = 'Merchant';
      AText := TEPaymentProcessor(Owner).MerchantName;
      if AText > '' then
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000488, AText]));

      // cc_rscstr.cTXT0000489 = 'Merchant Web Site';
      AText := TEPaymentProcessor(Owner).MerchantWebSite;
      if AText > '' then
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000489, AText]));
    end
    else
    begin
      // cc_rscstr.cTXT0000224 = 'Status'
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000224,
        ResponseClassDescription[StatusClass]]));

      // Gateway Response Status
      // cc_rscstr.cTXT0000228 = 'AVS Response'
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000228,
        AVSResultDescription]));

      // cc_rscstr.cTXT0000443 = 'Error';
      if not ErrorText.IsEmpty then
      begin
        ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000443, ErrorText]));
        if not ErrorDetails.IsEmpty then
          // cc_rscstr.cTXT0000511 = 'Error Details';
          ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000511,
            ErrorDetails]));
      end;

      // cc_rscstr.cTXT0000230 = 'CVV Response'
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000230,
        SecurityResultDescription]));

      // cc_rscstr.cTXT0000482 = 'Approval';
      ALines.Add(Format('%s: %s', [cc_rscstr.cTXT0000482,
        cc_types.AVSResponseClass[FAVSResponseClass]]));
    end;
  end;
end;

procedure TEPaymentResponse.GetSummaryDetails(
  const ATransactionType: TTransactionType; var AText: string);
var
  ADetails: TStringList;
  ADetailsStr: string;
begin
  // Get summary for the log
  ADetails := TStringList.Create;
  try
    GetSummary(ADetails);
    ADetailsStr := IQMS.Common.StringUtils.StringListToStr(ADetails, '; ');
    case ATransactionType of
      ttSale:
        ADetailsStr := 'SALE; ' + ADetailsStr;
      ttAuthOnly:
        ADetailsStr := 'AUTHORIZATION; ' + ADetailsStr;
      ttCapture:
        ADetailsStr := 'SETTLEMENT/CAPTURE/COMPLETION; ' + ADetailsStr;
      ttCredit:
        ADetailsStr := 'CREDIT/REFUND; ' + ADetailsStr;
      ttVoid:
        ADetailsStr := 'VOID; ' + ADetailsStr;
      ttForce:
        ADetailsStr := 'FORCE AUTHORIZATION; ' + ADetailsStr;
      ttAVSOnly:
        ADetailsStr := 'VERIFICATION; ' + ADetailsStr;
    end;
    AText := ADetailsStr;
  finally
    FreeAndNil(ADetails);
  end;
end;

procedure TEPaymentResponse.ProcessAVSCode(const ACode: ShortString;
  var ADescription: string; var AResponseClass: TAVSResponseClass);
var
  C: AnsiChar;
begin
  // Initialize
  C := #0;
  FAVSRetry := False;
  if ACode > '' then
    C := ACode[1];
  if System.SysUtils.CharInSet(C, ['A', 'E', 'N', 'U', 'W', 'Z', 'B', 'C', 'I',
    'P'])
  then
    AResponseClass := acWarning
  else if System.SysUtils.CharInSet(C, ['R', 'S']) then
    AResponseClass := acError
  else if System.SysUtils.CharInSet(C, ['X', 'Y', 'D', 'M']) then
    AResponseClass := acSuccess
  else
    AResponseClass := acNone;
  if C = 'A' then
    // 'AVS Warning: Customer address matches, but the postal code does not.'
    ADescription := cc_rscstr.cTXT0000070
  else if C = 'E' then
    // 'The Address Verification System (AVS) has issued an unknown error.'
    ADescription := cc_rscstr.cTXT0000071
  else if C = 'G' then
    // 'Address Verification Unavailable: Non-US Issuer does not participate.'
    ADescription := cc_rscstr.cTXT0000352
  else if C = 'N' then
    // 'AVS Warning: No match for customer address or postal code.'
    ADescription := cc_rscstr.cTXT0000072
  else if C = 'P' then
    // 'AVS is not applicable to this transaction.'
    ADescription := cc_rscstr.cTXT0000073
  else if C = 'R' then
  begin
    // 'Please retry. The issuer system was unavailable.'
    ADescription := cc_rscstr.cTXT0000074;
    FAVSRetry := True;
  end
  else if C = 'S' then
    // 'Address Verification Service is not supported by the issuer.'
    ADescription := cc_rscstr.cTXT0000075
  else if C = 'U' then
    // 'AVS Warning: Address information is unavailable.'
    ADescription := cc_rscstr.cTXT0000076
  else if C = 'W' then
    // 'AVS Warning: Nine-digit postal code matches, but the address does not.'
    ADescription := cc_rscstr.cTXT0000077
  else if C = 'X' then
    // 'Success!  Exact AVS match on the nine-digit postal code.'
    ADescription := cc_rscstr.cTXT0000078
  else if C = 'Y' then
    // 'Success!  Exact AVS match on the five-digit postal code.'
    ADescription := cc_rscstr.cTXT0000079
  else if C = 'Z' then
    // 'Five-digit postal code matches, but the address does not.'
    ADescription := cc_rscstr.cTXT0000080
  else if C = 'B' then
    // 'Although the street address was matched for this international
    // transaction, the postal code could not be verified because of
    // incompatible formats.'
    ADescription := cc_rscstr.cTXT0000081
  else if C = 'C' then
    // 'The street address and postal code could not be verified for this
    // international transaction because of incompatible formats.'
    ADescription := cc_rscstr.cTXT0000082
  else if C = 'D' then
    // 'Success!  Street addresses and postal codes match for this
    // international transaction.'
    ADescription := cc_rscstr.cTXT0000083
  else if C = 'I' then
    // 'The address information not be verified for this international
    // transaction.'
    ADescription := cc_rscstr.cTXT0000084
  else if C = 'M' then
    // 'Success! The street address and postal code match for this
    // international transaction.'
    ADescription := cc_rscstr.cTXT0000085
  else if C = 'P' then
    // 'Although the postal codes match for this international transaction,
    // the street address could not be verified because of incompatible formats.';
    ADescription := cc_rscstr.cTXT0000086
  else if C = '0' then
    // 'No address verification has been requested.'
    ADescription := cc_rscstr.cTXT0000219;
end;

procedure TEPaymentResponse.ProcessSecurityCode(const ACode: ShortString;
  var ADescription: string; var AResponseClass: TCVVResponseClass);
var
  C: AnsiChar;
begin
  // Initialize
  C := #0;

  if ACode > '' then
    C := ACode[1];
  // (acNone, acSuccess, acWarning)
  if System.SysUtils.CharInSet(C, ['N', 'S', 'U']) then
    AResponseClass := cvWarning
  else if C = 'M' then
    AResponseClass := cvSuccess
  else
    AResponseClass := cvNone;

  // Allow retry if it failed
  FSecurityRetry := AResponseClass <> cvSuccess;

  if C = 'M' then
    // 'Success!  CVV2 match.'
    ADescription := cc_rscstr.cTXT0000087
  else if C = 'N' then
    // 'Failed!  CVV2 no match.'
    ADescription := cc_rscstr.cTXT0000088
  else if C = 'P' then
    // 'Not processed.'
    ADescription := cc_rscstr.cTXT0000089
  else if C = 'S' then
    // 'Warning!  Merchant has indicated that CVV2 is not present on this card.'
    ADescription := cc_rscstr.cTXT0000090
  else if C = 'U' then
    // 'Warning!  Issuer not certified and/or has not provided Visa encryption keys.';
    ADescription := cc_rscstr.cTXT0000091
    // 06/12/2008 Final check is based on field length
  else
    ADescription := '';
end;

{$ENDREGION 'TEPaymentResponse'}

{$REGION 'TEPaymentFirewall'}
{ TEPaymentFirewall }

constructor TEPaymentFirewall.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

procedure TEPaymentFirewall.Reset;
begin
  FDetect := False;
  FPort := 0;
  FPassword := '';
  FFirewallType := TFirewallType(0);
  FHost := '';
  FUser := '';
end;

{$ENDREGION 'TEPaymentFirewall'}

{$REGION 'TEPaymentReversalData'}
{ TEPaymentReversalData }

constructor TEPaymentReversalData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FParams := TStringList.Create;
  Reset;
end;

destructor TEPaymentReversalData.Destroy;
begin
  if Assigned(FParams) then
    FreeAndNil(FParams);
  inherited Destroy;
end;

procedure TEPaymentReversalData.Reset;
begin
  FOriginalTransactionType := TTransactionType(0);
  FRequestedAmount := 0;
  FOriginalAmount := 0;
  FOriginalTransDate := Now;
  FOriginalApprovalCode := '';
  FReferenceNumber := '';
  FIsPreSettlement := False;
end;

procedure TEPaymentReversalData.SetOriginalTransactionType
  (const Value: TTransactionType);
begin
  if not (Value in ReversalTransactionTypes) then
    raise Exception.Create
      ('Application Error:  Invalid transaction type for reversal.  ' +
      'Only Sale and Authorization are permitted.');
  FOriginalTransactionType := Value;
end;

function TEPaymentReversalData.GetIsPartial: Boolean;
var
  ACardType: TCreditCardType;
begin
  ACardType := TCreditCardType(0);
  if Assigned(Owner) and (Owner is TEPaymentProcessor) then
    ACardType := TEPaymentProcessor(Owner).CreditCard.CardType;
  Result := (FOriginalAmount > FRequestedAmount) and (ACardType = ccVisa);
end;

{$ENDREGION 'TEPaymentReversalData'}

{$REGION 'TEPaymentSettlementData'}

{ TEPaymentSettlementData }

constructor TEPaymentSettlementData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

procedure TEPaymentSettlementData.Reset;
begin
  FRequestedAmount := 0;
  FOriginalAmount := 0;
  FOriginalTransDate := Now;
end;

{$ENDREGION 'TEPaymentSettlementData'}

{$REGION 'TEPaymentAddendum'}
{ TEPaymentAddendum }

constructor TEPaymentAddendum.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FItems := TStringList.Create;
end;

destructor TEPaymentAddendum.Destroy;
begin
  if Assigned(FItems) then
    FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TEPaymentAddendum.Reset;
begin
  FItems.Clear;
end;

procedure TEPaymentAddendum.Add(const ACode, AValue: string);
begin
  FItems.Add(Format('%s=%s', [ACode, AValue]));
end;

{$ENDREGION 'TEPaymentAddendum'}

{$REGION 'TEPaymentTimeOutReversalStatus'}

{ TEPaymentTimeOutReversalStatus }

constructor TEPaymentTimeOutReversalStatus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

procedure TEPaymentTimeOutReversalStatus.Reset;
begin
  FRequired := False;
  FResolved := False;
  FAttempt := 0;
  FProcessing := False;
end;

procedure TEPaymentTimeOutReversalStatus.IncAttempt;
begin
  Inc(FAttempt);
end;

procedure TEPaymentTimeOutReversalStatus.SetRequired(const Value: Boolean);
begin
  if Value and not FRequired then
    FResolved := False;
  FRequired := Value;
end;

{$ENDREGION 'TEPaymentTimeOutReversalStatus'}

{$REGION 'TEPaymentProcessor'}
{ TEPaymentProcessor }

constructor TEPaymentProcessor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEPaymentCreditCard := TEPaymentCreditCard.Create(Self);
  FLevel3Options := TEPaymentLevel3Options.Create(Self);
  FResponse := TEPaymentResponse.Create(Self);
  FFirewall := TEPaymentFirewall.Create(Self);
  FSenderCompany := TEPaymentCompany.Create(Self);
  FDestinationCompany := TEPaymentCompany.Create(Self);
  FCommand := TEPaymentCommandString.Create(Self);
  FReversalData := TEPaymentReversalData.Create(Self);
  FSettlementData := TEPaymentSettlementData.Create(Self);
  FEPaymentAddendum := TEPaymentAddendum.Create(Self);
  FEPaymentTimeOutReversalStatus := TEPaymentTimeOutReversalStatus.Create(Self);
  FHttpUserAgent := 'EnterpriseIQ-' + StringReplace(IQMS.Common.Version.C_Version,
    '.', '_', [rfReplaceAll, rfIgnoreCase]);
  Reset;
  FTransactionMethod := tmTelephone; // default
  HttpContentType := ctHTMLForm;
  TimeOut := DEFAULT_TIME_OUT;
  FCountryCodeFormat := cctDigit3;
  GetURL(FGatewayURL, FGatewayPort);
  FTransactionDate := Now;
  // FTimeOutReversalRequired := False;
  // FTimeOutReversal := False;
end;

destructor TEPaymentProcessor.Destroy;
begin
  if Assigned(FEPaymentCreditCard) then
    FreeAndNil(FEPaymentCreditCard);
  if Assigned(FLevel3Options) then
    FreeAndNil(FLevel3Options);
  if Assigned(FResponse) then
    FreeAndNil(FResponse);
  if Assigned(FFirewall) then
    FreeAndNil(FFirewall);
  if Assigned(FSenderCompany) then
    FreeAndNil(FSenderCompany);
  if Assigned(FDestinationCompany) then
    FreeAndNil(FDestinationCompany);
  if Assigned(FCommand) then
    FreeAndNil(FCommand);
  if Assigned(FReversalData) then
    FreeAndNil(FReversalData);
  if Assigned(FSettlementData) then
    FreeAndNil(FSettlementData);
  if Assigned(FEPaymentAddendum) then
    FreeAndNil(FEPaymentAddendum);
  if Assigned(FEPaymentTimeOutReversalStatus) then
    FreeAndNil(FEPaymentTimeOutReversalStatus);
  inherited Destroy;
end;

procedure TEPaymentProcessor.Reset;
begin
  FTransactionID := '';
  FTransactionAmount := 0;
  FTransactionDesc := '';
  FInvoiceNumber := '';
  FPONumber := '';
  FTaxAmount := 0;
  FFreightAmount := 0;
  FDiscountAmount := 0;
  FSalesOrderNumber := '';
  FTaxExempt := False;
  FSalesOrderDate := Now;
  FTransactionMethod := tmTelephone;
  FTransactionCurrencyCode := '';
  FTransactionCurrencyCode3Digit := '';
  FTransactionDate := Now;
  FSalesOrderID := 0;

  FEPaymentCreditCard.Reset;
  FResponse.Reset;
  FLevel3Options.Reset;
  FFirewall.Reset;
  FDestinationCompany.Reset;
  FSenderCompany.Reset;
  FReversalData.Reset;
  FSettlementData.Reset;
  OriginalResponse.Reset;
  CreditCard.Reset;
  FEPaymentTimeOutReversalStatus.Reset;
end;

function TEPaymentProcessor.ExecuteCommand(const ACommand: string;
  const ASimulation: Boolean): Boolean;
var
  AResponseOut: WideString;
  ADetails: TStringList;
  ADetailsStr: string;
  ALogSource: TLogSource;
  AArcustoID: Real;
begin
  // Initialization
  Result := False;
  Response.Reset;
  FLastRequest := ACommand;
  FLastResponse := '';
  // Validation
  if GatewayURL.IsEmpty or ACommand.IsEmpty then
    Exit;
  if (TimeOut = 0) then
    TimeOut := DEFAULT_TIME_OUT;
  if Firewall.Detect then
    // Execute the Http request
    with TWebService.Create(Self) do
      Result := ExecuteThroughFirewall(GatewayURL, GatewayPort, TimeOut * 1000,
        Ord(HttpContentType), FHttpUserAgent, Firewall.Host, Firewall.Port,
        Firewall.Domain, Firewall.User, Firewall.Password, ACommand,
        { out } AResponseOut)
  else
    // Execute the Http request
    with TWebService.Create(Self) do
      Result := Execute(GatewayURL, GatewayPort, TimeOut * 1000,
        Ord(HttpContentType), FHttpUserAgent, ACommand,
        { out } AResponseOut);
  FLastResponse := AResponseOut;
  AResponseOut := ''; // deallocate WideString
  // send back response (WideString) as string (UnicodeString)
  Response.ResponseData := FLastResponse;
  // Initialize to true, in case this has not been done by the descendent.
  // If there is an unhandled communication error, then we want to allow
  // a retry.
  FRetry := True;
  // Call descendent (abstract) method to parse the response
  ParseResponseText;

  // Get summary for the log
  Response.GetSummaryDetails(FTransactionType, { var } ADetailsStr);

  // Get additional information for writing to the log
  AArcustoID := IQMS.Common.Numbers.StoF(CreditCard.CustomerId);
  if FTransactionType = ttCapture then
    ALogSource := lsSettlement
  else if FTransactionType = ttForce then
    ALogSource := lsManualSettlement
  else
    ALogSource := lsAuthorization;

  if not ASimulation then
  begin
    // Write data to the log
    cc_log.WriteToLog(CreditCardAccountID, ALogSource, ltTransaction,
      ADetailsStr, Self.LastRequest, Self.LastResponse, AArcustoID);
  end;

  if not Result and not FLastResponse.IsEmpty then
    IQMS.Common.Dialogs.IQError(FLastResponse)
  else if not Result and not Response.ErrorText.IsEmpty then
    IQMS.Common.Dialogs.IQError(Response.ErrorText);
end;

function TEPaymentProcessor.Authorize: Boolean;
begin
  FTransactionType := ttAuthOnly;
  Validate;
  BuildCommand(ttAuthOnly);
  Result := ExecuteCommand(FCommand.Command);
  if Response.TransactionType = '' then
    Response.TransactionType := TransactionTypeStr[ttAuthOnly];
  CheckSendTimeOutReversal;
end;

function TEPaymentProcessor.AVSCheck: Boolean;
begin
  FTransactionType := ttAVSOnly;
  Validate;
  // cc_rscstr.cTXT0000771 = 'Customer postal code is required.';
  IQAssert(not CreditCard.CustomerPostalCode.IsEmpty,
    cc_rscstr.cTXT0000771);
  BuildCommand(ttAVSOnly);

  // 02/18/2016 (EIQ-10854) If the command string is empty, do not
  // attempt to execute it or an error will occur.  Some gateways
  // do not perform AVS checks, which is why the string could be
  // empty.  If execution gets to this point, the basic validation
  // has already passed anyway.
  if FCommand.Command = '' then
    Result := True
  else
    Result := ExecuteCommand(FCommand.Command) and Response.Approved;
end;

procedure TEPaymentProcessor.BuildCommand(const ATransactionType
  : TTransactionType);
begin
  FTransactionType := ATransactionType;
  // provided by descendent
end;

function TEPaymentProcessor.Capture: Boolean;
begin
  FTransactionType := ttCapture;
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttCapture);
  Result := ExecuteCommand(FCommand.Command);
  CheckSendTimeOutReversal;
end;

function TEPaymentProcessor.Refund: Boolean;
begin
  // provided by descendent
  FTransactionType := ttCredit;

  // Populate the "Refund/Credit Data" record
  if FReversalData.RequestedAmount = 0 then
    raise Exception.Create
      ('Application Error:  Refund amount is zero.  Cannot proceed.');
  if FReversalData.OriginalAmount = 0 then
    raise Exception.Create
      ('Application Error:  Original transaction amount is zero.  ' +
      'There is nothing to refund.  Cannot proceed.');

  TransactionAmount := ReversalData.RequestedAmount;
  Validate;
  BuildCommand(ttCredit);
  Result := ExecuteCommand(FCommand.Command);

  CheckSendTimeOutReversal;
end;

function TEPaymentProcessor.FixText(const AValue: string): string;
const
  cUpper = ['A' .. 'Z'];
  cLower = ['a' .. 'z'];
  cNumber = ['0' .. '9'];
  cOther = [' ', '-', ',', '!', '@', '#', '$', '%', '^', '*', '’', '?', '.',
    '_', '/'];
  cValidChar = cUpper + cLower + cNumber + cOther;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AValue) do
    if CharInSet(AValue[i], cValidChar) then
      Result := Result + AValue[i];
end;

function TEPaymentProcessor.Force(AVoiceAuthCode: string): Boolean;
begin
  FTransactionType := ttForce;
  FForceVoiceAuthCode := AVoiceAuthCode;
  // cc_rscstr.cTXT0000772 = 'A voice authorization code is required.';
  IQAssert(not AVoiceAuthCode.IsEmpty, cc_rscstr.cTXT0000772);
  BuildCommand(ttForce);
  Result := ExecuteCommand(FCommand.Command);
  CheckSendTimeOutReversal;
end;

function TEPaymentProcessor.FormatFloatValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  Result := FormatFloat('#,##00.00', AValue, AFormatSettings);
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentProcessor.GetDestinationCountryCode: string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(Destination.Country, FCountryCodeFormat);
end;

function TEPaymentProcessor.GetLastTransactionType: TTransactionType;
begin
  Result := FTransactionType;
end;

function TEPaymentProcessor.GetSenderCountryCode: string;
begin
  Result := IQMS.Common.Regional.CountryCodeFor(Sender.Country, FCountryCodeFormat);
end;

procedure TEPaymentProcessor.GetResponseStatusVisa(const AResponseCode: string;
  var AResponseClass: TResponseClass);
var
  ALCode: string;
  procedure _Eval(ACode: string; AClass: TResponseClass);
  begin
    if CompareText(ALCode, ACode) = 0 then
      AResponseClass := AClass;
  end;

begin
  ALCode := System.StrUtils.RightStr('000' + AResponseCode, 3);
  { TResponseClass = (rcNone, rcSuccess, rcFailure, rcError, rcWarning,
    rcSecurity) }
  _Eval('000', rcSuccess);
  _Eval('001', rcFailure);
  _Eval('002', rcFailure);
  _Eval('003', rcError);
  _Eval('004', rcSecurity);
  _Eval('005', rcFailure);
  _Eval('006', rcError);
  _Eval('007', rcFailure);
  _Eval('010', rcWarning);
  _Eval('011', rcSuccess);
  _Eval('012', rcFailure);
  _Eval('013', rcFailure);
  _Eval('014', rcFailure);
  _Eval('015', rcFailure);
  _Eval('019', rcError);
  _Eval('021', rcFailure);
  _Eval('025', rcFailure);
  _Eval('028', rcError);
  _Eval('039', rcError);
  _Eval('041', rcSecurity);
  _Eval('043', rcSecurity);
  _Eval('051', rcFailure);
  _Eval('052', rcFailure);
  _Eval('053', rcFailure);
  _Eval('054', rcFailure);
  _Eval('055', rcFailure);
  _Eval('057', rcFailure);
  _Eval('058', rcFailure);
  _Eval('059', rcSecurity);
  _Eval('061', rcFailure);
  _Eval('062', rcFailure);
  _Eval('063', rcSecurity);
  _Eval('064', rcFailure);
  _Eval('065', rcFailure);
  _Eval('075', rcFailure);
  _Eval('076', rcError);
  _Eval('077', rcError);
  _Eval('078', rcFailure);
  _Eval('079', rcError);
  _Eval('080', rcFailure);
  _Eval('081', rcError);
  _Eval('082', rcError);
  _Eval('085', rcSuccess);
  _Eval('086', rcFailure);
  _Eval('089', rcFailure);
  _Eval('091', rcFailure);
  _Eval('092', rcFailure);
  _Eval('093', rcSecurity);
  _Eval('094', rcFailure);
  _Eval('096', rcError);
  _Eval('0B1', rcFailure);
  _Eval('0B2', rcFailure);
  _Eval('0N0', rcFailure);
  _Eval('0N3', rcError);
  _Eval('0N4', rcFailure);
  _Eval('0N5', rcError);
  _Eval('0N7', rcFailure);
  _Eval('0P2', rcFailure);
  _Eval('0P5', rcFailure);
  _Eval('0P6', rcFailure);
  _Eval('0R0', rcFailure);
  _Eval('0R1', rcFailure);
  _Eval('0R3', rcFailure);
  _Eval('0Q1', rcFailure);
  _Eval('0Z3', rcError);
  _Eval('0XA', rcFailure);
  _Eval('0XD', rcFailure);
end;

function TEPaymentProcessor.GetRetry: Boolean;
begin
  Result := FRetry and Response.Retry;
end;

procedure TEPaymentProcessor.GetResponseStatusMasterCard(const AResponseCode
  : string; var AResponseClass: TResponseClass);
var
  ALCode: string;
  procedure _Eval(ACode: string; AClass: TResponseClass);
  begin
    if CompareText(ALCode, ACode) = 0 then
      AResponseClass := AClass;
  end;

begin
  ALCode := System.StrUtils.RightStr('000' + AResponseCode, 3);
  _Eval('000', rcSuccess);
  _Eval('001', rcFailure);
  _Eval('003', rcFailure);
  _Eval('004', rcFailure);
  _Eval('005', rcFailure);
  _Eval('008', rcFailure);
  _Eval('010', rcWarning);
  _Eval('012', rcFailure);
  _Eval('013', rcFailure);
  _Eval('014', rcFailure);
  _Eval('015', rcFailure);
  _Eval('030', rcError);
  _Eval('041', rcSecurity);
  _Eval('043', rcSecurity);
  _Eval('051', rcFailure);
  _Eval('054', rcFailure);
  _Eval('055', rcFailure);
  _Eval('057', rcFailure);
  _Eval('058', rcFailure);
  _Eval('061', rcFailure);
  _Eval('062', rcFailure);
  _Eval('063', rcSecurity);
  _Eval('065', rcFailure);
  _Eval('070', rcFailure);
  _Eval('071', rcFailure);
  _Eval('075', rcFailure);
  _Eval('076', rcError);
  _Eval('077', rcError);
  _Eval('078', rcError);
  _Eval('084', rcFailure);
  _Eval('085', rcSuccess);
  _Eval('086', rcFailure);
  _Eval('087', rcFailure);
  _Eval('088', rcFailure);
  _Eval('089', rcFailure);
  _Eval('091', rcError);
  _Eval('092', rcError);
  _Eval('094', rcError);
  _Eval('096', rcError);
end;

function TEPaymentProcessor.LastRequest: string;
var
  AReplace: string;
begin
  // Last request
  Result := FLastRequest;
  // We are required by PA-DSS regulations to mask the cvv2 and account
  // number even in the logged request/response text.
  // Mask the security code
  if Length(CreditCard.SecurityCode) > 0 then
  begin
    AReplace := Repl('*', Length(CreditCard.SecurityCode));
    Result := IQMS.Common.StringUtils.StrTranStrict(Result, CreditCard.SecurityCode,
      AReplace);
  end;
  // Mask the card number
  if Length(CreditCard.CardNumber) > 0 then
  begin
    AReplace := cc_share.GetMaskedAccount(CreditCard.CardNumber);
    Result := IQMS.Common.StringUtils.StrTranStrict(Result, CreditCard.CardNumber, AReplace);
  end;
end;

function TEPaymentProcessor.LastResponse: string;
var
  AReplace: string;
begin
  Result := FLastResponse; // Response.ResponseData;
  // We are required by PA-DSS regulations to mask the cvv2 and account
  // number even in the logged request/response text.
  // Mask the security code
  if Length(CreditCard.SecurityCode) > 0 then
  begin
    AReplace := Repl('*', Length(CreditCard.SecurityCode));
    Result := IQMS.Common.StringUtils.StrTranStrict(Result, CreditCard.SecurityCode,
      AReplace);
  end;
  // Mask the card number
  if Length(CreditCard.CardNumber) > 0 then
  begin
    AReplace := cc_share.GetMaskedAccount(CreditCard.CardNumber);
    Result := IQMS.Common.StringUtils.StrTranStrict(Result, CreditCard.CardNumber, AReplace);
  end;
end;

function TEPaymentProcessor.MerchantName: string;
begin
  Result := SelectValueFmtAsString(
    'SELECT merchant_name ' +
    'FROM credit_card_account ' +
    'WHERE id = %d',
    [FCreditCardAccountID]);
end;

function TEPaymentProcessor.MerchantWebSite: string;
begin
  Result := SelectValueAsString(
    'SELECT internet FROM iqsys WHERE ROWNUM < 2');
end;

function TEPaymentProcessor.CanProcessLevel3: Boolean;
begin
  Result := (ProcessingClass = pclLevel3) and
    (CreditCard.CardType in Level3CardTypes);
end;

function TEPaymentProcessor.CanSendCardData(const ATransactionType
  : TTransactionType): Boolean;
begin
  Result := (ATransactionType in [ttSale, ttAuthOnly, ttForce, ttAVSOnly]);
end;

function TEPaymentProcessor.Sale: Boolean;
begin
  FTransactionType := ttSale;
  Validate;
  BuildCommand(ttSale);
  Result := ExecuteCommand(FCommand.Command);
  if Response.TransactionType = '' then
    Response.TransactionType := TransactionTypeStr[ttSale];
  CheckSendTimeOutReversal;
end;

procedure TEPaymentProcessor.SetTestMode(const Value: Boolean);
begin
  FTestMode := Value;
  GetURL(FGatewayURL, FGatewayPort);
end;

function TEPaymentProcessor.SendTimeOutReversal: Boolean;
begin
  TimeOutReversalStatus.Processing := True;
  try
    Validate;
    BuildCommand(FTransactionType);
    Result := ExecuteCommand(FCommand.Command);
    if Response.TransactionType = '' then
      Response.TransactionType := TransactionTypeStr[FTransactionType];
  finally
    TimeOutReversalStatus.IncAttempt;
  end;
end;

function TEPaymentProcessor.AddToken(var ANewToken: string): Boolean;
begin
  FTransactionType := ttAddToken;
  Validate;
  BuildCommand(ttAddToken);
  Result := ExecuteCommand(FCommand.Command);
  if Result then
    ANewToken := Response.NewToken;
  if Response.TransactionType = '' then
    Response.TransactionType := TransactionTypeStr[ttAddToken];
end;

function TEPaymentProcessor.DeleteToken: Boolean;
begin
  FTransactionType := ttDeleteToken;
  Validate;
  BuildCommand(ttDeleteToken);
  Result := ExecuteCommand(FCommand.Command);
  if Response.TransactionType = '' then
    Response.TransactionType := TransactionTypeStr[ttDeleteToken];
end;

function TEPaymentProcessor.QueryToken: Boolean;
begin
  FTransactionType := ttQueryToken;
  Validate;
  BuildCommand(ttQueryToken);
  Result := ExecuteCommand(FCommand.Command);
  if Response.TransactionType = '' then
    Response.TransactionType := TransactionTypeStr[ttQueryToken];
end;

procedure TEPaymentProcessor.AddFieldA(const AField, AValue: string;
  const AMaxLength: Integer);
begin
  FCommand.AddFieldA(AField, FixText(AValue), AMaxLength);
end;

procedure TEPaymentProcessor.AddFieldB(const AField, AValue: string;
  const AMaxLength: Integer; const AHtmlEncoding: Boolean;
  AAllowEmptyValue: Boolean);
begin
  FCommand.AddFieldB(AField, FixText(AValue), AMaxLength, AHtmlEncoding,
    AAllowEmptyValue);
end;

procedure TEPaymentProcessor.AssignDestinationCountry
  (const ACountryName: string);
begin
  if ACountryName.IsEmpty then
    Exit;
  Destination.Country := IQMS.Common.Regional.GetValidCountryName(ACountryName);
end;

function TEPaymentProcessor.AuthenticateCard: Boolean;
var
  ACardType: TCreditCardType;
  AErroMsg: string;
begin
  ACardType := cc_valid.PredictCreditCardType(CreditCard.CardNumber);
  Result := cc_valid.ValidateCreditCardB(CreditCard.CardNumber,
    CreditCard.ExpirationMMYY, ACardType, CreditCard.IsToken, AErroMsg, True);

  // Update the status class, code and description.  See below.
  UpdateStatusForSimpleVerificationCheck(Result, AErroMsg);

  // provided by descendent
  Result := Result and AVSCheck;
end;

procedure TEPaymentProcessor.UpdateStatusForSimpleVerificationCheck(
  const APassed: Boolean; const AErrorMsg: string);
begin
  if APassed then
  begin
    Response.StatusClass := rcSuccess;
    Response.StatusCode := 'APPROVED';
    // cc_rscstr.cTXT0000696 = 'Passed simple validation checks.';
    Response.StatusDescription := cc_rscstr.cTXT0000696;
    Response.ApprovalCode := 'APPROVED';
  end
  else
  begin
    Response.StatusClass := rcFailure;
    Response.StatusCode := 'DECLINED';
    Response.StatusDescription := AErrorMsg;
    Response.ApprovalCode := 'DECLINED';
  end;
end;

procedure TEPaymentProcessor.ValidateSetting(const ASettingValue,
  ASettingName: string);
begin
  // cc_rscstr.cTXT0000441 = 'Required setting must be supplied:';
  IQMS.Common.Miscellaneous.IQAssert(not ASettingValue.IsEmpty, cc_rscstr.cTXT0000441 +
    '  ' + ASettingName);
end;

procedure TEPaymentProcessor.Validate;
begin
  if GatewayURL.IsEmpty then
    { cc_rscstr.cTXT0000440 =
      'Application Error:  Gateway server not specified.' }
    raise Exception.Create(cc_rscstr.cTXT0000440);
end;

function TEPaymentProcessor.Void: Boolean;
begin
  FTransactionType := ttVoid;
  Validate;
  BuildCommand(ttVoid);
  Result := ExecuteCommand(FCommand.Command);
  CheckSendTimeOutReversal;
end;

procedure TEPaymentProcessor.CheckSendTimeOutReversal;
var
  AOwnerForm: TUniForm;
begin
  if TimeOutReversalStatus.Required and not TimeOutReversalStatus.Resolved then
  begin
    AOwnerForm := IQMS.Common.Controls.GetOwnerForm(Self);
    if not cc_share.SilentMode then
    begin
      // cc_timeout_reversal
      TFrmCCTimeOutReversal.DoShow(Self);
    end
    else
      TFrmCCTimeOutReversal.Create(Self).Start;
  end;
end;

procedure TEPaymentProcessor.SimulateRequest(
  const ATransactionType: TTransactionType; const ARequest: string;
  var AResult: string);
begin
  if ARequest > '' then
  begin
    Self.FTransactionType := ATransactionType;
    Self.TestMode := True;
    ExecuteCommand(ARequest);
    Response.GetSummaryDetails(FTransactionType, { var } AResult);
  end;
end;

procedure TEPaymentProcessor.SimulateResponse(
  const ATransactionType: TTransactionType; const AResponse: string;
  var AResult: string);
begin
  if AResponse > '' then
  begin
    FTransactionType := ATransactionType;
    Response.ResponseData := AResponse;
    ParseResponseText;
    Response.GetSummaryDetails(FTransactionType, { var } AResult);
  end;
end;

{$ENDREGION 'TEPaymentProcessor'}

{$REGION 'TEPaymentMerchantAccountsCa'}

{ TEPaymentMerchantAccountsCa }

constructor TEPaymentMerchantAccountsCa.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCountryCodeFormat := cctChr2;
  HttpContentType := ctXML;
  FGateway := cgwMerchantAccountsCa;
end;

procedure TEPaymentMerchantAccountsCa.GetURL(var AURL: string;
  var APort: Integer);
begin
  // Port is always zero
  APort := 0;
  if TestMode then
    AURL := 'https://dev.psigate.com:7989/Messenger/XMLMessenger'
  else
    AURL := 'https://secure.psigate.com:7934/Messenger/XMLMessenger';
end;

function TEPaymentMerchantAccountsCa.Authorize: Boolean;
var
  ACommand: TStringList;
  AModifiedAmount: Real;
begin
  // PreAuth transactions (CardAction = 1) authorize and reserve funds,
  // but do not capture funds until a corresponding PostAuth transaction
  // referencing the PreAuth transaction is issued. Merchants perform
  // PreAuth transactions when services or products are not delivered
  // immediately such as most physical goods. PSiGate guarantees that
  // the card issuer shall reserve the authorized amount for five days.
  // Initialization
  Validate;
  // cc_rscstr.cTXT0000451 = 'Transaction ID not provided.';
  IQAssert(not TransactionID.IsEmpty, cc_rscstr.cTXT0000451);
  ACommand := TStringList.Create;
  try
    BuildCommand_Start(ttAuthOnly, ACommand);
    // Note: If item detail is included in a transaction request,
    // the Subtotal value will be calculated from ItemPrice and ItemQty values.
    // If the Subtotal element is included in a transaction request,
    // the derived item detail Subtotal amount will supersede the amount
    // given in the Subtotal element.
    // 10/05/2012 Important Note:
    // We modify the amount (SubTotal element) because for Merchant Accounts,
    // they expect the everything to be divided into elements.  So, provide
    // Tax and Freight separately.  The bottom line is, requested amount
    // absolutely must NOT include tax and freight.  If it is combined,
    // the account is overcharged.  This came out of a lengthy discussion
    // with David Goodale and Matthew Weekes (1.877.374.9444 x 6987) in
    // technical support.
    AModifiedAmount := TransactionAmount - TaxAmount - FreightAmount;
    if AModifiedAmount < 0 then
    begin
      AModifiedAmount := TransactionAmount;
    end;
    BuildCommand_CreditCardInformation(AModifiedAmount, ACommand);
    // Add order itemization
    BuildCommand_ItemDetails(ACommand);
    // Level 2 processing
    BuildCommand_Level2(ACommand);
    // Finalize (end) the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
    // Set the transaction type (this is not returned in the gateway response)
    Response.TransactionType := TransactionTypeStr[ttAuthOnly];
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.AVSCheck: Boolean;
var
  ACommand: TStringList;
begin
  // Initialization
  Validate;
  ACommand := TStringList.Create;
  try
    BuildCommand_Start(ttAuthOnly, ACommand);
    // Note: If item detail is included in a transaction request,
    // the Subtotal value will be calculated from ItemPrice and ItemQty values.
    // If the Subtotal element is included in a transaction request,
    // the derived item detail Subtotal amount will supersede the amount
    // given in the Subtotal element.
    BuildCommand_CreditCardInformation(0.01, ACommand);
    // Finalize (end) the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text) and Response.IsAVSApproved;
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.Capture: Boolean;
var
  ACommand: TStringList;
begin
  // PostAuth transactions (CardAction = 2) capture the funds that were
  // reserved by a previous PreAuth transaction. Merchants perform
  // PostAuth transactions when they initiate the delivery of the
  // associated service or product. In the case of physical goods,
  // PostAuth transactions may only be issued once the product has been
  // shipped or is ready to be shipped.
  //
  // PostAuth - When a PostAuth transaction is issued with no FullTotal
  // value, PSiGate will capture the full amount of the associated
  // PreAuth transaction.
  //
  // Partial PostAuth - When a PostAuth transaction is issued with a
  // FullTotal value less than the amount indicated within the
  // FullTotal of the PreAuth transaction, PSiGate will capture the
  // lesser amount.

  // Initialize and validate
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  ACommand := TStringList.Create;
  try
    // Start the command
    BuildCommand_Start(ttCapture, ACommand);
    // Add transaction ID
    ACommand.Add(Format('<SubTotal>%s</SubTotal>',
      [FormatFloatValue(TransactionAmount)]));
    // Finalize the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.Refund: Boolean;
var
  ACommand: TStringList;
begin
  // Credit transactions (CardAction = 3) debit your account and refund
  // the cardholder. Merchants perform Credit transactions when their
  // customer is to be refunded. You can issue multiple Credit
  // transaction requests so long as the sum of those transactions does
  // not exceed the amount of the approved Sale or PostAuth transaction.
  // If the total amount of credits equals the amount of approved Sale
  // or PostAuth transaction, the order will be cancelled.
  // Initialization
  Validate;
  // cc_rscstr.cTXT0000451 = 'Transaction ID not provided.';
  IQAssert(not TransactionID.IsEmpty, cc_rscstr.cTXT0000451);
  ACommand := TStringList.Create;
  try
    // Start the command
    BuildCommand_Start(ttCredit, ACommand);
    // Add transaction ID
    ACommand.Add(Format('<SubTotal>%s</SubTotal>',
      [FormatFloatValue(ReversalData.RequestedAmount)]));
    // Finalize the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.Force(AVoiceAuthCode: string): Boolean;
var
  ACommand: TStringList;
begin
  // Forced PostAuth transactions (CardAction = 4) capture funds based
  // on an authorization number that was not previously obtained through
  // a PSiGate real-time Sale or PreAuth transaction request.
  //
  // Example: Merchant authorizes the transaction through the
  // authorization center of their merchant issuing bank. Merchants
  // perform Forced PostAuth transactions when they need to settle an
  // already authorized transaction.
  //
  // Warning: The Forced PostAuth transaction amount must equal the
  // amount requested when the authorization number was given otherwise
  // the financial institution will reverse the transaction.
  // Initialization
  FForceVoiceAuthCode := AVoiceAuthCode;
  Validate;
  // cc_rscstr.cTXT0000451 = 'Transaction ID not provided.';
  IQAssert(not TransactionID.IsEmpty, cc_rscstr.cTXT0000451);
  // cc_rscstr.cTXT0000432 = 'Voice authorization number required.';
  IQAssert(not AVoiceAuthCode.IsEmpty, cc_rscstr.cTXT0000432);
  ACommand := TStringList.Create;
  try
    // Start the command
    BuildCommand_Start(ttForce, ACommand);
    // Add credit card information, and transaction amount
    BuildCommand_CreditCardInformation(TransactionAmount, ACommand);
    // Voide authorization number
    ACommand.Add(Format('<CardAuthNumber>%s</CardAuthNumber>',
      [AVoiceAuthCode]));
    // Finalize the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.FormatFloatValue
  (const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  Result := FormatFloat('###00.00', AValue, AFormatSettings);
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentMerchantAccountsCa.Sale: Boolean;
var
  ACommand: TStringList;
  AModifiedAmount: Real;
begin
  // To include these elements as part of your transaction request,
  // follow the sample code and refer to the CardIDNumber, CardLevel2ComCardType,
  // CardLevel2PO and CardLevel2Tax elements within the Detailed Element List –
  // Credit Card Payment.
  //
  // Test Account:
  // - StoreID:  i.e., 'teststore'
  // - Passphrase: i.e., 'psigate1234'
  // - Test Subtotal: i.e., '10.00'
  //
  // Sale transactions (CardAction = 0) authorize and capture funds in a
  // single transaction. Merchants perform Sale transactions when services
  // or products are delivered immediately such as software downloads or
  // access to member areas.
  Validate;
  // cc_rscstr.cTXT0000451 = 'Transaction ID not provided.';
  IQAssert(not TransactionID.IsEmpty, cc_rscstr.cTXT0000451);
  ACommand := TStringList.Create;
  try
    BuildCommand_Start(ttSale, ACommand);
    // Note: If item detail is included in a transaction request,
    // the Subtotal value will be calculated from ItemPrice and ItemQty values.
    // If the Subtotal element is included in a transaction request,
    // the derived item detail Subtotal amount will supersede the amount
    // given in the Subtotal element.
    //
    // 10/05/2012 Important Note:
    // We modify the amount (SubTotal element) because for Merchant Accounts,
    // they expect the everything to be divided into elements.  So, provide
    // Tax and Freight separately.  The bottom line is, requested amount
    // absolutely must NOT include tax and freight.  If it is combined,
    // the account is overcharged.  This came out of a lengthy discussion
    // with David Goodale and Matthew Weekes (1.877.374.9444 x 6987) in
    // technical support.
    AModifiedAmount := TransactionAmount - TaxAmount - FreightAmount;
    if AModifiedAmount < 0 then
    begin
      AModifiedAmount := TransactionAmount;
    end;
    BuildCommand_CreditCardInformation(AModifiedAmount, ACommand);
    // Add order itemization
    BuildCommand_ItemDetails(ACommand);
    // Level 2 processing
    BuildCommand_Level2(ACommand);
    // Finalize (end) the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
    // Set the transaction type (this is not returned in the gateway response)
    Response.TransactionType := TransactionTypeStr[ttSale];
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

function TEPaymentMerchantAccountsCa.AuthenticateCard: Boolean;
var
  ACommand: TStringList;
begin
  Validate;
  ACommand := TStringList.Create;
  try
    BuildCommand_Start(ttAuthOnly, ACommand);
    // Note: If item detail is included in a transaction request,
    // the Subtotal value will be calculated from ItemPrice and ItemQty values.
    // If the Subtotal element is included in a transaction request,
    // the derived item detail Subtotal amount will supersede the amount
    // given in the Subtotal element.
    BuildCommand_CreditCardInformation(0.01, ACommand);
    // Finalize (end) the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text) and Response.Approved;
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

procedure TEPaymentMerchantAccountsCa.Validate;
begin
  inherited Validate;
  // cc_rscstr.cTXT0000438 =
  // 'Merchant login not provided.
  // Please specify a login name for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantLogin.IsEmpty, cc_rscstr.cTXT0000438);
  // cc_rscstr.cTXT0000439 =
  // 'Merchant password not provided.
  // Please specify a password for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantPassword.IsEmpty, cc_rscstr.cTXT0000439);
end;

function TEPaymentMerchantAccountsCa.Void: Boolean;
var
  ACommand: TStringList;
begin
  // Void transactions (CardAction = 9) cancel the effect of a previous
  // transaction. Merchants perform Void transaction requests to reverse
  // a PostAuth, Sale or Credit transaction and prevent the customer’s
  // credit card statement from displaying a record of the transaction.
  //
  // Example: A Sale followed by a Credit would appear as two separate
  // transactions on a cardholder’s statement. A Sale followed by a
  // Void would result in neither transaction appearing on the
  // cardholder’s statement. The limitation of a Void transaction is
  // that the transaction to be voided cannot have already been settled.
  // Once settled, a transaction can no longer be voided.
  Validate;
  // cc_rscstr.cTXT0000451 = 'Transaction ID not provided.';
  IQAssert(not TransactionID.IsEmpty, cc_rscstr.cTXT0000451);
  ACommand := TStringList.Create;
  try
    // Start the command
    BuildCommand_Start(ttVoid, ACommand);
    // Add transaction ID
    ACommand.Add(Format('<TransRefNumber>%s</TransRefNumber>',
      [ReversalData.ReferenceNumber]));
    // Finalize the command
    BuildCommand_End(ACommand);
    // Execute the command
    Result := ExecuteCommand(ACommand.Text);
  finally
    if Assigned(ACommand) then
      FreeAndNil(ACommand);
  end;
end;

procedure TEPaymentMerchantAccountsCa.BuildCommand_Start(ATransactionType
  : TTransactionType; var ACommand: TStringList);
begin
  FTransactionType := ATransactionType;
  ACommand.Add('<?xml version="1.0" encoding="UTF-8"?>');
  ACommand.Add('<Order>');
  ACommand.Add(Format('<StoreID>%s</StoreID>', [MerchantLogin]));
  ACommand.Add(Format('<Passphrase>%s</Passphrase>', [MerchantPassword]));
  // Test mode flag
  if TestMode then
    ACommand.Add('<TestResult>A</TestResult>');
  ACommand.Add('<PaymentType>CC</PaymentType>');
  // CardAction:
  // 0 – Sale
  // 1 – PreAuth
  // 2 – PostAuth
  // 3 – Credit
  // 4 – Forced PostAuth
  // 9 – Void
  case ATransactionType of
    ttSale:
      ACommand.Add('<CardAction>0</CardAction>');
    ttAuthOnly:
      ACommand.Add('<CardAction>1</CardAction>');
    ttCapture:
      ACommand.Add('<CardAction>2</CardAction>');
    ttCredit:
      ACommand.Add('<CardAction>3</CardAction>');
    ttVoid:
      ACommand.Add('<CardAction>9</CardAction>');
    ttForce:
      ACommand.Add('<CardAction>4</CardAction>');
    ttAVSOnly:
      ACommand.Add('<CardAction>1</CardAction>');
  end;
  // This is a unique id for this transaction (which we provide).
  ACommand.Add(Format('<OrderID>%s</OrderID>', [TransactionID]));
  // The Userid is intended for the merchant.  PSiGate’s transaction
  // server does not use the Userid. You may sort based on the Userid
  // within the Reports
  ACommand.Add(Format('<Userid>%s</Userid>', [IQMS.Common.Miscellaneous.IQGetUID]));
end;

procedure TEPaymentMerchantAccountsCa.BuildCommand_CreditCardInformation
  (AAmount: Real; var ACommand: TStringList);
begin
  // Note: If item detail is included in a transaction request,
  // the Subtotal value will be calculated from ItemPrice and ItemQty values.
  // If the Subtotal element is included in a transaction request,
  // the derived item detail Subtotal amount will supersede the amount
  // given in the Subtotal element.
  ACommand.Add(Format('<Subtotal>%s</Subtotal>', [FormatFloatValue(AAmount)]));
  ACommand.Add(Format('<CardNumber>%s</CardNumber>', [CreditCard.CardNumber]));
  ACommand.Add(Format('<CardExpMonth>%s</CardExpMonth>',
    [CreditCard.ExpireMonthAsStr]));
  ACommand.Add(Format('<CardExpYear>%s</CardExpYear>',
    [CreditCard.ExpireYearAsStr]));
  if not CreditCard.SecurityCode.IsEmpty then
    ACommand.Add(Format('<CardIDNumber>%s</CardIDNumber>',
      [CreditCard.SecurityCode]));
  // Credit Card billing information
  ACommand.Add(Format('<Bname>%s</Bname>',
    [AnsiStrings.LeftStr(CreditCard.CustomerFullName, 100)]));
  ACommand.Add(Format('<Bcompany>%s</Bcompany>',
    [AnsiStrings.LeftStr(CreditCard.CustomerCompany, 100)]));
  ACommand.Add(Format('<Baddress1>%s</Baddress1>',
    [AnsiStrings.LeftStr(CreditCard.CustomerAddress, 100)]));
  // ACommand.Add(Format('<Baddress2>Apt 6</Baddress2>', []));
  ACommand.Add(Format('<Bcity>%s</Bcity>',
    [AnsiStrings.LeftStr(CreditCard.CustomerCity, 100)]));
  ACommand.Add(Format('<Bprovince>%s</Bprovince>',
    [AnsiStrings.LeftStr(CreditCard.CustomerState, 100)]));
  ACommand.Add(Format('<Bpostalcode>%s</Bpostalcode>',
    [AnsiStrings.LeftStr(CreditCard.CustomerPostalCode, 100)]));
  ACommand.Add(Format('<Bcountry>%s</Bcountry>',
    [AnsiStrings.LeftStr(CreditCard.CustomerCountryCode, 50)]));
  ACommand.Add(Format('<Phone>%s</Phone>',
    [AnsiStrings.LeftStr(CreditCard.CustomerTelephone, 50)]));
  // 416-555-2092
  ACommand.Add(Format('<Fax>%s</Fax>',
    [AnsiStrings.LeftStr(CreditCard.CustomerFax, 50)]));
  ACommand.Add(Format('<Email>%s</Email>',
    [AnsiStrings.LeftStr(CreditCard.CustomerEmail, 100)]));
  ACommand.Add(Format('<Comments>%s</Comments>',
    [AnsiStrings.LeftStr(TransactionDescription, 300)]));
end;

procedure TEPaymentMerchantAccountsCa.BuildCommand_Level2
  (var ACommand: TStringList);
begin
  if (ProcessingClass = pclLevel2) then
  begin
    // B = Business; C = Corporate; P = Purchasing
    // ACommand.Add
    // (Format('<CardLevel2ComCardType>B</CardLevel2ComCardType>', []));
    ACommand.Add(Format('<CardLevel2PO>%s</CardLevel2PO>',
      [AnsiStrings.LeftStr(PurchaseOrderNumber, 25)]));
    ACommand.Add(Format('<CardLevel2Tax>%s</CardLevel2Tax>',
      [FormatFloatValue(TaxAmount)]));
  end;
end;

procedure TEPaymentMerchantAccountsCa.BuildCommand_ItemDetails
  (ACommand: TStringList);
var
  i: Integer;
begin
  // Item details
  for i := 0 to Level3Options.Itemization.Count - 1 do
  begin
    ACommand.Add('<Item>');
    ACommand.Add(Format('<ItemID>%s</ItemID>',
      [AnsiStrings.LeftStr(Level3Options.Itemization.Items[i]
      .ItemNumber, 50)]));
    ACommand.Add(Format('<ItemDescription>%s</ItemDescription>',
      [AnsiStrings.LeftStr(Level3Options.Itemization.Items[i]
      .ItemDescription, 200)]));
    ACommand.Add(Format('<ItemQty>%s</ItemQty>',
      [FormatFloatValue(Level3Options.Itemization.Items[i].Quantity)]));
    ACommand.Add(Format('<ItemPrice>%s</ItemPrice>',
      [FormatFloatValue(Level3Options.Itemization.Items[i].Price)]));
    // Item options - Some merchants may require customized item descriptors.
    // These tags are not to be hard-coded, but are dynamic and depend on
    // what the gateway expects.  The Option tags below are just examples.
    // ACommand.Add(Format('<Option>',[]));
    // ACommand.Add(Format('<Type>Electronic</Type>',[]));
    // ACommand.Add(Format('<url>http://www.psigate.com/docs/</url>',[]));
    // ACommand.Add(Format('<file>IQMS.Common.XML.doc</file>',[]));
    // ACommand.Add(Format('</Option>',[])); }
    ACommand.Add(Format('</Item>', []));
  end;
  // Order detail (continued)
  ACommand.Add(Format('<Tax1>%s</Tax1>', [FormatFloatValue(TaxAmount)]));
  ACommand.Add(Format('<ShippingTotal>%s</ShippingTotal>',
    [FormatFloatValue(FreightAmount)]));
end;

procedure TEPaymentMerchantAccountsCa.BuildCommand_End
  (var ACommand: TStringList);
begin
  ACommand.Add('</Order>');
end;

procedure TEPaymentMerchantAccountsCa.ParseResponseText;
var
  ATagValue: string;
  AStatusCode: ShortString;
  AStatusDescription: string;
  AStatusClass: TResponseClass;
begin
  if Response.ResponseData.IsEmpty then
    Exit;
  // Add raw field values from the response data
  // _addReturnValue('');
  // Indicates the status of the authorization request.
  Response.ReturnCode := ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'ReturnCode'));
  ProcessResponseStatusCode(Response.ReturnCode, AStatusCode,
    AStatusDescription, AStatusClass);
  Response.StatusCode := AStatusCode;
  Response.StatusDescription := AStatusDescription;
  Response.StatusClass := AStatusClass;
  // Contains an authorization code when a transaction has been approved.
  // There are three possible values:
  // APPROVED - The transaction request has been approved.
  // DECLINED - The transaction request was accepted as a
  // valid request and was declined by the card issuing bank.
  // Note: Check the Return Code and ErrMsg for details.
  // ERROR - The transaction request encountered an error.
  // Note: Check the Return Code and ErrMsg for details. }
  Response.ApprovalCode := ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'Approved'));
  // Indicates the status of the last transaction.
  Response.Approved := CompareText(Response.ApprovalCode, 'APPROVED') = 0;

  // Ensure there is a status class
  if (Response.StatusClass = rcNone) and
    (CompareText(Response.ApprovalCode, 'APPROVED') = 0) then
    Response.StatusClass := rcSuccess;

  if (Response.StatusClass = rcNone) and
    (CompareText(Response.ApprovalCode, 'DECLINED') = 0) then
    Response.StatusClass := rcFailure;

  // If there is no response status, then assume failure
  if Response.StatusClass = rcNone then
    Response.StatusClass := rcFailure;

  // Contains the Address Verification System result code.
  //  X- Exact match, 9-digit zip
  //  Y- Exact match, 5-digit zip
  //  A – Address match
  //  W – 9-digit zip match only
  //  Z – 5-digit zip match only
  //  N – No address or zip match
  //  U – Address unavailable
  //  R – Card Issuer system unavailable
  //  E – Not a MOTO order
  //  S – Service not supported
  //  Blank – Not processed
  //  Note: For AVS to function, the numeric street address must
  //  be entered into Baddress1 and the zip/postal code must be
  //  entered into Bpostalcode.
  // Note:  The IsAVSApproved and AVSDescription will be set once
  // we set the AVSCode property.
  Response.AVSCode := ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'AVSResult'));
  // Contains the returned CVV2 result code if it was requested.
  //  M – Match
  //  N – No match
  //  P – Not processed
  //  S – Not passed
  //  U – Issuer does not support CardID verification
  //  Blank – Not passed or not processed. }
  // Note:  The IsSecurityCodeApproved and SecurityResultDescription will be set once
  // we set the SecurityResultCode property.
  Response.SecurityResultCode :=
    ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData, 'CardIDResult'));
  Response.TransactionID :=
    ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData, 'OrderID'));
  // Invoice number submitted in authorization request (if applicable).
  Response.InvoiceNumber := '';
  // Get error message
  ATagValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData, 'ErrMsg');
  // assign full text by default
  Response.ErrorText := ATagValue;
  // Get the code and error separately
  if not ATagValue.IsEmpty and (IQMS.Common.StringUtils.NumToken(ATagValue, ':') = 2)
  then
  begin
    Response.ErrorCode := ShortString(IQMS.Common.StringUtils.GetToken(ATagValue, ':', 1));
    Response.ErrorDescription :=
      ShortString(IQMS.Common.StringUtils.GetToken(ATagValue, ':', 2));
    // Is this check necessary?  If there is an error...
    if not Response.Approved then
      Response.StatusClass := rcError;
  end;
  // Response code from the underlying processor.
  Response.ProcessorCode :=
    ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData, 'CardRefNumber'));
  // <TransRefNumber>1bec74db714b88f0</TransRefNumber>
  Response.ReferenceNumber :=
    ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData, 'TransRefNumber'));
  Response.TimeStamp := ShortString(IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'TransTime'));
  FRetry := not Response.Approved;
end;

procedure TEPaymentMerchantAccountsCa.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
var
  ATokenList: TStringList;
  AApproved: Boolean;
begin
  // Text information that describes each response code.
  AApproved := False;
  if not AResponse.IsEmpty then
  begin
    ATokenList := TStringList.Create;
    try
      IQMS.Common.StringUtils.Tokenize(AResponse, [':'], ATokenList);
      if ATokenList.Count > 1 then
      begin
        ACode := ShortString(ATokenList.Strings[1]);
        AApproved := (CompareText(ATokenList.Strings[0], 'Y') = 0);
        // cc_rscstr.cTXT0000055 = 'Transaction approved.';
        if AApproved then
          ADescription := cc_rscstr.cTXT0000055
        else
          ADescription := Response.ErrorText;
      end;
    finally
      FreeAndNil(ATokenList);
    end;
  end;

  if AApproved then
    AResponseClass := rcSuccess
  else if CompareText(ACode, 'DECLINED') = 0 then
    AResponseClass := rcFailure
  else if CompareText(ACode, 'ERROR') = 0 then
    AResponseClass := rcError
  else
    AResponseClass := rcNone;
end;

{$ENDREGION 'TEPaymentMerchantAccountsCa'}

{$REGION 'TEPaymentTSYS'}
{ TEPaymentTSYS }

constructor TEPaymentTSYS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCountryCodeFormat := cctDigit3;
  HttpContentType := ctXML;
  FGateway := cgwTSYS;
  FCommand.ListDelimiter := #13;
end;

procedure TEPaymentTSYS.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://stagegw.transnox.com/servlets/TransNox_API_Server'
  else
    AURL := 'https://gateway.transit-pass.com/servlets/TransNox_API_Server';
end;

function TEPaymentTSYS.GetCardTypeCode: string;
begin
  Result := '';
  // Here are the TSYS card type codes for the supported
  // credit cards.  We currently do not support Gift Cards
  // or ATM.
  case CreditCard.CardType of
    ccVisa:
      Result := 'V';
    ccMasterCard:
      Result := 'M';
    ccAmex:
      Result := 'X';
    ccDiscover:
      Result := 'R';
    ccDinersClub:
      Result := 'I';
    ccJCB:
      Result := 'J';
    ccChinaUnionPay:
      Result := 'CUP';
  end; // end case
end;

procedure TEPaymentTSYS.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantID, 'Merchant ID');
  ValidateSetting(MerchantDeviceID, 'Merchant Device ID');
  ValidateSetting(MerchantOperator, 'Merchant Operator');
  ValidateSetting(MerchantPassword, 'Merchant Password');
  IQAssert(CreditCard.CardType <> ccUnknown, 'Credit Card type not supplied.');
end;

function TEPaymentTSYS.Authorize: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttAuthOnly);
  Result := ExecuteCommand(FCommand.Command);
  Response.TransactionType := TransactionTypeStr[ttAuthOnly];
end;

function TEPaymentTSYS.AVSCheck: Boolean;
begin
  Validate;
  BuildCommand(ttAVSOnly);
  Result := ExecuteCommand(FCommand.Command);
end;

function TEPaymentTSYS.Capture: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttCapture);
  Result := ExecuteCommand(FCommand.Command);
end;

function TEPaymentTSYS.Refund: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  TransactionAmount := ReversalData.RequestedAmount;
  BuildCommand(ttCredit);
  Result := ExecuteCommand(FCommand.Command);
end;

function TEPaymentTSYS.Force(AVoiceAuthCode: string): Boolean;
begin
  FForceVoiceAuthCode := AVoiceAuthCode;
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttForce);
  Result := ExecuteCommand(FCommand.Command);
end;

function TEPaymentTSYS.FormatFloatValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
  s: string;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  s := FormatFloat('###0.00', AValue, AFormatSettings);
  Result := IQMS.Common.StringUtils.StrTran(s, ',', '');
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentTSYS.FormatFloatValue_API_1(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
  s: string;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  s := FormatFloat('###0.00', AValue, AFormatSettings);
  s := IQMS.Common.StringUtils.StrTran(s, '.', '');
  Result := IQMS.Common.StringUtils.StrTran(s, ',', '');
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentTSYS.Sale: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttSale);
  Result := ExecuteCommand(FCommand.Command);
  Response.TransactionType := TransactionTypeStr[ttSale];
end;

function TEPaymentTSYS.Void: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  BuildCommand(ttVoid);
  Result := ExecuteCommand(FCommand.Command);
end;

procedure TEPaymentTSYS.BuildCommand(const ATransactionType: TTransactionType);
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;

  // Force, requiring line items
  if (ProcessingClass = pclLevel3) and (ATransactionType = ttForce) then
    BuildCommand_API_1(ATransactionType)
    // Basic Credit and Force
  else if (ATransactionType in [ttCredit, ttForce, ttAddToken, ttDeleteToken,
    ttQueryToken]) then
    BuildCommand_API_3(ATransactionType)
    // Level 2 and 3
  else if (ProcessingClass in [pclLevel2, pclLevel3]) then
    BuildCommand_API_1(ATransactionType)
    // Everything else
  else
    BuildCommand_API_3(ATransactionType);
end;

procedure TEPaymentTSYS.BuildCommand_API_3(const ATransactionType
  : TTransactionType);
const
  StartTag: array [TTransactionType] of string = ('<Sale>',
    '<Auth>', '<Capture>', '<Return>', '<Void>', '<ForcedAuth>',
    '<CardAuthentication>', '<CardAuthentication>', '', '');
  EndTag: array [TTransactionType] of string = ('</Sale>',
    '</Auth>', '</Capture>', '</Return>', '</Void>', '</ForcedAuth>',
    '</CardAuthentication>', '</CardAuthentication>', '', '');

  procedure _appendElement(const AName, AValue: string;
    const AMinSize, AMaxSize: SmallInt); overload;
  begin
    if (Length(AValue) >= AMinSize) and (Length(AValue) <= AMaxSize) then
      FCommand.Add(Format('<%s>%s</%s>', [AName, AValue, AName]));
  end;

  procedure _appendElement(const AName, AValue: string;
    const AExactSize: SmallInt); overload;
  begin
    if (Length(AValue) = AExactSize) then
      FCommand.Add(Format('<%s>%s</%s>', [AName, AValue, AName]));
  end;

  procedure _appendElement(const AName: string; AValue: Real); overload;
  begin
    FCommand.Add(Format('<%s>%s</%s>',
      [AName, FormatFloatValue(AValue), AName]));
  end;

  procedure _appendCardDataSource;
  begin
    case TransactionMethod of
      tmCardPresent:
        FCommand.Add('<cardDataSource>PRESENT</cardDataSource>');
      tmTelephone:
        FCommand.Add('<cardDataSource>PHONE</cardDataSource>');
      tmMail:
        FCommand.Add('<cardDataSource>MAIL</cardDataSource>');
      tmInternet:
        FCommand.Add('<cardDataSource>INTERNET</cardDataSource>');
    end;
  end;

  procedure _appendKeyedCardData;
  begin
    _appendElement('cardNumber', CreditCard.CardNumber, 13, 19);
    _appendElement('expirationDate', CreditCard.ExpirationMMYY, 4);
    _appendElement('cvv2', CreditCard.SecurityCode, 3, 4);
    _appendElement('addressLine1', CreditCard.CustomerAddress, 2, 200);
    _appendElement('zip', CreditCard.CustomerPostalCode, 2, 15);
  end;

  procedure _appendConsumerData;
  begin
    if (Length(CreditCard.CustomerFirstName) in [2 .. 30]) and
      (Length(CreditCard.CustomerLastName) in [2 .. 30]) then
    begin
      _appendElement('firstName', CreditCard.CustomerFirstName, 2, 30);
      _appendElement('lastName', CreditCard.CustomerLastName, 2, 30);
    end;
  end;

begin
  FTransactionType := ATransactionType;
  FCommand.Clear;

  FCommand.Add('<?xml version="1.0" encoding="UTF-8"?>');
  FCommand.Add(StartTag[FTransactionType]);
  _appendElement('deviceID', MerchantDeviceID, 14, 15);
  _appendElement('transactionKey', MerchantTransactionKey, 32);

  // Note: The sequence of each element must be exactly as follows.
  case FTransactionType of
    ttSale:
      begin
        _appendCardDataSource;
        _appendElement('transactionAmount', TransactionAmount);
        if TaxAmount > 0 then
          _appendElement('salesTax', TaxAmount);
        _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendKeyedCardData;
        // _appendElement('externalReferenceID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
        _appendElement('orderNumber', SalesOrderNumber, 2, 30);

        if CreditCard.AddAsNewToken then
          _appendElement('tokenRequired', 'Y', 1);
        _appendConsumerData;
      end;
    ttAuthOnly:
      begin
        _appendCardDataSource;
        _appendElement('transactionAmount', TransactionAmount);
        if TaxAmount > 0 then
          _appendElement('salesTax', TaxAmount);
        _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendKeyedCardData;
        // _appendElement('externalReferenceID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
        _appendElement('orderNumber', SalesOrderNumber, 2, 30);
        if CreditCard.AddAsNewToken then
          _appendElement('tokenRequired', 'Y', 1);
        _appendConsumerData;
      end;
    ttCapture:
      begin
        _appendElement('transactionAmount', TransactionAmount);
        if TaxAmount > 0 then
          _appendElement('salesTax', TaxAmount);
        _appendElement('transactionID', TransactionID, 2, 100);
        // _appendElement('externalReferenceID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
      end;
    ttCredit:
      begin
        _appendCardDataSource;
        if TransactionAmount <> ReversalData.OriginalAmount then
          _appendElement('transactionAmount', TransactionAmount);
        // if TaxAmount > 0 then
        // _appendElement('salesTax', TaxAmount);
        // _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendElement('transactionID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
      end;
    ttVoid:
      begin
        _appendElement('transactionID', TransactionID, 2, 100);
        // _appendElement('externalReferenceID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
      end;
    ttForce:
      begin
        _appendElement('cardDataSource', 'MANUAL', Length('MANUAL'));
        _appendElement('transactionAmount', TransactionAmount);
        if TaxAmount > 0 then
          _appendElement('salesTax', TaxAmount);
        _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendKeyedCardData;
        // _appendElement('externalReferenceID', TransactionID, 2, 100);
        _appendElement('operatorID', MerchantOperator, 2, 256);
        _appendElement('orderNumber', SalesOrderNumber, 2, 30);
        if CreditCard.AddAsNewToken then
          _appendElement('tokenRequired', 'Y', 1);
        _appendElement('authTimestamp', FormatDateTime('yyyy-mm-dd"T"HH:NN:SS',
          TransactionDate), 19);
        _appendElement('authCode', FForceVoiceAuthCode, 2, 6);
        _appendConsumerData;
      end;
    ttAVSOnly:
      begin
        _appendCardDataSource;
        _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendKeyedCardData;
        _appendElement('operatorID', MerchantOperator, 2, 256);
      end;
    ttAddToken:
      begin
        _appendCardDataSource;
        _appendElement('currencyCode', TransactionCurrencyCode, 3);
        _appendKeyedCardData;
        _appendElement('operatorID', MerchantOperator, 2, 256);
        _appendElement('tokenRequired', 'Y', 1);
      end;
  else
    raise Exception.Create('Invalid TSYS transaction type.');
  end;

  _appendElement('developerID', TSYS_DEVELOPER_ID, 2, 20);
  FCommand.Add(EndTag[FTransactionType]);
end;

procedure TEPaymentTSYS.BuildCommand_API_1(ATransactionType: TTransactionType);
var
  IPAddress: string;
begin
  FTransactionType := ATransactionType;
  // Header (Required)
  FCommand.Add('<?xml version="1.0"?>');
  FCommand.Add('<InfoNox_Interface>');
  FCommand.Add('<TransNox_API_Interface>');
  FCommand.Add('<CardRQ>');
  // Device_Info (Required)
  FCommand.Add('<Device_Info>');
  FCommand.Add(Format('<Merchant_ID>%s</Merchant_ID>', [MerchantID]));
  // Note:  The Device_ID is assigned to us (IQMS) as part of our
  //  developer account
  FCommand.Add(Format('<Device_ID>%s</Device_ID>', [MerchantDeviceID]));
  FCommand.Add(Format('<Transaction_Key>%s</Transaction_Key>',
    [MerchantTransactionKey]));
  FCommand.Add(Format('<Unique_ID>%s</Unique_ID>', [TransactionID]));
  // COUNTER_PASS - CounterPASS terminal
  // WEB_PASS - WebPASS Terminal
  // KIOSK_PASS - Kiosk Terminal
  // GATEWAY - Gateway/MultiPASS Terminal
  // MOBILE_PASS - Mobile Payment Acceptance Terminal
  // POS_PASS - POS Terminal
  FCommand.Add('<Device_Type>GATEWAY</Device_Type>');
  FCommand.Add(Format('<Version>%s</Version>', [TSYS_SOFTWARE_VERSION]));
  FCommand.Add(Format('<Operator>%s</Operator>', [MerchantOperator]));
  FCommand.Add(Format('<Password>%s</Password>', [MerchantPassword]));
  if IQMS.Common.SysInfo.GetIPAddress(IPAddress) then
    FCommand.Add(Format('<Source_IPAddress>%s</Source_IPAddress>',
      [IPAddress]));
  FCommand.Add('</Device_Info>');
  // Transaction (Transaction_Info, required)
  FCommand.Add('<Transaction_Info>');
  case ATransactionType of
    ttSale:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>AUTH</SubServiceCode>');
        FCommand.Add('<Type>SETTLE</Type>'); // optional
      end;
    ttCapture:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>MODIFY</SubServiceCode>');
        FCommand.Add('<Type>SETTLE</Type>'); // optional
      end;
    ttAuthOnly:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>AUTH</SubServiceCode>');
        FCommand.Add('<Type>AUTH</Type>'); // optional
      end;
    ttCredit:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>AUTH</SubServiceCode>');
        FCommand.Add('<Type>RETURN</Type>'); // optional
      end;
    ttVoid:
      begin
        FCommand.Add('<Service_Code>DEBIT</Service_Code>');
        FCommand.Add('<SubServiceCode>REVERSAL</SubServiceCode>');
        FCommand.Add('<Type>RETURN</Type>'); // optional
      end;
    ttForce:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>AUTH</SubServiceCode>');
        FCommand.Add('<Type>FORCED</Type>'); // optional
      end;
    ttAVSOnly:
      begin
        FCommand.Add('<Service_Code>CREDIT</Service_Code>');
        FCommand.Add('<SubServiceCode>VERIFY</SubServiceCode>');
        // FCommand.Add('<Type></Type>'); // optional
      end;
  end;

  // Amount
  if (ATransactionType = ttAVSOnly) then
  begin
    FCommand.Add('<Requested_Amount>000</Requested_Amount>');
    FCommand.Add('<Amount>000</Amount>');
  end
  else if (ATransactionType in [ttSale, ttAuthOnly, ttForce]) then
  begin
    // 07/17/2013 Subtract the freight amount or the total acknowledged
    // by TSYS will be inflated.
    FCommand.Add(Format('<Amount>%s</Amount>',
      [FormatFloatValue_API_1(TransactionAmount - FreightAmount -
      TaxAmount - Level3Options.DutyAmount)]));
    // Freight
    FCommand.Add(Format('<Fee>%s</Fee>',
      [FormatFloatValue_API_1(FreightAmount)]));
    // optional
    FCommand.Add
      (Format('<Fee_Details Name="SHIPPING_CHARGES">%s</Fee_Details>',
      [FormatFloatValue_API_1(FreightAmount)])); // optional
    if CanProcessLevel3 then
      FCommand.Add
        (Format('<Fee_Details Name="DUTY_CHARGES">%s</Fee_Details>',
        [FormatFloatValue_API_1(Level3Options.DutyAmount)])); // optional
  end
  else if (ATransactionType = ttCredit) then
  begin
    // Partial refund (credit)
    FCommand.Add(Format('<Amount>%s</Amount>',
      [FormatFloatValue_API_1(TransactionAmount)]));
  end
  else if (ATransactionType = ttVoid) then
  begin
    // Full refund (void or reversal)
    FCommand.Add(Format('<Requested_Amount>%s</Requested_Amount>',
      [FormatFloatValue_API_1(TransactionAmount)])); // optional
    FCommand.Add('<Amount>0</Amount>');
  end
  else
  begin
    FCommand.Add(Format('<Amount>%s</Amount>',
      [FormatFloatValue_API_1(TransactionAmount)]));
  end;
  // FCommand.Add(Format('<Time_Stamp>%s</Time_Stamp>', [ToDateTime(Now())]));
  FCommand.Add(Format('<Time_Stamp>%s</Time_Stamp>',
    [FormatDateTime('mm/dd/yyyy HH:NN:SS', TransactionDate)]));
  // 10/29/2014 The transaction ID is required for refunds
  if (ATransactionType = ttCredit) then
    FCommand.Add(Format('<Transaction_ID>%s</Transaction_ID>',
      [TransactionID]));
  // Level III fields
  if (ATransactionType in [ttSale, ttAuthOnly, ttForce]) then
  begin
    if CanProcessLevel3 then
    begin
      if TaxExempt or (TaxAmount = 0) then
        FCommand.Add('<Tax Name="TAX_EXEMPT">0</Tax>') // optional
      else
      begin
        if Level3Options.LocalTaxExempt then
          FCommand.Add('<Tax Name="SALE">EXEMPT</Tax>') // optional
        else
          FCommand.Add(Format('<Tax Name="SALE">%s</Tax>',
            [FormatFloatValue_API_1(Level3Options.LocalTaxAmount)]));
        // optional
        FCommand.Add(Format('<Tax Name="NATIONAL">%s</Tax>',
          [FormatFloatValue_API_1(Level3Options.NationalTaxAmount)]));
        // optional
        FCommand.Add(Format('<Tax Name="TOTAL">%s</Tax>',
          [FormatFloatValue_API_1(TaxAmount)])); // optional
      end;
    end
    // Level II fields
    else
    begin
      if TaxExempt or (TaxAmount = 0) then
        FCommand.Add('<Tax Name="TAX_EXEMPT">0</Tax>') // optional
      else
      begin
        FCommand.Add(Format('<Tax Name="SALE">%s</Tax>',
          [FormatFloatValue_API_1(TaxAmount)])); // optional
        FCommand.Add(Format('<Tax Name="TOTAL">%s</Tax>',
          [FormatFloatValue_API_1(TaxAmount)])); // optional
      end;
    end;
  end;
  if not MerchantLanguageCode.IsEmpty and
    not (ATransactionType in [ttAVSOnly]) then
    FCommand.Add(Format('<Language>%s</Language>', [MerchantLanguageCode]));
  // optional
  FCommand.Add(Format('<Currency_Code>%s</Currency_Code>',
    [MerchantCurrencyCode])); // optional
  FCommand.Add(Format('<Country_Code>%s</Country_Code>',
    [MerchantCountryCode])
    ); // optional
  // Payment Mode (optional)
  if (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttVoid,
    ttForce { , ttAVSOnly } ]) then
  begin
    FCommand.Add('<Payment_Mode>'); // optional
    FCommand.Add('<Mode>CREDIT_CARD</Mode>'); // optional
    FCommand.Add(Format('<Amount>%s</Amount>',
      [FormatFloatValue_API_1(TransactionAmount)])); // optional
    FCommand.Add('</Payment_Mode>'); // optional
  end;
  FCommand.Add('</Transaction_Info>');

  // Card_Info (Required)
  FCommand.Add('<Card_Info>');
  FCommand.Add(Format('<Type>%s</Type>', [GetCardTypeCode]));
  if CreditCard.IsToken then
    FCommand.Add(Format('<Token>%s</Token>', [CreditCard.CardNumber]))
  else
    FCommand.Add(Format('<Number>%s</Number>', [CreditCard.CardNumber]));
  FCommand.Add(Format('<ExpirationDate>%s%s</ExpirationDate>',
    [CreditCard.Expire4DigitYearAsStr, CreditCard.ExpireMonthAsStr]));
  if not CreditCard.SecurityCode.IsEmpty then
  begin
    FCommand.Add('<CVV2_Availability>PRESENT</CVV2_Availability>');
    // optional
    FCommand.Add(Format('<CVV2>%s</CVV2>', [CreditCard.SecurityCode]));
    // optional
  end
  else
    FCommand.Add('<CVV2_Availability>NOT_PROVIDED</CVV2_Availability>');

  if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly]) then
  begin
    // Billing address (optional)
    if not CreditCard.CustomerAddress.IsEmpty or
      not CreditCard.CustomerPostalCode.IsEmpty then
    begin
      FCommand.Add('<Billing_Address>');
      FCommand.Add(Format('<StreetAddress>%s</StreetAddress>',
        [CreditCard.CustomerAddress]));
      FCommand.Add(Format('<City>%s</City>', [CreditCard.CustomerCity]));
      FCommand.Add(Format('<State>%s</State>',
        [CreditCard.CustomerState]));
      FCommand.Add(Format('<ZipCode>%s</ZipCode>',
        [CreditCard.CustomerPostalCode]));
      FCommand.Add(Format('<Country>%s</Country>',
        [CreditCard.CustomerCountryCode]));
      FCommand.Add('</Billing_Address>');
    end;
  end;

  FCommand.Add('<Entry_Mode>MANUAL</Entry_Mode>'); // optional
  case TransactionMethod of
    tmCardPresent:
      FCommand.Add('<Cardholder>PRESENT</Cardholder>'); // optional
    tmTelephone:
      FCommand.Add('<Cardholder>PHONE</Cardholder>'); // optional
    tmMail:
      FCommand.Add('<Cardholder>MAIL</Cardholder>'); // optional
    tmInternet:
      FCommand.Add('<Cardholder>INTERNET</Cardholder>'); // optional
  end;
  FCommand.Add('</Card_Info>');
  // Level II and Level III Product fields
  BuildCommand_ItemDetails_API_1;
  FCommand.Add('</CardRQ>');
  FCommand.Add('</TransNox_API_Interface>');
  FCommand.Add('</InfoNox_Interface>');
end;

procedure TEPaymentTSYS.BuildCommand_ItemDetails_API_1;
var
  i: Integer;
begin
  if ProcessingClass = pclLevel2 then
  begin
    FCommand.Add('<Products>');
    FCommand.Add('<Commercial_Card_Level>LEVEL2</Commercial_Card_Level>');
    FCommand.Add(Format('<Purchase_Order>%s</Purchase_Order>',
      [PurchaseOrderNumber]));
    FCommand.Add('</Products>');
  end
  else if CanProcessLevel3 then
  begin
    FCommand.Add('<Products>');
    FCommand.Add('<Commercial_Card_Level>LEVEL3</Commercial_Card_Level>');
    if not InvoiceNumber.IsEmpty then
      FCommand.Add(Format('<Invoice>%s</Invoice>', [InvoiceNumber]));
    FCommand.Add(Format('<Order_Date>%s</Order_Date>',
      [ToDate(SalesOrderDate)]));

    for i := 0 to Level3Options.Itemization.Count - 1 do
    begin
      FCommand.Add('<Product>');
      FCommand.Add(Format('<Code>%s</Code>',
        [AnsiStrings.LeftStr(Level3Options.Itemization.Items[i]
        .ItemNumber, 50)]));
      FCommand.Add(Format('<Name>%s</Name>',
        [AnsiStrings.LeftStr(Level3Options.Itemization.Items[i]
        .ItemDescription, 200)]));
      if (CreditCard.CardType in [ccVisa]) then
        FCommand.Add
          (Format('<Item_Commodity_Code>%s</Item_Commodity_Code>',
          [AnsiStrings.LeftStr(Level3Options.Itemization.Items[i]
          .CommodityCode, 20)]))
      else
        FCommand.Add('<Item_Commodity_Code>AAA</Item_Commodity_Code>');

      if Level3Options.Itemization.Items[i].Quantity > 999 then
        FCommand.Add('<Quantity>999</Quantity>')
      else
        FCommand.Add(Format('<Quantity>%.0f</Quantity>',
          [Level3Options.Itemization.Items[i].Quantity]));
      FCommand.Add(Format('<Price>%s</Price>',
        [FormatFloatValue_API_1(Level3Options.Itemization.Items[i].Price)]));
      FCommand.Add(Format('<Tax_Rate>%s</Tax_Rate>',
        [FormatFloatValue_API_1(Level3Options.Itemization.Items[i].TaxRate)]));
      FCommand.Add(Format('<Tax>%s</Tax>',
        [FormatFloatValue_API_1(Level3Options.Itemization.Items[i].Tax)]));
      FCommand.Add(Format('<Discount>%s</Discount>',
        [FormatFloatValue_API_1(Level3Options.Itemization.Items[i].Discount)]));
      FCommand.Add(Format('<Measurement_Unit>%s</Measurement_Unit>',
        [Level3Options.Itemization.Items[i].UOM]));
      FCommand.Add('</Product>');
    end;
    // This field contains a reference number that American Express uses to
    // get supporting information on a change from Merchant.
    // if (CreditCard.CardType in [ccAmEx]) then
    // FCommand.Add(Format('<Supplier_Reference_Number>%s</Supplier_Reference_Number>', [TransactionID]));
    // FCommand.Add(Format('<Charge_Descriptor2>%s</Charge_Descriptor2>', ['  ']));
    // FCommand.Add(Format('<Charge_Descriptor3>%s</Charge_Descriptor3>', ['  ']));
    // FCommand.Add(Format('<Charge_Descriptor3>%s</Charge_Descriptor4>', ['  ']));
    // FCommand.Add('<Additional_Amount>000</Additional_Amount>');

    if not PurchaseOrderNumber.IsEmpty then
      FCommand.Add(Format('<Purchase_Order>%s</Purchase_Order>',
        [PurchaseOrderNumber]));
    FCommand.Add(Format('<Ship_From_Zip>%s</Ship_From_Zip>',
      [Sender.PostalCode]));
    FCommand.Add(Format('<Ship_To_Zip>%s</Ship_To_Zip>',
      [Destination.PostalCode]));
    if (CreditCard.CardType in [ccVisa]) then
      FCommand.Add
        (Format('<Summary_Commodity_Code>%s</Summary_Commodity_Code>',
        [Level3Options.CommodityCode]));
    // FCommand.Add(Format('<Tax_Rate>%s</Tax_Rate>',['0']));
    // FCommand.Add(Format('<Cust_VAT_Number>%s</Cust_VAT_Number>', []));
    // A VAT invoice is an invoice for money you owe the government for
    // importing or exporting goods
    // FCommand.Add(Format('<VAT_Invoice>%s</VAT_Invoice>', ['000000']));
    FCommand.Add('</Products>');
  end;
end;

procedure TEPaymentTSYS.ParseResponseText;
begin
  // Force, requiring line items
  if (ProcessingClass = pclLevel3) and (FTransactionType = ttForce) then
    ParseResponseText_API_1
    // Basic Credit and Force
  else if (FTransactionType in [ttCredit, ttForce, ttAddToken, ttDeleteToken,
    ttQueryToken]) then
    ParseResponseText_API_3
    // Level 2 and 3
  else if (ProcessingClass in [pclLevel2, pclLevel3]) then
    ParseResponseText_API_1
    // Everything else
  else
    ParseResponseText_API_3;
end;

procedure TEPaymentTSYS.ParseResponseText_API_3;
var
  AStatus: string;
begin
  if Response.ResponseData.IsEmpty then
    Exit;

  if FGeneratingTransactionKey then
  begin
    AStatus := IQMS.Common.XML.GetXMLTagValue(
      Response.ResponseData,
      'GenerateKeyResponse\status');

    Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
      Response.ResponseData,
      'GenerateKeyResponse\responseCode');

    Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
      Response.ResponseData,
      'GenerateKeyResponse\responseMessage');

    if (CompareText(AStatus, 'PASS') = 0) then
    begin
      Response.StatusClass := rcSuccess;
      MerchantTransactionKey := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
        'GenerateKeyResponse\transactionKey');
    end
    else
      Response.StatusClass := rcFailure;

    Response.Approved := Response.StatusClass = rcSuccess;

    if Response.StatusClass <> rcSuccess then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText := Format('%s: %s.',
        [Response.ErrorCode, Response.ErrorDescription]);
    end;

    Exit;

  end;

  case FTransactionType of
    ttSale:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\responseMessage');

        Response.ApprovalCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\authCode');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\transactionTimestamp');

        Response.AVSCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\addressVerificationCode');

        Response.SecurityResultCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\cvvVerificationCode');

        Response.NewToken := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'SaleResponse\token');

      end;
    ttAuthOnly:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\responseMessage');

        Response.ApprovalCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\authCode');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\transactionTimestamp');

        Response.AVSCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\addressVerificationCode');

        Response.SecurityResultCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\cvvVerificationCode');

        Response.NewToken := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'AuthResponse\token');

      end;
    ttCapture:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CaptureResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CaptureResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CaptureResponse\responseMessage');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CaptureResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CaptureResponse\transactionTimestamp');

      end;
    ttCredit:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'ReturnResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'ReturnResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'ReturnResponse\responseMessage');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'ReturnResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'ReturnResponse\transactionTimestamp');

      end;
    ttVoid:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'VoidResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'VoidResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'VoidResponse\responseMessage');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'VoidResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'VoidResponse\transactionTimestamp');

      end;
    ttForce:
      begin
        if Pos('ForcedAuthResponse', Response.ResponseData) > 0 then
        begin
          AStatus := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\status');

          Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\responseCode');

          Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\responseMessage');

          Response.ApprovalCode := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\authCode');

          Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\transactionID');

          Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForcedAuthResponse\transactionTimestamp');
        end
        else if Pos('ForceResponse', Response.ResponseData) > 0 then
        begin
          AStatus := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\status');

          Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\responseCode');

          Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\responseMessage');

          Response.ApprovalCode := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\authCode');

          Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\transactionID');

          Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
            Response.ResponseData,
            'ForceResponse\transactionTimestamp');
        end;

      end;
    ttAVSOnly, ttAddToken:
      begin
        AStatus := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\status');

        Response.StatusCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\responseCode');

        Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\responseMessage');

        Response.ApprovalCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\authCode');

        Response.TransactionID := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\transactionID');

        Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\transactionTimestamp');

        Response.AVSCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\addressVerificationCode');

        Response.SecurityResultCode := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\cvvVerificationCode');

        Response.NewToken := IQMS.Common.XML.GetXMLTagValue(
          Response.ResponseData,
          'CardAuthenticationResponse\token');

      end;
    ttDeleteToken:
      ;
    ttQueryToken:
      ;
  end;

  // Status class
  if CompareText(AStatus, 'PASS') = 0 then
    Response.StatusClass := rcSuccess
  else if CompareText(AStatus, 'FAIL') = 0 then
    Response.StatusClass := rcFailure
  else
    Response.StatusClass := rcError;

  Response.Approved := Response.StatusClass = rcSuccess;
  Response.ReturnCode := Response.StatusCode;

  if (Response.StatusClass <> rcSuccess) then
  begin
    Response.ErrorCode := Response.StatusCode;
    Response.ErrorDescription := Response.StatusDescription;
    Response.ErrorText := Format('%s: %s.',
      [Response.ErrorCode, Response.ErrorDescription]);
  end;

  if (FTransactionType in [ttAddToken, ttDeleteToken, ttQueryToken]) then
  begin
    // Outcome of the token generation. This value will be a SUCCESS
    // if a token has been generated. Other possible returned values
    // are FAILURE, Action Not Permitted, Invalid Token, Not Permitted,
    // or Acct Verification Failed.
    // Response Code
    Response.TokenStatusDescription := Response.StatusDescription;
    Response.TokenStatusCode := Response.StatusCode;
    Response.ReturnCode := Response.TokenStatusCode;
    if not Response.NewToken.IsEmpty and (Response.StatusClass = rcSuccess) then
      Response.TokenStatusClass := trcSuccess
    else
      Response.TokenStatusClass := trcFailure;
  end;

  // 06/18/2014 Allow retry if not approved
  FRetry := not Response.Approved;
end;

procedure TEPaymentTSYS.ParseResponseText_API_1;
var
  AHost_ResponseCode, ACode, AValue: string;
  AResponseClass: TResponseClass;
  AErrorDetail: TStringList;
begin
  if Response.ResponseData.IsEmpty then
    Exit;

  // Response Code
  AHost_ResponseCode := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Host_ResponseCode');
  ACode := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Code');
  Response.AddReturnValue('Host_ResponseCode', AHost_ResponseCode);
  Response.AddReturnValue('Code', ACode);

  if not String.IsNullOrWhiteSpace(AHost_ResponseCode) then
  begin
    Response.ReturnCode := ShortString(AHost_ResponseCode);
    cc_tsys_utils.GetResponseText(AHost_ResponseCode, AResponseClass);
  end
  else if not String.IsNullOrWhiteSpace(ACode) then
  begin
    Response.ReturnCode := ShortString(ACode);
    cc_tsys_utils.GetResponseText(ACode, AResponseClass);
  end;

  if (AHost_ResponseCode = '00') or (ACode = '0000') then
    AResponseClass := rcSuccess;
  // else
  // cc_tsys_utils.GetResponseText(AHost_ResponseCode, AResponseClass);
  Response.StatusClass := AResponseClass;
  Response.StatusCode := ShortString(ACode);
  Response.StatusDescription := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Message');
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Auth_Code');
  Response.AddReturnValue('Auth_Code', AValue);
  Response.Approved := AResponseClass = rcSuccess;
  // Contains an authorization code when a transaction has been approved.
  // There are three possible values:
  // 1.) APPROVED - The transaction request has been approved.
  // 2.) DECLINED - The transaction request was accepted as a
  // valid request and was declined by the card issuing bank.
  // Note: Check the Return Code and ErrMsg for details.
  // 3.) ERROR - The transaction request encountered an error.
  // Note: Check the Return Code and ErrMsg for details. }

  AErrorDetail := TStringList.Create;
  try
    AErrorDetail.Add(Format('Code: %s.', [Response.StatusCode]));

    // Indicates the status of the last transaction.
    // INFO - Informative
    // WARN - Warning
    // VALIDATE - Validation Error
    // FATAL - Fatal Error
    AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
      'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Severity');
    Response.AddReturnValue('Severity', AValue);
    AErrorDetail.Add(Format('Severity: %s.', [AValue]));

    // Component
    AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
      'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Component');
    Response.AddReturnValue('Component', AValue);
    AErrorDetail.Add(Format('Component: %s.', [AValue]));

    // Get the error message
    if Response.StatusClass <> rcSuccess then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText := Format('%s: %s.',
        [Response.StatusCode, Response.StatusDescription]);
      Response.ErrorDetails := IQMS.Common.StringUtils.StringListToStr(AErrorDetail, '  ');
    end;
  finally
    AErrorDetail.Free;
  end;

  // 07/25/2013 Changed the following.  If a failure occurs, it is because
  // the response code could not be determined from the data.  That can
  // happen if the response data is corrupted, or if there is a problem on
  // their (TSYS) end such as the server being down.  If a timeout occurs,
  // it will be classified as WARN, when it really is a failure.
  if Response.StatusClass in [rcNone, rcError, rcWarning, rcSecurity] then
  begin
    if CompareText(AValue, 'WARN') = 0 then
      Response.StatusClass := rcWarning
    else if CompareText(AValue, 'VALIDATE') = 0 then
      Response.StatusClass := rcError
    else if CompareText(AValue, 'FATAL') = 0 then
      Response.StatusClass := rcFailure;
  end;
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Host_Ref_Number');
  Response.AddReturnValue('Host_Ref_Number', AValue);
  // Transaction ID
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Status\Reference_Number');
  Response.AddReturnValue('Reference_Number', AValue);
  Response.TransactionID := ShortString(AValue);
  // Response.ReferenceNumber := Response.TransactionID;
  // Approval code
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Approval_Code');
  Response.ApprovalCode := ShortString(AValue);
  Response.AddReturnValue('Approval_Code', Response.ApprovalCode);
  // This field contains a code indicating the source of authorization code
  // Note: Only for authorization transactions
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Auth_Src_Code');
  Response.AddReturnValue('Auth_Src_Code', AValue);

  // From the documentation:
  // "This one-character field contains the Address Verification Result Code.
  // An Address Verification Result Code can provide additional information
  // concerning the authentication of a particular transaction for which
  // cardholder Address Verification was requested."
  // Note:  we only need to set the AVS code for the rest of the
  // AVS properties to popuplate.
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Addr_Vrfy_Code');
  Response.AVSCode := ShortString(AValue);
  // CVV Response Code
  // From the documentaition:
  //  "This one-character field contains the CVV2 Verification Result Code."
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Cvv2_Vrfy_Code');
  Response.SecurityResultCode := ShortString(AValue);
  // Processor code
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Processor_Term');
  Response.ProcessorCode := ShortString(AValue);
  // Response merchant id
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Proc_Merchant_Id');
  Response.AddReturnValue('Proc_Merchant_Id', AValue);
  // Validation code
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Validation_Code');
  Response.AddReturnValue('Validation_Code', AValue);
  // Commercial card
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Commercial_Card');
  Response.AddReturnValue('Commercial_Card', AValue);
  // Visa card level
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Visa_Card_Level');
  Response.AddReturnValue('Visa_Card_Level', AValue);
  // External transaction id
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\External_Transaction_ID');
  Response.AddReturnValue('External_Transaction_ID', AValue);
  // Settlement date
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Settlement_Date');
  Response.AddReturnValue('Settlement_Date', AValue);
  // Sequence
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Sequence_Number');
  Response.AddReturnValue('Sequence_Number', AValue);
  // Transaction code
  AValue := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\Transaction_Code');
  Response.AddReturnValue('Transaction_Code', AValue);

  Response.TimeStamp := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'InfoNox_Interface\TransNox_API_Interface\CardRS\Transaction_Response_Info\External_Local_TimeStamp');

  // 06/18/2014 Allow retry if not approved
  FRetry := not Response.Approved;
end;

procedure TEPaymentTSYS.ProcessResponseStatusCode(const AResponse: ShortString;
  var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
begin
  if (ProcessingClass in [pclLevel3]) then
    cc_tsys_utils.GetResponseText(AResponse, AResponseClass)
  else
  begin
    if CompareText(AResponse, 'PASS') = 0 then
      Response.StatusClass := rcSuccess
    else if CompareText(AResponse, 'FAIL') = 0 then
      Response.StatusClass := rcFailure
    else
      Response.StatusClass := rcError;
  end;

  ACode := Response.StatusCode;
  ADescription := Response.StatusDescription;
end;

function TEPaymentTSYS.ToDateTime(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd hh:mm:ss', AValue);
end;

function TEPaymentTSYS.ToDate(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('mm/dd/yyyy', AValue);
end;

function TEPaymentTSYS.GenerateTransactionKey(var AErrorText: string): Boolean;
begin
  AErrorText := '';
  // Generate a transaction key.  This method is unique to TSYS.
  // It is used to generate a transaction key, which is stored with
  // the merchant account information.
  ValidateSetting(MerchantID, 'Merchant ID');
  ValidateSetting(MerchantDeviceID, 'Merchant Device ID');
  ValidateSetting(MerchantOperator, 'Merchant Operator');
  ValidateSetting(MerchantPassword, 'Merchant Password');

  // FCommand.Add('<?xml version="1.0"?>');
  FGeneratingTransactionKey := True;
  try
    FCommand.Add('<GenerateKey>');
    FCommand.Add(Format('<mid>%s</mid>', [MerchantID]));
    FCommand.Add(Format('<userID>%s</userID>', [MerchantOperator]));
    FCommand.Add(Format('<password>%s</password>', [MerchantPassword]));
    FCommand.Add(Format('<developerID>%s</developerID>', [TSYS_DEVELOPER_ID]));

    // 07/30/2014 Transaction key.  This is provided only if the existing
    // key needs to be changed.
    // if MerchantTransactionKey > '' then
    // FCommand.Add(Format('<transactionKey>%s</transactionKey>',
    // [MerchantTransactionKey]));

    FCommand.Add('</GenerateKey>');

    Result := ExecuteCommand(FCommand.Command) and
      (Response.StatusClass = rcSuccess) and not MerchantTransactionKey.IsEmpty;

    if not Result then
      AErrorText := Response.ErrorText;

  finally
    FCommand.Clear;
    FGeneratingTransactionKey := False;
  end;
end;

{$ENDREGION 'TEPaymentTSYS'}

{$REGION 'TEPaymentSterling'}
{ TEPaymentSterling }

constructor TEPaymentSterling.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBatchCount := 0;
  FBatchStatus := '';
  FBatchID := '';
  CreditCard.NumericsOnly := [cnoPostalCode, cnoTelephone];
  FCountryCodeFormat := cctDigit3;
  HttpContentType := ctHTMLForm;
  FGateway := cgwSterling;
end;

procedure TEPaymentSterling.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantStoreID, 'Merchant Store ID');
  ValidateSetting(MerchantSecurityCode, 'Merchant Security Code');
  ValidateSetting(MerchantID, 'Merchant Number');
  ValidateSetting(MerchantTerminalID, 'Merchant Bank ID');
end;

procedure TEPaymentSterling.BuildCommand(const ATransactionType
  : TTransactionType);
begin
  FTransactionType := ATransactionType;
  // Header
  BuildCommand_Header;
  // Basic information
  // TTransactionType = (ttSale, ttAuthOnly, ttCapture, ttCredit, ttVoid, ttForce,
  // ttAVSOnly);
  case ATransactionType of
    ttSale:
      begin
        AddFieldA('TxType', 'Sale');
      end;
    ttAuthOnly:
      begin
        AddFieldA('TxType', 'Auth');
      end;
    ttCapture:
      begin
        AddFieldA('TxType', 'Settle');
      end;
    ttCredit:
      begin
        if ReversalData.IsPreSettlement and ReversalData.IsPartial then
          AddFieldA('TxType', 'PartialAuthReversal')
        else if ReversalData.IsPreSettlement then
          AddFieldA('TxType', 'AuthReversal')
        else
          AddFieldA('TxType', 'Credit');
      end;
    ttVoid:
      begin
        // Sale and AuthOnly require AuthReversal
        if ReversalData.IsPreSettlement then
          AddFieldA('TxType', 'AuthReversal')
        else
          // Credit (Refund), ForceSettle (Prior Sale), and
          // Settle (Force Capture) all require full Void
          AddFieldA('TxType', 'Void');
      end;
    ttForce:
      begin
        AddFieldA('TxType', 'ForceSettle');
      end;
    ttAVSOnly:
      begin
        AddFieldA('TxType', 'CardStatusCheck');
      end;
  end;
  if ATransactionType = ttAVSOnly then
    AddFieldA('TxAmount', FormatFloatValue(0.00))
  else
    AddFieldA('TxAmount', FormatFloatValue(TransactionAmount));
  // Voice authorization code (required)
  if ATransactionType = ttForce then
    AddFieldA('ApprovalCode', FForceVoiceAuthCode);
  AddFieldA('UserId', SecurityManager.UserName);
  if ATransactionType <> ttAVSOnly then
    AddFieldA('OrderId', TransactionID);
  // Payment method
  if (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttForce, ttAVSOnly])
  then
    BuildCommand_PaymentInfo;
  // Customer Order Information
  BuildCommand_CustomerOrderInfo(ATransactionType);
  if (ATransactionType in [ttSale, ttAuthOnly, ttForce]) then
    BuildCommand_ItemDetails;
end;

procedure TEPaymentSterling.BuildCommand_Header;
begin
  // Header
  FCommand.Clear;
  AddFieldA('StoreId', MerchantStoreID);
  AddFieldA('MID', MerchantID);
  AddFieldA('TID', MerchantTerminalID);
  AddFieldA('SecurityCode', MerchantSecurityCode);
  AddFieldA('IntName', STERLING_SOFTWARE_NAME);
  AddFieldA('IntVersion', STERLING_SOFTWARE_VERSION);
  AddFieldA('Version', STERLING_API_VERSION);
  if (TransactionMethod = tmCardPresent) then
    AddFieldA('IndustryType', 'RETAIL')
  else if (TransactionMethod = tmInternet) then
    AddFieldA('IndustryType', 'ECOM')
  else
    AddFieldA('IndustryType', 'MOTO');
end;

procedure TEPaymentSterling.BuildCommand_PaymentInfo;
begin
  // Payment method
  if CreditCard.IsToken then
  begin
    // Merchant Card Vault ID – Customer Vault Information (20, AN)
    AddFieldA('MCardVaultId', CreditCard.CardNumber);
    // Card Vault ID – Customer Vault Information (10, N)
    AddFieldA('CardVaultId', CreditCard.CardNumber);
  end
  else
  begin
    AddFieldA('CardNumber', CreditCard.CardNumber);
    AddFieldA('ExpDate', Format('%s/%s', [CreditCard.ExpireMonthAsStr,
      CreditCard.ExpireYearAsStr]));
    AddFieldA('CVD', CreditCard.SecurityCode);
    { [ 0 ] Not provided or deliberately bypassed
      [ 1 ] Value on card is illegible
      [ 2 ] Cardholder stated data NOT available }
    if CreditCard.SecurityCode.IsEmpty then
      AddFieldA('CVDPresenceCode', '0');
    // Transaction Information
  end;
  AddFieldA('CPFlag', 'N');
  AddFieldA('POSCode', '1');
  AddFieldA('PartialAuthIndicator', 'N');
end;

procedure TEPaymentSterling.BuildCommand_CustomerOrderInfo(ATransactionType
  : TTransactionType);
var
  AValue: string;
  AFieldLength: Integer;
begin
  if not (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttForce, ttAVSOnly])
  then
    Exit;
  // Customer Order Information
  AddFieldA('CustOrderId', SalesOrderNumber);

  AValue := System.SysUtils.StringReplace(TransactionDescription, ',', ' ',
    [rfIgnoreCase, rfReplaceAll]);
  AValue := System.SysUtils.StringReplace(AValue, '  ', ' ',
    [rfIgnoreCase, rfReplaceAll]);
  AddFieldA('OrderDesc', IQMS.Common.StringUtils.AlphaNumeric(AValue));

  AddFieldA('FirstName', CreditCard.CustomerFirstName, 20);
  AddFieldA('LastName', CreditCard.CustomerLastName, 20);
  AddFieldA('BusinessName', CreditCard.CustomerCompany, 20);
  AddFieldA('Address', CreditCard.CustomerAddress, 50);
  AddFieldA('City', CreditCard.CustomerCity, 30);
  AddFieldA('State', CreditCard.CustomerState, 20);
  AddFieldA('Zip', CreditCard.CustomerPostalCode, 9);
  AddFieldA('Phone', CreditCard.CustomerTelephone, 12);

  if (TransactionMethod in [tmCardPresent]) then
    AFieldLength := 6 // 'RETAIL'
  else if (TransactionMethod = tmInternet) then
    AFieldLength := 16 // 'ECOM'
  else
    AFieldLength := 9; // 'MOTO'

  // Industry Information
  if (ATransactionType = ttAVSOnly) then
    // hard-coded to 1
    AddFieldA('InvoiceNumber', '1')
  else if not InvoiceNumber.IsEmpty then
    AddFieldA('InvoiceNumber', InvoiceNumber, AFieldLength)
  else if not SalesOrderNumber.IsEmpty then
    AddFieldA('InvoiceNumber', SalesOrderNumber, AFieldLength)
  else
    AddFieldA('InvoiceNumber', TransactionID, AFieldLength);
end;

procedure TEPaymentSterling.BuildCommand_ItemDetails;
var
  i: Integer;
  AValue: string;
begin
  // Item details
  if not (ProcessingClass in [pclLevel2, pclLevel3]) then
    Exit;
  // Purchase Level II Information
  AddFieldA('L2CustRefNum', PurchaseOrderNumber, 17);
  // [ 0 ] Tax Not Provided
  // [ 1 ] Tax Included
  // [ 2 ] Non-Taxable (tax exempt)
  if TaxExempt then
  begin
    AddFieldA('L2TaxFlag', '2');
    AddFieldA('L2TaxAmount', '0.00');
  end
  else if TaxAmount > 0 then
  begin
    AddFieldA('L2TaxFlag', '1');
    AddFieldA('L2TaxAmount', FormatFloatValue(TaxAmount));
  end
  else
  begin
    AddFieldA('L2TaxFlag', '0');
    AddFieldA('L2TaxAmount', '0.00');
  end;
  AddFieldA('L2DestZip', Destination.PostalCode, 9);
  // Processing class indicator
  if CanProcessLevel3 then
    AddFieldA('PCL3On', 'Y')
  else if (ProcessingClass = pclLevel2) then
    AddFieldA('PCL3On', 'N');
  if CanProcessLevel3 then
  begin
    AddFieldA('FreightIndicator', IQMS.Common.Numbers.sIIf(FreightAmount > 0,
      'Y', 'N'));
    AddFieldA('FreightAmt', FormatFloatValue(FreightAmount));
    AddFieldA('DutyIndicator', IQMS.Common.Numbers.sIIf(Level3Options.DutyAmount > 0,
      'Y', 'N'));
    AddFieldA('DutyAmt', FormatFloatValue(Level3Options.DutyAmount));
    AddFieldA('OriginZip', Sender.PostalCode);
    AddFieldA('DestCountryCode', DestinationCountryCode);
    AddFieldA('LIDCount', IntToStr(Level3Options.Itemization.Count));
    // See "7.1.4. Parameters for Level III – Line Item Detail Transactions"
    // on page 135 of the documentation.
    for i := 0 to Level3Options.Itemization.Count - 1 do
    begin
      // Item #
      AValue := IQMS.Common.StringUtils.AlphaNumeric(Level3Options.Itemization.Items[i]
        .ItemNumber);
      AddFieldA(Format('ProdCode_%d', [i + 1]), AValue, 12);
      // Item Description
      AValue := UpperCase(IQMS.Common.StringUtils.AlphaNumeric(Level3Options.Itemization.Items
        [i].ItemDescription));
      AddFieldA(Format('Desc_%d', [i + 1]), AValue, 35);
      // UOM - this gets a little weird because Sterling has a list of
      // expected values, and only those values will work.
      AValue := UpperCase(Level3Options.Itemization.Items[i].UOM);
      if AValue.IsEmpty then
        AValue := 'NPT';
      AddFieldA(Format('UOM_%d', [i + 1]), AValue, 3);
      // Unit cost
      AddFieldA(Format('UCost_%d', [i + 1]),
        FormatFloatValue(Level3Options.Itemization.Items[i].Price));
      // Commodity code
      AValue := UpperCase(Level3Options.Itemization.Items[i].CommodityCode);
      AddFieldA(Format('CmdtyCode_%d', [i + 1]), AValue, 12);
      // Quantity
      AddFieldA(Format('Qty_%d', [i + 1]),
        FormatFloatValue(Level3Options.Itemization.Items[i].Quantity));
      // Debit Indicator Line Item
      // C Item extended amount is a credit or taking away from the
      // total amount of the sale, such as when a coupon or discount
      // was applied or a return issued
      // D Item extended amount is a debit or adding to the total
      // amount of the sale
      AddFieldA(Format('DCIndicator_%d', [i + 1]), 'D');
      // Gross Net Indicator -
      // Indicates whether tax amount is included in the item amount.
      AddFieldA(Format('GNIndicator_%d', [i + 1]), 'Y');
      // Extended Amount -
      // The field must equal the Unit Cost (UCost_n) multiplied by the
      // quantity (Qty_n) less any discounts (DiscAmt_n). If the fields
      // are not equal, an error will be received.
      AddFieldA(Format('ExtendedAmt_%d', [i + 1]),
        FormatFloatValue(Level3Options.Itemization.Items[i].TotalAmount));
      // Discount Amount for line item
      AddFieldA(Format('DiscAmt_%d', [i + 1]),
        FormatFloatValue(Level3Options.Itemization.Items[i].Discount));
      // Tax Amount
      AddFieldA(Format('TaxAmt_%d', [i + 1]),
        FormatFloatValue(Level3Options.Itemization.Items[i].Tax));
    end;
  end;
end;

function TEPaymentSterling.Authorize: Boolean;
begin
  // Invoice number is required
  ValidateSetting(InvoiceNumber, 'Invoice Number');
  Result := inherited Authorize;
end;

function TEPaymentSterling.CloseBatch: Boolean;
begin
  BuildCommand_Header;
  AddFieldA('OpType', 'CloseBatch');
  Result := ExecuteCommand(FCommand.Command);
end;

function TEPaymentSterling.Sale: Boolean;
begin
  // Invoice number is required
  ValidateSetting(InvoiceNumber, 'Invoice Number');
  Result := inherited Sale;
end;

procedure TEPaymentSterling.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0; // 443;
  if TestMode then
    AURL := 'https://a.gateway.cert.sptapi.com/spapi/SPAPIServlet'
    // Also: https://b.gateway.cert.sptapi.com/spapi/SPAPIServlet
  else
    AURL := 'https://gateway.sptapi.com/spapi/SPAPIServlet';
end;

procedure TEPaymentSterling.ParseResponseText;
var
  AElements: TStringList;
  ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
  AValue: string;
  ABatchCommand: Boolean;
begin
  ABatchCommand := False;
  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    IQMS.Common.StringUtils.Tokenize(Response.ResponseData, ['&'], AElements);
    Response.ReturnValues.AddStrings(AElements);
    if AElements.IndexOfName('OPStatus') > - 1 then
    begin
      FBatchStatus := Trim(AElements.Values['OPStatus']);
      FBatchID := ShortString(Trim(AElements.Values['BatchID']));
      AValue := Trim(AElements.Values['TxCount']);
      System.SysUtils.TryStrToInt(AValue, FBatchCount);
      AValue := FBatchStatus;
      ABatchCommand := True;
    end
    else
      AValue := Trim(AElements.Values['TxStatus']);
    if not AValue.IsEmpty then
    begin
      Response.ReturnCode := ShortString(AValue[1]);
      ProcessResponseStatusCode(Response.ReturnCode, { var } ACode,
        ADescription, AResponseClass);
      Response.StatusClass := AResponseClass;
      Response.StatusCode := ACode;
      Response.StatusDescription := ADescription;
    end;
    if ABatchCommand then
      Response.TransactionID := FBatchID
    else
      Response.TransactionID := ShortString(Trim(AElements.Values['OrderId']));
    // Response.ReferenceNumber := Response.TransactionID;
    Response.ApprovalCode :=
      ShortString(Trim(AElements.Values['ApprovalCode']));
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.ErrorCode := ShortString(Trim(AElements.Values['ErrorCode']));
    Response.ErrorDescription := Trim(AElements.Values['ErrorMsg']);
    Response.ErrorText := Format('%s: %s',
      [Response.ErrorCode, Response.ErrorDescription]);
    Response.AVSCode := ShortString(Trim(AElements.Values['AVSRsponse']));
    Response.SecurityResultCode :=
      ShortString(Trim(AElements.Values['CVDResponse']));
    Response.ProcessorCode := '';
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;

  // 06/18/2014 Allow retry if not approved
  FRetry := not Response.Approved;
end;

procedure TEPaymentSterling.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
begin
  ACode := '';
  ADescription := '';
  AResponseClass := TResponseClass(0);
  if AResponse = '0' then
  begin
    AResponseClass := rcSuccess;
    ACode := AResponse;
    ADescription := 'Approved [Code: 0].';
  end
  else if AResponse = '1' then
  begin
    AResponseClass := rcFailure;
    ACode := AResponse;
    ADescription := 'Failed [Code: 1].';
  end
  else if AResponse = '2' then
  begin
    AResponseClass := rcError;
    ACode := AResponse;
    ADescription := 'Error  [Code: 2].';
  end
  else if AResponse = '3' then
  begin
    AResponseClass := rcWarning; { rcSecurity }
    ACode := AResponse;
    ADescription := 'Referral [Code: 3].';
  end;
end;

{$ENDREGION 'TEPaymentSterling'}

{$REGION 'TEPaymentMES'}
{ TEPaymentMES }

constructor TEPaymentMES.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctHTMLForm;
  // CreditCard.NumericsOnly := [cnoPostalCode, cnoTelephone];
  FCountryCodeFormat := cctDigit3;
  FGateway := cgwMerchantESolutions;
end;

procedure TEPaymentMES.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantProfileID, 'Profile ID');
  ValidateSetting(MerchantProfileKey, 'Profile Key');
end;

procedure TEPaymentMES.BuildCommand(const ATransactionType: TTransactionType);
begin
  FTransactionType := ATransactionType;
  // Header
  BuildCommand_Header;
  case ATransactionType of
    ttSale:
      AddFieldA('transaction_type', 'D');
    ttAuthOnly:
      AddFieldA('transaction_type', 'P');
    ttCapture:
      AddFieldA('transaction_type', 'S');
    ttCredit:
      AddFieldA('transaction_type', 'U');
    ttVoid:
      AddFieldA('transaction_type', 'V');
    ttForce:
      AddFieldA('transaction_type', 'O');
    ttAVSOnly:
      AddFieldA('transaction_type', 'A');
  end;
  // Card
  if CanSendCardData(ATransactionType) then
  begin
    AddFieldA('card_number', CreditCard.CardNumber);
    AddFieldA('card_exp_date', CreditCard.ExpireMonthAsStr +
      CreditCard.ExpireYearAsStr);
    if not CreditCard.SecurityCode.IsEmpty then
      AddFieldA('cvv2', CreditCard.SecurityCode);
    AddFieldA('cardholder_first_name', CreditCard.CustomerFirstName, 15);
    AddFieldA('cardholder_last_name', CreditCard.CustomerLastName, 30);
    if not CreditCard.CustomerAddress.IsEmpty then
      AddFieldA('cardholder_street_address', CreditCard.CustomerAddress, 19);
    if not CreditCard.CustomerAddress.IsEmpty then
      AddFieldA('cardholder_zip', CreditCard.CustomerPostalCode, 9);
  end;
  if (ATransactionType = ttAVSOnly) then
    AddFieldA('transaction_amount', FormatFloatValue(0.00))
  else
    AddFieldA('transaction_amount', FormatFloatValue(TransactionAmount));
  AddFieldA('transaction_id', TransactionID);
  if (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttForce, ttCapture])
  then
  begin
    if not InvoiceNumber.IsEmpty then
      AddFieldA('invoice_number', InvoiceNumber);
  end;
  if (ATransactionType in [ttSale, ttAuthOnly, ttForce]) then
  begin
    // 1=One Time Mail/Telephone Order Transaction.
    // 7 =e-Commerce Transaction.
    if (TransactionMethod = tmCardPresent) then
      AddFieldA('moto_ecommerce_ind', 'Z')
    else if (TransactionMethod in [tmTelephone, tmMail]) then
      AddFieldA('moto_ecommerce_ind', '1')
    else if (TransactionMethod = tmInternet) then
      AddFieldA('moto_ecommerce_ind', '7');
    AddFieldA('Client_reference_number', TransactionID);
    AddFieldA('tax_amount', FormatFloatValue(TaxAmount));
    AddFieldA('ship_to_zip', Destination.PostalCode);
    // 3-digit numeric country code
    AddFieldA('dest_country_code', DestinationCountryCode);
    // 3-digit numeric currency code
    if not FMerchantCurrencyCode.IsEmpty then
      AddFieldA('currency_code', FMerchantCurrencyCode);
  end;
  if (ATransactionType = ttForce) and not FForceVoiceAuthCode.IsEmpty then
    AddFieldA('auth_code', FForceVoiceAuthCode);
  // Level II and Level III itemization
  // And yes, we have to do this for settlements also
  if (ATransactionType in [ttSale, ttCapture, ttForce]) then
    BuildCommand_ItemDetails;
end;

procedure TEPaymentMES.BuildCommand_Header;
begin
  FCommand.Clear;
  AddFieldA('profile_id', MerchantProfileID);
  AddFieldA('profile_key', MerchantProfileKey);
end;

procedure TEPaymentMES.BuildCommand_ItemDetails;
var
  i, AItemCount, AAmExRemain, AAmExActual: Integer;
  AItemText: string;
begin
  // Item details
  if CanProcessLevel3 then
    try
      AddFieldA('line_item_count', IntToStr(Level3Options.Itemization.Count));
      if (CreditCard.CardType = ccAmex) then
        AddFieldA('requester_name', CreditCard.CustomerFullName);
      AddFieldA('merchant_tax_id', Level3Options.MerchantTaxID);
      AddFieldA('customer_tax_id', Level3Options.CustomerTaxID);
      AddFieldA('summary_commodity_code', Level3Options.CommodityCode);
      AddFieldA('discount_amount',
        FormatFloatValue(Level3Options.DiscountAmount));
      AddFieldA('shipping_amount', FormatFloatValue(FreightAmount));
      AddFieldA('duty_amount', FormatFloatValue(Level3Options.DutyAmount));
      AddFieldA('ship_to_zip', Destination.PostalCode);
      AddFieldA('ship_from_zip', Sender.PostalCode);
      AddFieldA('dest_country_code', DestinationCountryCode);
      AddFieldA('vat_invoice_number', InvoiceNumber);
      AddFieldA('order_date', FormatDateTime('YYMMDD', SalesOrderDate));
      AddFieldA('vat_amount', FormatFloatValue(Level3Options.LocalTaxAmount));
      AddFieldA('alt_tax_amount',
        FormatFloatValue(Level3Options.NationalTaxAmount));
      // "If Y indicate tax amount, if N fill tax amount with all zeros"
      if Level3Options.NationalTaxAmount = 0 then
        AddFieldA('alt_tax_amount_indicator', 'N')
      else
        AddFieldA('alt_tax_amount_indicator', 'Y');
      // The itemization is different for each card type.
      // Each line is a concatenated string, with each element
      // "by position".
      // Note:  Enforce a maximum line item count of 999.
      AItemCount := System.Math.Min(Level3Options.Itemization.Count, 999);
      with Level3Options.Itemization do
        for i := 0 to AItemCount - 1 do
        begin
          case CreditCard.CardType of
            ccVisa:
              { Item Commodity Code (12)
                Item Descriptor (35)
                Product Code (12)
                Quantity (12)
                Unit Of Measure (12)
                Unit Cost (12)
                Vat Tax Amount (12)
                Vat Tax Rate (4)
                Discount Per Line Item (12)
                Line Item Total (12)
                Debit Or Credit Indicator (D or C) }
              AItemText := Format('visa_line_item=%s<|>%s<|>%s<|>%s<|>%s' +
                '<|>%s<|>%s<|>%s<|>%s<|>%s<|>D',
                [AnsiStrings.LeftStr(Items[i].CommodityCode, 12),
                AnsiStrings.LeftStr(Items[i].ItemDescription, 35),
                AnsiStrings.LeftStr(Items[i].ItemNumber, 12),
                FormatFloatValue(Items[i].Quantity),
                AnsiStrings.LeftStr(Items[i].UOM, 12),
                FormatFloatValue(Items[i].Price),
                FormatFloatValue(Items[i].Tax),
                FormatTaxRateValue(Items[i].TaxRate),
                FormatFloatValue(Items[i].Discount),
                FormatFloatValue(Items[i].TotalAmount)]);
            ccMasterCard:
              { Item Description (35)
                Product Code (12)
                Item Quantity (12)
                Item Unit Of Measure (12)
                Alternate Tax Identifier (15)
                Tax Rate Applied (4)
                Tax Type Applied (4)
                Tax Amount (12)
                Discount Indicator (Y/N)
                Net Or Gross Indicator (G/N)
                Extended Item Amount (9)
                Debit Or Credit Indicator (D/C)
                Discount Amount (12)
              }
              AItemText := Format('mc_line_item=%s<|>%s<|>%s<|>%s<|>' +
                '000000000000000<|>%s<|><|>%s<|>%s<|>G<|>%s<|>D<|>%s',
                [AnsiStrings.LeftStr(Items[i].ItemDescription, 35),
                AnsiStrings.LeftStr(Items[i].ItemNumber, 12),
                FormatFloatValue(Items[i].Quantity),
                AnsiStrings.LeftStr(Items[i].UOM, 12),
                FormatTaxRateValue(Items[i].TaxRate),
                FormatFloatValue(Items[i].Tax),
                IQMS.Common.Numbers.sIIf(Items[i].Discount > 0, 'Y', 'N'),
                FormatFloatValue(Items[i].TotalAmount),
                FormatFloatValue(Items[i].Discount)]);
            ccAmex:
              begin
                { Because of an size limitation set by AmEx, they can
                  only handle quantity values 3 digits long. So, we
                  have to check, and split up the line up if necessary
                  inside of a loop.  This way no line item has a
                  quantity > 999. }
                // Initalize to full amount
                AAmExRemain := Trunc(Items[i].Quantity);
                repeat
                  // Get the value of 999 or less
                  AAmExActual := System.Math.Min(999, AAmExRemain);
                  { Item Description (40),
                    Item Quantity (3),
                    Item Price (12) }
                  AItemText := Format('amex_line_item=%s<|>%s<|>%s',
                    [AnsiStrings.LeftStr(Items[i].ItemDescription, 40),
                    FormatFloatValue(AAmExActual),
                    FormatFloatValue(Items[i].Price)]);
                  AAmExRemain := AAmExRemain - AAmExActual;
                until AAmExRemain <= 0;
              end;
          end; // end case
          FCommand.Add(AItemText);
        end; // end for loop
    except
      on E: Exception do
        raise Exception.Create
          ('Encountered error building Level 3 itemization:'#13 + E.Message);
    end;
end;

function TEPaymentMES.FormatFloatValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  Result := FormatFloat('###00.00', AValue, AFormatSettings);
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentMES.FormatTaxRateValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := #0;
  Result := FormatFloat('##0.0', AValue, AFormatSettings);
{$WARN SYMBOL_PLATFORM ON}
end;

procedure TEPaymentMES.GetURL(var AURL: string; var APort: Integer);
begin
  // Port is always zero
  APort := 0;
  if TestMode then
    AURL := 'https://cert.merchante-solutions.com/mes-api/tridentApi'
  else
    AURL := 'https://api.merchante-solutions.com/mes-api/tridentApi';
end;

procedure TEPaymentMES.ParseResponseText;
var
  AElements: TStringList;
begin
  if Response.ResponseData.IsEmpty then
    Exit;
  AElements := TStringList.Create;
  try
    IQMS.Common.StringUtils.Tokenize(Response.ResponseData, ['&'], AElements);
    Response.ReturnValues.AddStrings(AElements);
    Response.TransactionID :=
      ShortString(Trim(AElements.Values['transaction_id']));
    // Response.ReferenceNumber := Response.TransactionID;
    Response.ErrorCode := ShortString(Trim(AElements.Values['error_code']));
    Response.ApprovalCode := ShortString(Trim(AElements.Values['Auth_code']));
    Response.ReturnCode := Response.ApprovalCode;
    Response.StatusCode := Response.ApprovalCode;
    Response.StatusDescription := Trim(AElements.Values['auth_response_text']);
    Response.AVSCode := ShortString(Trim(AElements.Values['avs_result']));
    Response.SecurityResultCode :=
      ShortString(Trim(AElements.Values['cvv2_result']));
    Response.ProcessorCode := '';
    // Is this an error condition? Anything other than '000', is a problem.
    if (CompareText(Response.ErrorCode, '000') <> 0) then
    begin
      Response.StatusClass := rcError;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
    end
    else if (CompareText(Response.ErrorCode, '000') = 0) or
      not Response.ApprovalCode.IsEmpty then
      Response.StatusClass := rcSuccess
    else
      Response.StatusClass := rcFailure;
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;

  // 06/18/2014 Allow retry if not approved
  FRetry := not Response.Approved;
end;

procedure TEPaymentMES.ProcessResponseStatusCode(const AResponse: ShortString;
  var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
begin
  ACode := '';
  ADescription := '';
  AResponseClass := TResponseClass(0);
  if AResponse = '000' then
    AResponseClass := rcSuccess
  else if (CreditCard.CardType in [ccVisa, ccAmex, ccDiscover]) then
    GetResponseStatusVisa(AResponse, AResponseClass)
  else if (CreditCard.CardType in [ccMasterCard]) then
    GetResponseStatusMasterCard(AResponse, AResponseClass);
  // Return code and description
  ACode := AResponse;
  ADescription := ResponseClassDescription[AResponseClass];
end;

{$ENDREGION 'TEPaymentMES'}

{$REGION 'TEPaymentAuthorizeNet'}
{ TEPaymentAuthorizeNet }

constructor TEPaymentAuthorizeNet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctXML;
  // CreditCard.NumericsOnly := [cnoPostalCode, cnoTelephone];
  FCountryCodeFormat := cctDigit3;
  FGateway := cgwAuthorizeNet;
end;

procedure TEPaymentAuthorizeNet.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://test.authorize.net/gateway/transact.dll'
  else
    AURL := 'https://secure2.authorize.net/gateway/transact.dll';
    // 03/17/2016 old AURL := 'https://secure.authorize.net/gateway/transact.dll';
end;

procedure TEPaymentAuthorizeNet.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantID, 'Merchant Number');
  ValidateSetting(MerchantTransKey, 'Merchant Transaction Key');
  // Note:  The merchant hash key is not required.  It may be provided,
  // depending on the account settings, but that's not our concern.
end;

procedure TEPaymentAuthorizeNet.BuildCommand(const ATransactionType
  : TTransactionType);
var
  IPAddress: string;
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;
  AddFieldA('x_login', FMerchantID);
  AddFieldA('x_tran_key', FMerchantTransKey);
  AddFieldA('x_version', '3.1');
  // FMerchantHashValue: string;
  case ATransactionType of
    ttSale:
      AddFieldA('x_type', 'AUTH_CAPTURE');
    ttAuthOnly:
      AddFieldA('x_type', 'AUTH_ONLY');
    ttCapture:
      AddFieldA('x_type', 'PRIOR_AUTH_CAPTURE');
    ttCredit:
      AddFieldA('x_type', 'CREDIT');
    ttVoid:
      AddFieldA('x_type', 'VOID');
    ttForce:
      AddFieldA('x_type', 'CAPTURE_ONLY');
    ttAVSOnly:
      AddFieldA('x_type', 'AUTH_ONLY');
  end;
  // For an AVS check, pass a zero amount.
  // Note: Not all processors accept zero dollar amount.
  if (ATransactionType = ttAVSOnly) then
    AddFieldA('x_amount', '0.00')
  else
    // This is the total amount and must include tax, shipping, and any
    // other charges.
    AddFieldA('x_amount', FormatFloatValue(TransactionAmount));

  // If we can send card information with this transaction type,
  // then populate the credit card fields
  if CanSendCardData(ATransactionType) then
  begin
    AddFieldA('x_card_num', CreditCard.CardNumber);
    AddFieldA('x_exp_date', CreditCard.ExpirationMMYY);
    if not CreditCard.SecurityCode.IsEmpty then
      AddFieldA('x_card_code', CreditCard.SecurityCode);
  end;

  // The payment gateway-assigned transaction ID of an original transaction.
  // Note:  Required only for CREDIT, PRIOR_AUTH_CAPTURE, and VOID
  // transactions. Do not include this field if you are providing the
  // x_split_tender_id field.
  if (ATransactionType in [ttCredit, ttCapture, ttVoid]) then
    AddFieldA('x_trans_id', TransactionID);
  // The authorization code of an original transaction
  // not authorized on the payment gateway.  6 characters.
  if (ATransactionType = ttForce) then
    AddFieldA('x_auth_code', FForceVoiceAuthCode, 6);
  // SIM applications use relay response. Set this to false if you are
  // using AIM.
  AddFieldA('x_relay_response', 'FALSE');
  // Indicates whether a delimited transaction response is required
  // A value of TRUE indicates a request for delimited response from
  // the payment gateway. Since all AIM transactions are direct response, a
  // value of TRUE is required.
  // Submit this field for each transaction to be sure that transaction
  // responses are returned in the correct format.
  AddFieldA('x_delim_data', 'TRUE');
  AddFieldA('x_delim_char', ',');
  AddFieldA('x_encap_char', '"');

  // Note:
  // When using GPN Canada or WorldPay Streamline Processor, additional
  // "Customer Information" fields are required.  But at this time,
  // we don't use either one of these.

  // Bill To address (x_address) and zip code (x_zip) are required in
  // order to perform the AVS check.
  if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly]) then
  begin
    AddFieldA('x_cust_id', CreditCard.CustomerId);
    AddFieldA('x_company', CreditCard.CustomerCompany);
    AddFieldA('x_address', CreditCard.CustomerAddress);
    AddFieldA('x_city', CreditCard.CustomerCity);
    AddFieldA('x_state', CreditCard.CustomerState);
    AddFieldA('x_zip', CreditCard.CustomerPostalCode);
    AddFieldA('x_country', CreditCard.CustomerCountry);
    AddFieldA('x_phone', CreditCard.CustomerTelephone);
    AddFieldA('x_fax', CreditCard.CustomerFax);
    AddFieldA('x_email', CreditCard.CustomerEmail);
    if IQMS.Common.SysInfo.GetIPAddress(IPAddress) then
      AddFieldA('x_customer_ip', IPAddress);
    AddFieldA('x_first_name', CreditCard.CustomerFirstName);
    AddFieldA('x_last_name', CreditCard.CustomerLastName);

    AddFieldA('x_ship_to_first_name', CreditCard.CustomerFirstName);
    AddFieldA('x_ship_to_last_name', CreditCard.CustomerLastName);
    AddFieldA('x_ship_to_company', Destination.CompanyName);
    AddFieldA('x_ship_to_address', Destination.Address1);
    AddFieldA('x_ship_to_city', Destination.City);
    AddFieldA('x_ship_to_state', Destination.StateOrRegion);
    AddFieldA('x_ship_to_zip', Destination.PostalCode);
    AddFieldA('x_ship_to_country', Destination.Country);
  end;
  // Currency:
  // Possible values: USD, CAD, or GBP.
  // If this field is not submitted, the default is the currency
  // selected by the merchant’s payment processor. Setting this field
  // to a currency that is not supported by the payment processor will
  // result in an error.
  if (TransactionCurrencyCode = 'CAD') or (TransactionCurrencyCode = 'GBP') then
    AddFieldA('x_currency_code', TransactionCurrencyCode);

  // Test mode
  if TestMode then
    AddFieldA('x_test_request', 'TRUE');
  // Invoice number (optional)
  if not InvoiceNumber.IsEmpty then
    AddFieldA('x_invoice_num', InvoiceNumber, 20);

  // Transaction description (optional)
  if not TransactionDescription.IsEmpty then
    AddFieldA('x_description', TransactionDescription);

  if (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttForce]) then
    BuildCommand_ItemDetails;
  // Tax - basic
  if (TaxAmount > 0) and (ProcessingClass = pclLevel2) then
    AddFieldA('x_tax', FormatFloatValue(TaxAmount));
  if TaxExempt then
    AddFieldA('x_tax_exempt', 'TRUE');
  // Freight
  if (FreightAmount > 0) and (ProcessingClass in [pclLevel2, pclLevel3]) then
    AddFieldA('x_freight', FormatFloatValue(FreightAmount));
  // PO Number
  if not PurchaseOrderNumber.IsEmpty and
    (ProcessingClass in [pclLevel2, pclLevel3]) then
    AddFieldA('x_po_num', PurchaseOrderNumber, 25);
end;

procedure TEPaymentAuthorizeNet.BuildCommand_ItemDetails;
var
  i, AItemCount: Integer;
  AItemText: string;
begin
  // Item details
  if CanProcessLevel3 then
    try
      if (Level3Options.DutyAmount > 0) then
        AddFieldA('x_duty', FormatFloatValue(Level3Options.DutyAmount));
      AddFieldA('x_ship_to_zip', Destination.PostalCode);
      AddFieldA('ship_from_zip', Sender.PostalCode);
      AddFieldA('x_ship_to_country', DestinationCountryCode);
      // Note:  Enforce a maximum line item count of 999.
      AItemCount := System.Math.Min(Level3Options.Itemization.Count, 999);
      with Level3Options.Itemization do
        for i := 0 to AItemCount - 1 do
        begin
          AItemText := Format('x_line_item=item%d<|>%s<|>%s<|>%s<|>%s' +
            '<|>%s', [i + 1, AnsiStrings.LeftStr(Items[i].ItemNumber, 12),
            AnsiStrings.LeftStr(Items[i].ItemDescription, 35),
            FormatFloatValue(Items[i].Quantity),
            FormatFloatValue(Items[i].Price), IQMS.Common.Numbers.sIIf(Items[i].Tax > 0,
            'TRUE', 'FALSE')]);
          FCommand.Add(AItemText);
        end; // end for loop
    except
      on E: Exception do
        raise Exception.Create
          ('Encountered error building Level 3 itemization:'#13 + E.Message);
    end;
end;

function TEPaymentAuthorizeNet.AuthenticateCard: Boolean;
var
  ACardType: TCreditCardType;
  AErroMsg: string;
begin
  // 09/18/2015 (Byron, EIQ-8764) Do not perform an AVS Check.  Just do
  // a simple algorithmic authentication. This is a customer request.
  ACardType := cc_valid.PredictCreditCardType(CreditCard.CardNumber);
  Result := cc_valid.ValidateCreditCardB(CreditCard.CardNumber,
    CreditCard.ExpirationMMYY, ACardType, CreditCard.IsToken, AErroMsg, True);
  // Update the status class, code and description.  This is declared
  // above in the ancestor class.
  UpdateStatusForSimpleVerificationCheck(Result, AErroMsg);
end;

function TEPaymentAuthorizeNet.AVSCheck: Boolean;
begin
  // Unfortunately, when using Authorize.Net, we can only run an
  // AVS check with Visa. Any other card will display an error,
  // something about the amount cannot be zero (0) for this card type.
  // So, we return true by default, since by the time we get here,
  // the base class will already have done a basic card check.
  if CreditCard.CardType <> ccVisa then
    Exit(True);

  Result := inherited AVSCheck;

end;

function TEPaymentAuthorizeNet.CanSendCardData(const ATransactionType
  : TTransactionType): Boolean;
begin
  // Authorize.Net requires card data to be sent with the
  // following transaction types.
  Result := (ATransactionType in [ttSale, ttAuthOnly, ttCredit, ttForce,
    ttAVSOnly]);
end;

function TEPaymentAuthorizeNet.Refund: Boolean;
begin
  // This method evaluates for a partial credit, giving the amount
  // parameters. Important Note:  This only applies to Visa.
  IQAssert(not TransactionID.IsEmpty, 'TransactionID is required.');
  Result := inherited Refund;
end;

function TEPaymentAuthorizeNet.Void: Boolean;
begin
  IQAssert(not TransactionID.IsEmpty, 'TransactionID is required.');
  Result := inherited Void;
end;

procedure TEPaymentAuthorizeNet.ParseResponseText;
var
  AElements: TStringList;
  ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;

  function _get(AIndex: Integer): ShortString;
  begin
    Result := '';
    if (AIndex < AElements.Count) then
      Result := ShortString(Trim(AElements.Strings[AIndex]));
  end;

begin
  AElements := nil;

  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    // Use TokenizeStrict() because we want empty values, if they exist.
    // This by position.
    IQMS.Common.StringUtils.TokenizeStrict(Response.ResponseData, [','], AElements);

    if AElements.Count <= 1 then
      Exit;

    Response.ReturnValues.AddStrings(AElements);
    // Expected values:
    // 1 = Approved
    // 2 = Declined
    // 3 = Error
    // 4 = Held for Review
    Response.ReturnCode := _get(0);
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := _get(2);
    Response.StatusDescription := _get(3);
    if Response.StatusClass = rcError then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
      // Error details
      Response.ErrorDetails := GetInternalError(Response.ErrorCode);
    end;
    Response.ApprovalCode := _get(4);
    Response.AVSCode := _get(5);
    Response.TransactionID := _get(6);
    // Response.ReferenceNumber := Response.TransactionID;
    Response.InvoiceNumber := _get(7);
    Response.TransactionType := _get(11);
    Response.SecurityResultCode := _get(38);

    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.ProcessorCode := '';
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

procedure TEPaymentAuthorizeNet.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
var
  i: Integer;
begin
  ACode := '';
  ADescription := '';
  AResponseClass := rcNone;
  if not IQMS.Common.Numbers.IsStringValidInteger(AResponse, i) then
    Exit;
  ACode := AResponse;
  case i of
    1: // Approved
      begin
        AResponseClass := rcSuccess;
        ADescription := 'Approved [Code: 1].';
      end;
    2: // Declined
      begin
        AResponseClass := rcFailure;
        ADescription := 'Failed [Code: 2].';
      end;
    3: // Error
      begin
        AResponseClass := rcError;
        ADescription := 'Error [Code: 3].';
      end;
    4: // Held for Review
      begin
        AResponseClass := rcWarning;
        ADescription := 'Referral [Code: 4].';
      end;
  end;
end;

function TEPaymentAuthorizeNet.GetInternalError(ACode: ShortString): string;
var
  ACodeInt: Integer;
begin
  Result := '';
  if not IQMS.Common.Numbers.IsStringValidInteger(ACode, ACodeInt) then
    Exit('');

  case ACodeInt of
    // cc_rscstr.cTXT0000479 =
    // 'Authorize.Net generated a error code 13.  ' +
    // 'This error occurs when the merchant account is incorrect.  ' +
    // 'Here are possible causes and solutions:'#13#10 +
    // 'The merchant account you entered in System Parameters is the Web site ' +
    // 'account, and not the API login.  Please enter the API login ' +
    // 'information into System Parameters, instead of the primary account ' +
    // 'login.'
    13:
      Result := cc_rscstr.cTXT0000479;
  end;
end;

{$ENDREGION 'TEPaymentAuthorizeNet'}

{$REGION 'TEPaymentMoneris'}
{ TEPaymentMoneris }

constructor TEPaymentMoneris.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctHTMLForm;
  FCountryCodeFormat := cctChr2;
  FGateway := cgwMonerisCanada;
end;

function TEPaymentMoneris.FixText(const AValue: string): string;
const
  cUpper = ['A' .. 'Z'];
  cLower = ['a' .. 'z'];
  cNumber = ['0' .. '9'];
  cOther = [' ', '_', '-', ':', '.', '@'];
  cValidChar = cUpper + cLower + cNumber + cOther;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AValue) do
    if CharInSet(AValue[i], cValidChar) then
      Result := Result + AValue[i];
end;

procedure TEPaymentMoneris.ParseResponseList(var AElements: TStringList);
var
  ATempList: TStringList;
  i: Integer;
  ALine, AName, AValue: string;
begin
  if not Assigned(AElements) or Response.ResponseData.IsEmpty then
    Exit;

  ATempList := TStringList.Create;
  try
    ATempList.Text := System.SysUtils.StringReplace(Response.ResponseData,
      '<br>', #13,
      [rfIgnoreCase, rfReplaceAll]);

    for i := 0 to ATempList.Count - 1 do
    begin
      ALine := Trim(ATempList.Strings[i]);
      if (ALine > '') then
      begin
        IQMS.Common.StringUtils.GetNameValuePair(ALine, { var } AName, AValue);
        AElements.Add(Format('%s=%s', [Trim(AName), Trim(AValue)]));
      end;
    end;
  finally
    if Assigned(ATempList) then
      FreeAndNil(ATempList);
  end;
end;

procedure TEPaymentMoneris.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
var
  i: Integer;
begin
  ACode := '';
  ADescription := '';
  AResponseClass := rcNone;
  if not IQMS.Common.Numbers.IsStringValidInteger(AResponse, i) then
    Exit;
  ACode := AResponse;
  // Transaction Response Code:
  // < 50: Transaction approved
  // >= 50: Transaction declined
  // NULL: Transaction was not sent for authorization
  if i < 50 then
  begin
    AResponseClass := rcSuccess;
    ADescription := 'Approved';
  end
  else if i >= 50 then
  begin
    AResponseClass := rcFailure;
    ADescription := 'Failed';
  end
  else
  begin
    AResponseClass := rcError;
    ADescription := 'Error';
  end;
end;

procedure TEPaymentMoneris.Validate;
begin
  // cc_rscstr.cTXT0000438 =
  // 'Merchant login not provided.
  // Please specify a login name for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantLogin.IsEmpty, cc_rscstr.cTXT0000438);
  // cc_rscstr.cTXT0000439 =
  // 'Merchant password not provided.
  // Please specify a password for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantPassword.IsEmpty, cc_rscstr.cTXT0000439);
end;

{$ENDREGION 'TEPaymentMoneris'}

{$REGION 'TEPaymentMonerisCanada'}


{ TEPaymentMonerisCanada }
constructor TEPaymentMonerisCanada.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FGateway := cgwMonerisCanada;
end;

procedure TEPaymentMonerisCanada.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  // Canada
  if TestMode then
    AURL := 'https://esqa.moneris.com/HPPDP/index.php'
  else
    AURL := 'https://www3.moneris.com/HPPDP/index.php';
end;

procedure TEPaymentMonerisCanada.BuildCommand(const ATransactionType
  : TTransactionType);
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;
  AddFieldA('ps_store_id', MerchantLogin);
  AddFieldA('hpp_key', MerchantPassword);
  if IQMS.Common.StringUtils.StrInList(MerchantLanguageCode, ['FR', 'FRA', '250']) then
    AddFieldA('lang', 'fr-ca')
  else
    AddFieldA('lang', 'en-ca');
  AddFieldA('order_id', IQMS.Common.GuidUtils.GetGUIDAlphaNumeric);
  AddFieldA('cust_id', InvoiceNumber);
  AddFieldA('charge_total', FormatFloatValue(TransactionAmount));
  AddFieldA('gst', FormatFloatValue(TaxAmount));
  AddFieldA('shipping_cost', FormatFloatValue(FreightAmount));
  AddFieldA('cc_num', CreditCard.CardNumber);
  AddFieldA('expMonth', CreditCard.ExpireMonthAsStr);
  AddFieldA('expYear', CreditCard.ExpireYearAsStr);
  // Expected values:
  // 0 = CVD value is deliberately bypassed or is not provided by the merchant.
  // 1 = CVD value is present.
  // 2 = CVD value is on the card, but is illegible.
  // 9 = Cardholder states that the card has no CVD imprint.
  if not CreditCard.SecurityCode.IsEmpty then
  begin
    AddFieldA('cvd_indicator', '1');
    AddFieldA('cvd_value', CreditCard.SecurityCode);
  end
  else
    // CVV2 not provided
    AddFieldA('cvd_indicator', '0');
  try
    FCommand.HTMLEncoding := True;
    AddFieldA('avs_street_name', CreditCard.GetStreetName);
    AddFieldA('avs_street_number', CreditCard.GetStreetNumber);
    AddFieldA('avs_zipcode', CreditCard.CustomerPostalCode);
    AddFieldA('ship_postal_code', Destination.PostalCode);
    AddFieldA('ship_country', DestinationCountryCode);
    AddFieldA('bill_city', CreditCard.CustomerCity);
    AddFieldA('bill_first_name', CreditCard.CustomerFirstName);
    AddFieldA('bill_last_name', CreditCard.CustomerLastName);
    AddFieldA('bill_state_or_province', CreditCard.CustomerState);
    AddFieldA('note', TransactionDescription);
  finally
    FCommand.HTMLEncoding := False;
  end;
  // Note:  don't bother building the itemization.  Moneris does not
  // support Level 2/3 processing through Direct Post transactions.
  // BuildCommand_ItemDetails(FCommand);
end;

procedure TEPaymentMonerisCanada.ParseResponseText;
var
  AElements: TStringList;
  ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  if Response.ResponseData.IsEmpty then
    Exit;
  AElements := TStringList.Create;
  try
    // Get the response data as a useable name/value list
    ParseResponseList(AElements);
    if AElements.Count <= 1 then
      Exit;
    Response.ReturnValues.AddStrings(AElements);
    Response.ReturnCode := ShortString(AElements.Values['response_code']);
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := ShortString(AElements.Values['result']);
    // Note:  We need to construct an expanded description,
    // so that Moneris is satisfied that all data is on the receipt.
    ACode := ShortString(AElements.Values['iso_code']);
    ADescription := Trim(AElements.Values['message']);
    // Response.StatusDescription :=
    // Format('%s / Response Code: %s / ISO Code: %s',
    // [ADescription, Response.ReturnCode, ACode]);
    Response.StatusDescription := ADescription;
    if Response.StatusClass = rcError then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
    end;
    Response.ApprovalCode :=
      ShortString(AElements.Values['bank_approval_code']);
    Response.AVSCode := ShortString(AElements.Values['avs_response_code']);
    Response.TransactionID :=
      ShortString(AElements.Values['bank_transaction_id']);
    Response.TransactionType := AElements.Values['trans_name'];
    // Reference number is the same as the transaction ID
    // Response.ReferenceNumber := Response.TransactionID;
    Response.InvoiceNumber :=
      ShortString(AElements.Values['response_order_id']);
    Response.SecurityResultCode :=
      ShortString(AElements.Values['cvd_response_code']);
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.ProcessorCode := '';
    Response.TimeStamp := ShortString(Trim(AElements.Values['date_stamp']) +
      Trim(AElements.Values['time_stamp']));
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

{$ENDREGION 'TEPaymentMonerisCanada'}

{$REGION 'TEPaymentMonerisUSA'}
{ TEPaymentMonerisUSA }

constructor TEPaymentMonerisUSA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FGateway := cgwMonerisUSA;
end;

procedure TEPaymentMonerisUSA.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://esplusqa.moneris.com/DPHPP/index.php'
  else
    AURL := 'https://esplus.moneris.com/DPHPP/index.php';
end;

procedure TEPaymentMonerisUSA.BuildCommand(const ATransactionType
  : TTransactionType);
begin
  FTransactionType := ATransactionType;
  AddFieldA('dp_id', MerchantLogin);
  AddFieldA('dp_key', MerchantPassword);
  if IQMS.Common.StringUtils.StrInList(MerchantLanguageCode, ['FR', 'FRA', '250']) then
    AddFieldA('lang', 'fr-ca')
  else
    AddFieldA('lang', 'en-ca');
  AddFieldA('order_no', IQMS.Common.GuidUtils.GetGUIDAlphaNumeric);
  AddFieldA('cust_id', CreditCard.CustomerId);
  AddFieldA('amount', FormatFloatValue(TransactionAmount));
  AddFieldA('gst', FormatFloatValue(TaxAmount));
  AddFieldA('shipping_cost', FormatFloatValue(FreightAmount));
  AddFieldA('crypt_type', '7');
  AddFieldA('cc_num', CreditCard.CardNumber);
  AddFieldA('exp_month', CreditCard.ExpireMonthAsStr);
  AddFieldA('exp_year', CreditCard.ExpireYearAsStr);
  if not CreditCard.SecurityCode.IsEmpty then
    AddFieldA('cvd_value', CreditCard.SecurityCode);
  try
    FCommand.HTMLEncoding := True;
    AddFieldA('avs_street_name', CreditCard.GetStreetName);
    AddFieldA('avs_street_number', CreditCard.GetStreetNumber);
    AddFieldA('avs_zipcode', CreditCard.CustomerPostalCode);
    AddFieldA('ship_postal_code', Destination.PostalCode);
    AddFieldA('od_ship_country', DestinationCountryCode);
    AddFieldA('od_bill_city', CreditCard.CustomerCity);
    AddFieldA('od_bill_firstname', CreditCard.CustomerFirstName);
    AddFieldA('od_bill_lastname', CreditCard.CustomerLastName);
    AddFieldA('od_bill_state', CreditCard.CustomerState);
    AddFieldA('note', TransactionDescription);
  finally
    FCommand.HTMLEncoding := False;
  end;
  // Note:  don't bother building the itemization.  Moneris does not
  // support Level 2/3 processing through Direct Post transactions.
  // BuildCommand_ItemDetails(ACommand);
end;

procedure TEPaymentMonerisUSA.ParseResponseText;
var
  AElements: TStringList;
  ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  AElements := nil;

  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    // Get the response data as a useable name/value list
    ParseResponseList(AElements);
    if AElements.Count <= 1 then
      Exit;
    Response.TransactionID := ShortString(AElements.Values['ref_num']);
    Response.ReturnValues.AddStrings(AElements);
    Response.ReturnCode := ShortString(AElements.Values['response_code']);
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := ShortString(AElements.Values['result']);
    // Note:  We need to construct an expanded description,
    // so that Moneris is satisfied that all data is on the receipt.
    ADescription := Trim(AElements.Values['message']);
    // Reference number is the same as the transaction ID
    // Note:  This is redundant, but Moneris wants this noted specifically
    // as "Reference #".
    Response.ReferenceNumber := Response.TransactionID;
    // Response.StatusDescription := Format('%s / Response Code: %s / Ref #: %s',
    // [ADescription, Response.ReturnCode, Response.TransactionID]);
    Response.StatusDescription := ADescription;
    if Response.StatusClass = rcError then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
    end;
    Response.ApprovalCode := ShortString(AElements.Values['auth_code']);
    Response.AVSCode := ShortString(AElements.Values['avs_result']);
    Response.TransactionType := AElements.Values['txn_type'];
    Response.InvoiceNumber := ShortString(AElements.Values['order_no']);
    Response.SecurityResultCode := ShortString(AElements.Values['cvd_result']);
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.ProcessorCode := '';
    Response.TimeStamp := ShortString(Trim(AElements.Values['date_stamp']) +
      Trim(AElements.Values['time_stamp']));
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

{$ENDREGION 'TEPaymentMonerisUSA'}

{$REGION 'TEPaymentElavon'}
{ TEPaymentElavon }

constructor TEPaymentElavon.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctHTMLForm;
  FCountryCodeFormat := cctChr2;
  FGateway := cgwMyVirtualMerchant;
end;

function TEPaymentElavon.FormatFloatValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
begin
{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  Result := FormatFloat('###00.00', AValue, AFormatSettings);
{$WARN SYMBOL_PLATFORM ON}
end;

procedure TEPaymentElavon.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://demo.myvirtualmerchant.com/VirtualMerchantDemo/process.do'
  else
    AURL := 'https://www.myvirtualmerchant.com/VirtualMerchant/process.do';
end;

procedure TEPaymentElavon.BuildCommand(const ATransactionType
  : TTransactionType);
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;

  case FTransactionType of
    ttAddToken:
      AddFieldA('ssl_transaction_type', 'CCGETTOKEN');
    ttDeleteToken:
      AddFieldA('ssl_transaction_type', 'CCDELETETOKEN');
    ttQueryToken:
      AddFieldA('ssl_transaction_type', 'CCQUERYTOKEN');
  else
    AddFieldA('ssl_transaction_type', 'CCSALE');
  end;

  AddFieldA('dp_id', MerchantLogin);
  AddFieldA('dp_key', MerchantPassword);

  AddFieldA('ssl_show_form', 'FALSE');
  AddFieldA('ssl_result_format', 'ASCII');
  AddFieldA('ssl_user_id', MerchantUserID);
  AddFieldA('ssl_merchant_id', MerchantLogin);
  AddFieldA('ssl_pin', MerchantPassword);
  if TestMode then
    AddFieldA('ssl_test_mode', 'TRUE');

  if not (FTransactionType in [ttAddToken, ttDeleteToken, ttQueryToken]) then
  begin
    AddFieldA('ssl_salestax', FormatFloatValue(TaxAmount));
    try
      FCommand.HTMLEncoding := True;
      AddFieldA('ssl_ship_to_company', Destination.CompanyName, 50);
      AddFieldA('ssl_ship_to_address1', Destination.Address1, 30);
      AddFieldA('ssl_ship_to_address2', Destination.Address2, 30);
      AddFieldA('ssl_ship_to_city', Destination.City, 30);
      AddFieldA('ssl_ship_to_state', Destination.StateOrRegion, 30);
      AddFieldA('ssl_ship_to_zip', Destination.PostalCode, 10);
      AddFieldA('ssl_ship_to_country', Destination.Country, 50);
    finally
      FCommand.HTMLEncoding := False;
    end;
  end;

  // ttDeleteToken
  if FTransactionType = ttAddToken then
    AddFieldA('ssl_add_token', 'Y')
    // AddFieldA('ssl_get_token', 'Y')
  else if not CreditCard.IsToken and CreditCard.AddAsNewToken then
    AddFieldA('ssl_add_token', 'Y');

  if CreditCard.IsToken then
    AddFieldA('ssl_token', CreditCard.CardNumber)
  else
    AddFieldA('ssl_card_number', CreditCard.CardNumber);
  AddFieldA('ssl_exp_date', CreditCard.ExpirationMMYY);

  if not (FTransactionType in [ttDeleteToken, ttQueryToken]) then
  begin
    try
      FCommand.HTMLEncoding := True;
      FCommand.AllowEmptyValues := False;
      AddFieldA('ssl_first_name', CreditCard.CustomerFirstName, 20);
      AddFieldA('ssl_last_name', CreditCard.CustomerLastName, 30);
      AddFieldA('ssl_company', CreditCard.CustomerCompany, 50);
      AddFieldA('ssl_avs_address', CreditCard.CustomerAddress, 20);
      AddFieldA('ssl_city', CreditCard.CustomerCity, 30);
      AddFieldA('ssl_state', CreditCard.CustomerState, 30);
      AddFieldA('ssl_avs_zip', CreditCard.CustomerPostalCode, 9);
      AddFieldA('ssl_country', CreditCard.CustomerCountry, 50);
    finally
      FCommand.HTMLEncoding := False;
      FCommand.AllowEmptyValues := True;
    end;
    if not (FTransactionType in [ttAddToken]) then
    begin
      AddFieldA('ssl_invoice_number', InvoiceNumber);
      AddFieldA('ssl_amount', FormatFloatValue(TransactionAmount));
      AddFieldB('ssl_description', TransactionDescription,
        Length(TransactionDescription), True);
    end;
    if not CreditCard.SecurityCode.IsEmpty then
    begin
      AddFieldA('ssl_cvv2cvc2_indicator', '1');
      AddFieldA('ssl_cvv2cvc2', CreditCard.SecurityCode);
    end
    else
    begin
      AddFieldA('ssl_cvv2cvc2_indicator', '9');
    end;
  end;
end;

procedure TEPaymentElavon.ParseResponseText;
var
  AElements: TStringList;
  ACode, AValue: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  AElements := nil;

  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    // Get the response data as a useable name/value list
    AElements.Text := Response.ResponseData;
    if AElements.Count <= 1 then
      Exit;

    // If query the token, then treat the response differently.  There
    // will only be a handful of returned name/value pairs.  As long as
    // the returned token is the same as token passed, then it exists.
    // We just want to know if it exists; that's all.
    if (FTransactionType = ttQueryToken) then
    begin
      AValue := ShortString(AElements.Values['ssl_token']);
      if CompareText(AValue, CreditCard.CardNumber) = 0 then
      begin
        Response.ReturnCode := '0';
        Response.StatusClass := rcSuccess;
        Response.StatusCode := 'SUCCESS';
        Response.StatusDescription := 'SUCCESS';
        Response.TokenStatusClass := trcSuccess;
        Response.TokenStatusDescription := 'SUCCESS';
        Response.TokenStatusCode := 'SUCCESS';
      end
      else
      begin
        Response.StatusClass := rcFailure;
        Response.StatusCode := 'FAILED';
        Response.StatusDescription := 'FAILED';
        Response.TokenStatusClass := trcFailure;
        Response.TokenStatusDescription := 'FAILED';
        Response.TokenStatusCode := 'FAILED';
      end;
      Exit;
    end;

    Response.TransactionID := ShortString(AElements.Values['ssl_txn_id']);
    Response.ReturnValues.AddStrings(AElements);
    Response.ReturnCode := ShortString(AElements.Values['ssl_result']);
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := ShortString(AElements.Values['ssl_result']);
    // Reference number is the same as the transaction ID
    // Response.ReferenceNumber := Response.TransactionID;
    // Note:  We need to construct an expanded description,
    // so that Moneris is satisfied that all data is on the receipt.
    ADescription := Trim(AElements.Values['ssl_result_message']);
    // Response.StatusDescription := Format('%s / Code: %s / Ref: %s',
    // [ADescription, Response.ReturnCode, Response.TransactionID]);
    Response.StatusDescription := ADescription;
    if Response.StatusClass = rcError then
    begin
      Response.ErrorCode := Response.StatusCode;
      Response.ErrorDescription := Response.StatusDescription;
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
    end;
    Response.ApprovalCode := ShortString(AElements.Values['ssl_approval_code']);
    Response.AVSCode := ShortString(AElements.Values['ssl_avs_response']);

    // If we get here with no data, then look at the response differently.
    // This is an example:
    // 'errorCode=5002'
    // 'errorName=Amount Invalid'
    // 'errorMessage=The amount supplied in the authorization request appears to be invalid.'
    // 'ssl_status=TEST MODE'
    if (Response.StatusCode = '') and (Response.StatusClass = rcNone) and
      (Response.StatusDescription = '') and (Response.ErrorText = '') then
    begin
      ACode := Trim(AElements.Values['errorCode']);
      if ACode > '' then
      begin
        // Assign error code
        Response.ErrorCode := ACode;
        // Set the status
        Response.StatusClass := rcError;
        // Assign basic error
        AValue := Trim(AElements.Values['errorName']);
        Response.ErrorDescription := AValue;
        // Assign full error text
        AValue := Trim(AElements.Values['errorMessage']);
        Response.ErrorText := AValue;
      end;
    end;

    // Adding a new token with this transaction:
    // 1.) Adding a token along with an authorization (AuthOnly, Sales, etc.)
    // 2.) Just adding the token.
    if (FTransactionType in [ttAddToken, ttDeleteToken, ttQueryToken]) or
      (CreditCard.AddAsNewToken and (FTransactionType in [ttAuthOnly, ttSale,
      ttForce, ttCredit])) then
    begin
      { Outcome of the token generation. This value will be a SUCCESS
        if a token has been generated. Other possible returned values
        are FAILURE, Action Not Permitted, Invalid Token, Not Permitted,
        or Acct Verification Failed. }
      AValue := AElements.Values['ssl_token_response'];
      // For Elavon, both the Code and Description are the same.
      Response.TokenStatusDescription := AValue;
      Response.TokenStatusCode := AValue;
      if CompareText(AValue, 'SUCCESS') = 0 then
      begin
        // Return the new token
        // TTokenResponseClass = (trcNone, trcSuccess, trcFailure);
        Response.TokenStatusClass := trcSuccess;
        Response.NewToken := AElements.Values['ssl_token'];
        // This should never happen:
        if Response.NewToken = '' then
          Response.TokenStatusClass := trcFailure;
      end
      else
        Response.TokenStatusClass := trcFailure;
    end;

    Response.InvoiceNumber :=
      ShortString(AElements.Values['ssl_invoice_number']);
    Response.SecurityResultCode :=
      ShortString(AElements.Values['ssl_cvv2_response']);
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.ProcessorCode := '';
    Response.TransactionType :=
      ShortString(AElements.Values['ssl_transaction_type']);
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

procedure TEPaymentElavon.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
var
  i: Integer;
begin
  ACode := '';
  ADescription := '';
  AResponseClass := rcNone;
  if not IQMS.Common.Numbers.IsStringValidInteger(AResponse, i) then
    Exit;
  ACode := AResponse;
  if i = 0 then
  begin
    AResponseClass := rcSuccess;
    ADescription := 'Approved';
  end
  else if i = 1 then
  begin
    AResponseClass := rcFailure;
    ADescription := 'Failed';
  end
  else
  begin
    AResponseClass := rcError;
    ADescription := 'Error';
  end;
end;

procedure TEPaymentElavon.Validate;
begin
  // cc_rscstr.cTXT0000438 =
  // 'Merchant login not provided.
  // Please specify a login name for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantLogin.IsEmpty, cc_rscstr.cTXT0000438);
  // cc_rscstr.cTXT0000439 =
  // 'Merchant password not provided.
  // Please specify a password for the merchant account
  // in System Parameters.'
  IQAssert(not MerchantPassword.IsEmpty, cc_rscstr.cTXT0000439);
  // cc_rscstr.cTXT0000476 =
  // 'Merchant User ID not provided.  Please specify a User ID ' +
  // 'for the merchant account in System Parameters.';
  IQAssert(not MerchantUserID.IsEmpty, cc_rscstr.cTXT0000476);
end;

{$ENDREGION 'TEPaymentElavon'}

{$REGION 'TEPaymentPayPal'}
{ TEPaymentPayPal }

constructor TEPaymentPayPal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctHTMLForm;
  FCountryCodeFormat := cctChr2;
  FGateway := cgwPayPal;
end;

procedure TEPaymentPayPal.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://api-3t.sandbox.paypal.com/nvp'
  else
    AURL := 'https://api-3t.paypal.com/nvp';
end;

procedure TEPaymentPayPal.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantLogin, 'Merchant Login');
  ValidateSetting(MerchantPassword, 'Merchant Password');
  ValidateSetting(MerchantSignature, 'Merchant Signature');
end;

function TEPaymentPayPal.CardTypeStr: string;
begin
  // These are the only cards supported by PayPal
  case CreditCard.CardType of
    ccVisa:
      Result := 'Visa';
    ccMasterCard:
      Result := 'MasterCard';
    ccAmex:
      Result := 'Amex';
    ccDiscover:
      Result := 'Discover';
    ccMaestro:
      Result := 'Maestro';
  else
    // We raise an exception because this data is required, and
    // is limited to a short list of values.
    raise Exception.Create('Card type not supported by PayPal.');
  end;
end;

procedure TEPaymentPayPal.BuildCommand(const ATransactionType
  : TTransactionType);
var
  IPAddress: string;
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;
  // Notes:
  // 1.  We use the Name/Value Pairs API.  Documentation is contained
  // in, "PP_NVPAPI_DeveloperGuide.pdf".
  // 2.  Requires a "Business Seller", "Website Payments Pro Account" to be
  // created.

  // Header
  AddFieldA('USER', Self.MerchantLogin);
  AddFieldA('PWD', Self.MerchantPassword);
  AddFieldA('SIGNATURE', Self.MerchantSignature);
  AddFieldA('VERSION', '2.0');

  // Note:  PayPal does not support ttForce.
  // To use ttAVSOnly, we need to provide an email address,
  // and we just don't prompt for that.
  case ATransactionType of
    ttSale:
      begin
        AddFieldA('METHOD', 'DoDirectPayment');
        AddFieldA('PAYMENTACTION', 'Sale');
      end;
    ttAuthOnly:
      begin
        AddFieldA('METHOD', 'DoDirectPayment');
        AddFieldA('PAYMENTACTION', 'Authorization');
      end;
    ttCapture:
      begin
        AddFieldA('METHOD', 'DoCapture');
        AddFieldA('AUTHORIZATIONID', TransactionID);
        AddFieldA('COMPLETETYPE', 'Complete');
      end;
    ttCredit:
      begin
        AddFieldA('METHOD', 'RefundTransaction');
        AddFieldA('TRANSACTIONID', TransactionID);
        if ReversalData.IsPartial then
          AddFieldA('REFUNDTYPE', 'Partial')
        else
          AddFieldA('REFUNDTYPE', 'Full');
      end;
    ttVoid:
      begin
        AddFieldA('METHOD', 'DoVoid');
        AddFieldA('AUTHORIZATIONID', TransactionID);
      end;
  else
    begin
      FCommand.Clear;
      Exit;
    end;
  end;

  if (ATransactionType in [ttSale, ttAuthOnly]) and
    IQMS.Common.SysInfo.GetIPAddress(IPAddress) then
    AddFieldA('IPADDRESS', IPAddress);

  if CanSendCardData(ATransactionType) then
  begin
    AddFieldA('CREDITCARDTYPE', CardTypeStr);
    AddFieldA('ACCT', CreditCard.CardNumber);
    // Example: submit '012016', instead of the customary, '0116'.
    AddFieldA('EXPDATE', CreditCard.ExpireMonthAsStr +
      CreditCard.Expire4DigitYearAsStr);
    if not CreditCard.SecurityCode.IsEmpty then
      AddFieldA('CVV2', CreditCard.SecurityCode);
    try
      FCommand.HTMLEncoding := True;
      FCommand.AllowEmptyValues := False;
      AddFieldA('FIRSTNAME', CreditCard.CustomerFirstName, 25);
      AddFieldA('LASTNAME', CreditCard.CustomerLastName, 25);
      AddFieldA('STREET', CreditCard.CustomerAddress, 100);
      AddFieldA('CITY', CreditCard.CustomerCity, 40);
      AddFieldA('STATE', CreditCard.CustomerState, 40);
      AddFieldA('ZIP', CreditCard.CustomerPostalCode, 20);
      // 2-character country code
      AddFieldA('COUNTRYCODE', CreditCard.CustomerCountryCode);
    finally
      FCommand.HTMLEncoding := False;
      FCommand.AllowEmptyValues := True;
    end;
  end;

  if (ATransactionType in [ttSale, ttAuthOnly, ttCapture, ttVoid]) then
    AddFieldA('CURRENCYCODE', TransactionCurrencyCode);

  // Note:  The total amount (AMT) must include tax and freight.
  if (ATransactionType in [ttSale, ttAuthOnly, ttCapture, ttCredit]) then
    AddFieldA('AMT', FormatFloatValue(TransactionAmount));

  if (ATransactionType in [ttSale, ttAuthOnly]) then
  begin
    // The item amount (does not include tax or freight)
    AddFieldA('ITEMAMT', FormatFloatValue(TransactionAmount -
      (FreightAmount + TaxAmount)));
    // Freight amount only
    AddFieldA('SHIPPINGAMT', FormatFloatValue(FreightAmount));
    // Tax amount only
    AddFieldA('TAXAMT', FormatFloatValue(TaxAmount));
    AddFieldB('DESC', TransactionDescription, 127, True, False);
    // Although the property is optional, the PayPal Invoice Number must
    // be unique for each transaction.
    if not InvoiceNumber.IsEmpty then
      AddFieldB('INVNUM', Format('%s-%s', [InvoiceNumber,
        cc_share.NextReferenceNumber(cgwPayPal)]), 127, False, False);
  end;
  // Although this is listed as optional, it is required to
  // avoid some warning Winapi.Messages.
  AddFieldA('BUTTONSOURCE', 'IQMS');
end;

function TEPaymentPayPal.Refund: Boolean;
begin
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  Result := inherited Refund;
end;

procedure TEPaymentPayPal.ParseResponseText;
var
  AElements: TStringList;
  ASeverityFlag, ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    IQMS.Common.StringUtils.Tokenize(Response.ResponseData, ['&'], AElements);
    Response.ReturnValues.AddStrings(AElements);

    Response.ReturnCode := ShortString(Trim(AElements.Values['ACK']));
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := ACode;
    Response.StatusDescription := ADescription;

    if (AElements.IndexOfName('L_SEVERITYCODE0') > - 1) then
      ASeverityFlag := ShortString(Trim(AElements.Values['L_SEVERITYCODE0']));
    if (ASeverityFlag = 'Warning') then
      AResponseClass := rcWarning
    else if (ASeverityFlag = 'Error') then
      AResponseClass := rcError;
    if (AElements.IndexOfName('L_ERRORCODE0') > - 1) then
    begin
      Response.ErrorCode :=
        ShortString(Trim(AElements.Values['L_ERRORCODE0']));
      { TODO : IQMS.Common.StringUtils.HTMLEncode undeclared }
      {Response.ErrorDescription :=
        Trim(IQMS.Common.StringUtils.HTMLDecode(Trim(AElements.Values['L_LONGMESSAGE0']))); }
      Response.ErrorText :=
        Format('%s: %s', [Response.ErrorCode, Response.ErrorDescription]);
      // Error details
      Response.ErrorDetails := GetPayPalInternalError527(Response.ErrorCode);
    end;

    if (AElements.IndexOfName('TRANSACTIONID') > - 1) then
      Response.TransactionID :=
        ShortString(Trim(AElements.Values['TRANSACTIONID']));
    Response.ApprovalCode := ShortString(Trim(AElements.Values['ACK']));
    // For PayPal, the reference number is the same as the transaction ID
    // Response.ReferenceNumber := Response.TransactionID;
    // Indicates the status of the last transaction.
    Response.Approved := Response.StatusClass = rcSuccess;
    Response.AVSCode := ShortString(Trim(AElements.Values['AVSCODE']));
    Response.SecurityResultCode :=
      ShortString(Trim(AElements.Values['CVV2MATCH']));
    Response.ProcessorCode :=
      ShortString(Trim(AElements.Values['CORRELATIONID']));
    { TODO : IQMS.Common.StringUtils.HTMLEncode undeclared }
    {Response.TimeStamp :=
      ShortString(IQMS.Common.StringUtils.HTMLDecode(Trim(AElements.Values['TIMESTAMP'])));           }
    // Additional.  These may or may not be returned.  It depends on
    // the transaction type.  These are stored for informational
    // purposes.
    if (AElements.IndexOfName('AUTHORIZATIONID') > - 1) then
      Response.AddReturnValue('AUTHORIZATIONID',
        Trim(AElements.Values['AUTHORIZATIONID']));
    if (AElements.IndexOfName('PARENTTRANSACTIONID') > - 1) then
      Response.AddReturnValue('PARENTTRANSACTIONID',
        Trim(AElements.Values['PARENTTRANSACTIONID']));
    if (AElements.IndexOfName('ORDERTIME') > - 1) then
      Response.AddReturnValue('ORDERTIME', Trim(AElements.Values['ORDERTIME']));
    if (AElements.IndexOfName('RECEIPTID') > - 1) then
      Response.AddReturnValue('RECEIPTID', Trim(AElements.Values['RECEIPTID']));
    if (AElements.IndexOfName('PAYMENTSTATUS') > - 1) then
      Response.AddReturnValue('PAYMENTSTATUS',
        Trim(AElements.Values['PAYMENTSTATUS']));
    if (AElements.IndexOfName('PENDINGREASON') > - 1) then
      Response.AddReturnValue('PENDINGREASON',
        Trim(AElements.Values['PENDINGREASON']));
    if (AElements.IndexOfName('REASONCODE') > - 1) then
      Response.AddReturnValue('REASONCODE',
        Trim(AElements.Values['REASONCODE']));
    // Refunds
    if (AElements.IndexOfName('REFUNDTRANSACTIONID') > - 1) then
      Response.AddReturnValue('REFUNDTRANSACTIONID',
        Trim(AElements.Values['REFUNDTRANSACTIONID']));
    if (AElements.IndexOfName('FEEREFUNDAMT') > - 1) then
      Response.AddReturnValue('FEEREFUNDAMT',
        Trim(AElements.Values['FEEREFUNDAMT']));
    if (AElements.IndexOfName('GROSSREFUNDAMT') > - 1) then
      Response.AddReturnValue('GROSSREFUNDAMT',
        Trim(AElements.Values['GROSSREFUNDAMT']));
    if (AElements.IndexOfName('NETREFUNDAMT') > - 1) then
      Response.AddReturnValue('NETREFUNDAMT',
        Trim(AElements.Values['NETREFUNDAMT']));
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

procedure TEPaymentPayPal.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
begin
  ACode := AResponse;
  ADescription := '';
  AResponseClass := rcSuccess; // default
  if (AResponse = 'Success') then
  begin
    AResponseClass := rcSuccess;
    // 'Transaction Successful.'
    ADescription := cc_rscstr.cTXT0000220;
  end
  else if (AResponse = 'Failure') then
  begin
    AResponseClass := rcFailure;
    // 'Transaction Failed.'
    ADescription := cc_rscstr.cTXT0000302;
  end
  else if (AResponse = 'SuccessWithWarning') then
  begin
    AResponseClass := rcWarning;
    // 'Transaction Successful with Warning.'
    ADescription := cc_rscstr.cTXT0000303;
  end
  else if (AResponse = 'FailureWithWarning') then
  begin
    AResponseClass := rcError;
    // 'Error Condition. Authorization failed with warning.';
    ADescription := cc_rscstr.cTXT0000304;
  end
  else if (AResponse = 'CustomCode') then
  begin
    AResponseClass := rcSuccess;
    // 'Custom code.'
    ADescription := cc_rscstr.cTXT0000305;
  end;
end;

function TEPaymentPayPal.GetPayPalInternalError527(ACode: ShortString): string;
var
  ACodeInt: Integer;
begin
  Result := '';
  if not IQMS.Common.Numbers.IsStringValidInteger(ACode, ACodeInt) then
    Exit('');

  case ACodeInt of
    // Since we at IQMS use a test account, another cause for this
    // error is the card number.  We need to use a specific set of
    // card numbers for testing.  If we don't use the correct card
    // number, we could get this error.
    10001:
      begin
        if TestMode then
          // cc_rscstr.cTXT0000361 =
          // 'PayPal generated a 10001 internal error.  ' +
          // 'Possible causes include the following:'#13#13 +
          // ' 1. You are using an unregistered test card number.'#13 +
          // ' 2. The transaction number does not exist on the gateway server.'#13 +
          // ' 3. The state name was not passed as a two-letter, U.S. state abbreviation.'#13 +
          // ' 4. You have tried an authorization for a currency other than USD.'#13#13 +
          // ' 5. Your account has been deactivated.'#13#13 +
          // 'If none of these conditions apply, contact PayPal directly to ' +
          // 'determine why you are not able to perform a test authorization.  ' +
          // 'If contacting PayPal, you may need to provide the XML Request data ' +
          // 'from the Credit Card log.';
          Result := cc_rscstr.cTXT0000361
        else
          // cc_rscstr.cTXT0000326 =
          // 'PayPal generated a 10001 internal error.  ' +
          // 'Possible causes include the following:'#13#13 +
          // ' 1. The transaction number does not exist on the gateway server.'#13 +
          // ' 2. The card has failed a CVV2 check at least six times within a 30-day period.'#13 +
          // ' 3. The billing country in the request is different from the billing country on the card.'#13 +
          // ' 4. The state name was not passed as a two-letter, U.S. state abbreviation.'#13 +
          // ' 5. You have tried an authorization for a currency other than USD.'#13#13 +
          // ' 6. Your account has been deactivated.'#13#13 +
          // 'If none of these conditions apply, contact IQMS or PayPal directly.  ' +
          // 'If contacting PayPal, you may need to provide the XML Request data ' +
          // 'from the Credit Card log.';
          Result := cc_rscstr.cTXT0000326;
      end;
    10002:
      // cc_rscstr.cTXT0000310 =
      // 'PayPal generated a 10002 internal error.' +
      // 'Possible causes and solutions:' + #13#10 +
      // '1.  The most common cause for this error is incorrect login ' +
      // 'information.  Please verify that the PayPal account information ' +
      // 'you entered in System Parameters is correct.' + #13#10 +
      // '2.  Your account may not be a Website Payments Pro account.  Log ' +
      // 'onto to the PayPal Web site, and verify that you have activated ' +
      // 'Website Payments Pro on your account.' + #13#10 +
      // '3.  Your account may have been deactivated.  Contact PayPal to ' +
      // 'determine the status of your account.';
      Result := cc_rscstr.cTXT0000310;
    10501:
      // cc_rscstr.cTXT0000327 =
      // 'PayPal generated a 10501 internal error.  ' +
      // 'This error occurs when the billing agreement is disabled or inactive.  ' +
      // 'Here are possible causes and solutions:' + #13#10 +
      // '1.  WebSite Payments Pro must be enabled on the account.  Be sure ' +
      // 'WebSite Payments Pro has been activated for your account.'#13 +
      // '2.  You have not accepted the billing agreement on the account.  Log ' +
      // 'into your account and click on the Accept Billing Agreement link to ' +
      // 'accept the billing agreement.'
      Result := cc_rscstr.cTXT0000327;
  end;
end;

{$ENDREGION 'TEPaymentPayPal'}

{$REGION 'TEPaymentFirstData'}
{ TEPaymentFirstData }

constructor TEPaymentFirstData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctXML;
  FCountryCodeFormat := cctDigit3;
  FGateway := cgwFirstData;
end;

procedure TEPaymentFirstData.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://stg.dw.us.fdcnet.biz/rc'
  else
    AURL := 'https://prod.dw.us.fdcnet.biz/rc';
end;

procedure TEPaymentFirstData.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantID, 'Merchant ID');
  ValidateSetting(TerminalID, 'Terminal ID');
  ValidateSetting(GroupID, 'Group ID');
  ValidateSetting(DatawireID, 'Datawire ID');

  // According to their documentation, the SalesOrderID is required
  // for all MOTO transactions inclusing just an AVS Test.
  if not (FTransactionType in [ttAddToken]) and (SalesOrderID = 0) then
    // cc_rscstr.cTXT0000672 = 'A Sales Order number is required.';
    raise Exception.Create(cc_rscstr.cTXT0000672);

  // If tax amount is provided, we must also have a Sales Order #
  if (Self.FTransactionType in [ttSale, { ttAuthOnly, } ttCapture]) and
    (ProcessingClass = pclLevel2) and (TaxAmount > 0) and
    (SalesOrderNumber = '') then
    // cc_rscstr.cTXT0000673 =
    // 'If charging for tax, a Sales Order # must also be provided.';
    raise Exception.Create(cc_rscstr.cTXT0000673);

end;

function TEPaymentFirstData.FormatFloatValue(const AValue: Real): string;
var
  AFormatSettings: TFormatSettings;
  AStringValue: string;
  AFormat: string;
  A3DigitCode: string;
begin
  // NOTE:  For FirstData, the number of decimal places is determined by
  // the country code.  Most expect 2 decimal places.  But some countries
  // us different values.  And they only use 3-digit codes.
  A3DigitCode :=  IQMS.Common.Mcshare.CurrencyCodeFor(TransactionCurrencyCode,
     IQMS.Common.Mcshare.TCurrencyCodeType.mctDigit3);
  // These support no decimals
  if IQMS.Common.StringUtils.StrInList(A3DigitCode, ['108', '152', '174', '262', '324', '392',
    '410', '548', '600', '646', '949', '950', '952', '953', '974']) then
    AFormat := '###0'
    // These support 3 decimals
  else if IQMS.Common.StringUtils.StrInList(A3DigitCode, ['048', '368', '400', '414', '434',
    '512', '788']) then
    AFormat := '###0.000'
    // Everything else supports 2 decimals
  else
    AFormat := '###0.00';

{$WARN SYMBOL_PLATFORM OFF}
  AFormatSettings := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  AFormatSettings.DecimalSeparator := '.';
  AFormatSettings.ThousandSeparator := ',';
  AStringValue := FormatFloat(AFormat, AValue, AFormatSettings);
  Result := IQMS.Common.StringUtils.StrTran(AStringValue, '.', '');
{$WARN SYMBOL_PLATFORM ON}
end;

function TEPaymentFirstData.ToDateTime(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('yyyymmddHHNNSS', AValue);
end;

function TEPaymentFirstData.ToDate(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('yyyymmdd', AValue);
end;

function TEPaymentFirstData.CardTypeStr: string;
begin
  // These are the only cards supported by FirstData
  case CreditCard.CardType of
    ccVisa:
      Result := 'Visa';
    ccMasterCard:
      Result := 'MasterCard';
    ccAmex:
      Result := 'Amex';
    // FirstData wants Diners Club and JCB to be tagged as Discover.
    // Yeah, it's weird, but I went round and round with them on it,
    // even calling Discover Card to get at the truth.  It's stupid,
    // and they're the only ones who do this, but whatever works.
    ccDiscover, ccDinersClub, ccJCB:
      Result := 'Discover';
    // ccDinersClub:
    // Result := 'Diners';
    // ccJCB:
    // Result := 'JCB';
  else
    // We raise an exception because this data is required, and
    // is limited to a short list of values.
    raise Exception.Create('Card type not supported by FirstData.');
  end;
end;

procedure TEPaymentFirstData.BuildCommand(const ATransactionType
  : TTransactionType);
var
  AAuthKey1, AAuthKey2, AClientRef, AOrigSTAN, AOrigAuthID, AOrigLocalDateTime,
    AOrigTranDateTime, AOrigRespCode, A3DigitCode, AOrigAVSResultCode,
    AOrigCCVResultCode, APayloadText, AValue1, AValue2, AValue3, AValue4,
    AValue5, AValue6: string;
  APayload: TStringList;
begin
  FTransactionType := ATransactionType;

  // Regardless of transaction type, populate response values, if available.
  AOrigSTAN := OriginalResponse.Items.Values['RESPONSE_STAN'];
  AOrigAuthID := OriginalResponse.Items.Values['RESPONSE_PROCESSOR_CODE'];
  AOrigLocalDateTime := OriginalResponse.Items.Values
    ['RESPONSE_LOCAL_TIMESTAMP'];
  AOrigTranDateTime := OriginalResponse.Items.Values
    ['RESPONSE_TRANSMISSION_TIMESTAMP'];
  AOrigRespCode := OriginalResponse.Items.Values['RESPONSE_CODE'];
  AOrigAVSResultCode := OriginalResponse.Items.Values['RESPONSE_AVS'];
  AOrigCCVResultCode := OriginalResponse.Items.Values['RESPONSE_CVV'];

  // Populate as private variables.  These values must be saved
  // within the response because voids and settlements must send
  // these exact values, not the values returned in the response.
  FLocalDateTime := ToDateTime(TransactionDate);
  FTranDateTime := ToDateTime(IQMS.Common.Dates.GetUTCDateTime);

  // If this is a time-out reversal and the OriginalResponse list has not
  // been populated, then assume that this has been activated immediately
  // following a failed transaction.
  if TimeOutReversalStatus.Required then
  begin
    // Overwrite local and transaction date/time
    FLocalDateTime := ToDateTime(Now());
    FTranDateTime := ToDateTime(IQMS.Common.Dates.GetUTCDateTime);
    AOrigSTAN := FTimeOutReversalRec.OrigSTAN;
    AOrigAuthID := FTimeOutReversalRec.OrigAuthID;
    AOrigLocalDateTime := FTimeOutReversalRec.OrigLocalDateTime;
    AOrigTranDateTime := FTimeOutReversalRec.OrigTranDateTime;
    AOrigRespCode := FTimeOutReversalRec.OrigRespCode;
    AOrigAVSResultCode := FTimeOutReversalRec.OrigAVSResultCode;
    AOrigCCVResultCode := FTimeOutReversalRec.OrigCCVResultCode;
  end;

  A3DigitCode :=  IQMS.Common.Mcshare.CurrencyCodeFor(TransactionCurrencyCode,
     IQMS.Common.Mcshare.TCurrencyCodeType.mctDigit3);
  if A3DigitCode = '' then
    A3DigitCode := '840';

  // Get unique value for all transaction types
  FSTAN := IQMS.Common.StringUtils.LPadZero(IntToStr(cc_share.GetNextFirstDataSTAN), 6);

  FCommand.Clear;
  FCommand.ListDelimiter := '';
  FCommand.Add('<?xml version="1.0" encoding="UTF-8"?>');
  FCommand.Add(Format('<Request Version="3" ClientTimeout="%d" ' +
    'xmlns="http://securetransport.dw/rcservice/xml">', [TimeOut]));
  FCommand.Add('<ReqClientID>');
  FCommand.Add(Format('<DID>%s</DID>', [DatawireID]));
  FCommand.Add('<App>RAPIDCONNECTVXN</App>');
  AAuthKey1 := Format('%s%s', [GroupID, MerchantID]);
  AAuthKey2 := IQMS.Common.StringUtils.LPadZero(TerminalID, 8);
  FCommand.Add(Format('<Auth>%s|%s</Auth>', [AAuthKey1, AAuthKey2]));
  // ClientRef max length is 14
  AClientRef := Format('%sVIQv%s', [cc_share.NextReferenceNumber(cgwFirstData),
    IQMS.Common.Version.C_Version]);
  // remove periods
  AClientRef := StringReplace(AClientRef, '.', '_',
    [rfReplaceAll, rfIgnoreCase]);
  FCommand.Add(Format('<ClientRef>%s</ClientRef>', [AClientRef]));
  FCommand.Add('</ReqClientID>');
  FCommand.Add('<Transaction>');
  FCommand.Add('<ServiceID>160</ServiceID>');
  FCommand.Add('<Payload Encoding="xml_escape">');

  APayload := TStringList.Create;
  try
    APayload.Add('<GMF xmlns="com/firstdata/Merchant/gmfV2.08">');

    if TimeOutReversalStatus.Required or (ATransactionType = ttVoid) then
      APayload.Add('<ReversalRequest>')
    else if (ATransactionType = ttAddToken) then
      APayload.Add('<TransArmorRequest>')
    else
      APayload.Add('<CreditRequest>');

    // Common Group
    APayload.Add('<CommonGrp>');
    APayload.Add('<PymtType>Credit</PymtType>');
    if TimeOutReversalStatus.Required then
      APayload.Add('<ReversalInd>Timeout</ReversalInd>');

    // Payment type
    case ATransactionType of
      ttSale:
        begin
          APayload.Add('<TxnType>Sale</TxnType>');
        end;
      ttAuthOnly:
        begin
          APayload.Add('<TxnType>Authorization</TxnType>');
        end;
      ttCapture, ttForce:
        begin
          APayload.Add('<TxnType>Completion</TxnType>');
        end;
      ttCredit:
        begin
          // "Partial Reversal"
          // Note:  You can only do a partial reversal (refund) on an AuthOnly.
          // If it is a Sale, then it is a void, not a refund.
          if ReversalData.IsPartial and
            (ReversalData.OriginalTransactionType <> ttAuthOnly) and
            not ReversalData.IsPreSettlement then
            Exit;

          if ReversalData.IsPartial and
            (ReversalData.OriginalTransactionType = ttAuthOnly) then
          begin
            APayload.Add('<ReversalInd>Partial</ReversalInd>');
            // Must reflect the type of the original transaction
            if ReversalData.OriginalTransactionType = ttAuthOnly then
              APayload.Add('<TxnType>Authorization</TxnType>');
          end
          else
            APayload.Add('<TxnType>Refund</TxnType>');
        end;
      ttVoid:
        begin
          // A "void" is a full reversal
          APayload.Add('<ReversalInd>Void</ReversalInd>');
          if ReversalData.OriginalTransactionType = ttSale then
            APayload.Add('<TxnType>Sale</TxnType>')
          else if ReversalData.OriginalTransactionType = ttAuthOnly then
            APayload.Add('<TxnType>Authorization</TxnType>');
        end;
      ttAVSOnly:
        APayload.Add('<TxnType>Verification</TxnType>');
      ttAddToken:
        APayload.Add('<TxnType>TATokenRequest</TxnType>');
    end;

    APayload.Add(Format('<LocalDateTime>%s</LocalDateTime>', [FLocalDateTime]));
    APayload.Add(Format('<TrnmsnDateTime>%s</TrnmsnDateTime>',
      [FTranDateTime]));
    APayload.Add(Format('<STAN>%s</STAN>', [FSTAN]));

    APayload.Add(Format('<RefNum>%s</RefNum>', [TransactionID]));
    if not (ATransactionType = ttAddToken) then
      APayload.Add(Format('<OrderNum>%s</OrderNum>',
        [IQMS.Common.StringUtils.RightStr(IQMS.Common.StringUtils.LPadZero(IntToStr(SalesOrderID), 8), 8)]));

    // Project number.  This is assigned by FirstData for us,
    // and is hard-coded.
    APayload.Add('<TPPID>RIQ005</TPPID>');

    APayload.Add(Format('<TermID>%s</TermID>', [TerminalID]));
    APayload.Add(Format('<MerchID>%s</MerchID>', [MerchantID]));
    // Required for Level 2 processing
    if not (FTransactionType in [ttAddToken]) then
    begin
      APayload.Add('<MerchCatCode>5967</MerchCatCode>');
      APayload.Add('<POSEntryMode>010</POSEntryMode>');
      case TransactionMethod of
        tmCardPresent:
          APayload.Add('<POSCondCode>00</POSCondCode>');
        tmTelephone:
          APayload.Add('<POSCondCode>08</POSCondCode>');
        tmMail:
          APayload.Add('<POSCondCode>08</POSCondCode>');
        tmInternet:
          APayload.Add('<POSCondCode>05</POSCondCode>');
        // APayload.Add('<POSCondCode>59</POSCondCode>');
      end;

      // 00 = Direct Marketing
      APayload.Add('<TermCatCode>00</TermCatCode>');
      // 10 = Manual entry only
      APayload.Add('<TermEntryCapablt>10</TermEntryCapablt>');
      // For AVS, the amount must be zeroes
      if ATransactionType = ttAVSOnly then
        APayload.Add('<TxnAmt>000</TxnAmt>')
        // For a partial refund, the transaction amount is what will be on the
        // books after this refund is done.
      else if (ATransactionType = ttCredit) and ReversalData.IsPartial then
        APayload.Add(Format('<TxnAmt>%s</TxnAmt>',
          [FormatFloatValue(ReversalData.CurrentAmount -
          ReversalData.RequestedAmount)]))
        // Default action for all others:  just pass the transaction amount
      else
        APayload.Add(Format('<TxnAmt>%s</TxnAmt>',
          [FormatFloatValue(TransactionAmount)]));

      APayload.Add(Format('<TxnCrncy>%s</TxnCrncy>', [A3DigitCode]));

      // Terminal location (0=On premises; 1=Off premises)
      case Self.TransactionMethod of
        tmCardPresent:
          APayload.Add('<TermLocInd>0</TermLocInd>');
        tmTelephone, tmMail, tmInternet:
          APayload.Add('<TermLocInd>1</TermLocInd>');
      end;

      // Card capture capability (0=has no capability; 1=has capability
      APayload.Add('<CardCaptCap>0</CardCaptCap>');
    end;
    APayload.Add(Format('<GroupID>%s</GroupID>', [GroupID]));
    APayload.Add('</CommonGrp>');

    // Credit Card Group
    APayload.Add('<CardGrp>');

    // If the card is a token, don't provide AcctNum.  The token is provided
    // in a separate group, below.
    if not CreditCard.IsToken then
      APayload.Add(Format('<AcctNum>%s</AcctNum>', [CreditCard.CardNumber]));

    // CardExpiryDate is provided in the CardGrp even if this card is a token.
    if not (FTransactionType in [ttAddToken]) then
      APayload.Add(Format('<CardExpiryDate>%s</CardExpiryDate>',
        [CreditCard.Expire4DigitYearAsStr + CreditCard.ExpireMonthAsStr]));

    APayload.Add(Format('<CardType>%s</CardType>', [CardTypeStr]));

    if not TimeOutReversalStatus.Required and
      (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly]) then
    begin
      if not CreditCard.SecurityCode.IsEmpty then
      begin
        APayload.Add('<CCVInd>Prvded</CCVInd>');
        APayload.Add(Format('<CCVData>%s</CCVData>',
          [CreditCard.SecurityCode]));
      end
      else
        APayload.Add('<CCVInd>Ntprvd</CCVInd>');
    end;

    if not TimeOutReversalStatus.Required and (ATransactionType in [ttCapture])
    then
    begin
      // 07/14/2015 If values for AVS and CVV result codes are not
      // provided, do not add empty element.
      if not AOrigAVSResultCode.IsEmpty then
        APayload.Add(Format('<AVSResultCode>%s</AVSResultCode>',
          [AOrigAVSResultCode]));
      if not AOrigCCVResultCode.IsEmpty then
        APayload.Add(Format('<CCVResultCode>%s</CCVResultCode>',
          [AOrigCCVResultCode]));
    end;

    APayload.Add('</CardGrp>');

    // Additional Amount Group
    if (ATransactionType in [ttSale, ttAuthOnly]) then
    begin
      APayload.Add('<AddtlAmtGrp>');
      // Important:  This flag says we do NOT support partial approvals.
      // Partial authorization approvals (0=No; 1=Yes)
      APayload.Add
        ('<PartAuthrztnApprvlCapablt>0</PartAuthrztnApprvlCapablt>');
      APayload.Add('</AddtlAmtGrp>');
    end
    else if (ATransactionType in [ttCapture, ttForce]) then
    begin
      // The transaction amount for these must be the original
      // authorization amount, not the settlement amount.
      // Block 1:  FirstAuthAmt
      APayload.Add('<AddtlAmtGrp>');
      APayload.Add(Format('<AddAmt>%s</AddAmt>',
        [FormatFloatValue(SettlementData.OriginalAmount)]));
      APayload.Add(Format('<AddAmtCrncy>%s</AddAmtCrncy>', [A3DigitCode]));
      APayload.Add('<AddAmtType>FirstAuthAmt</AddAmtType>');
      APayload.Add('</AddtlAmtGrp>');
      // Block 2:  TotalAuthAmt
      APayload.Add('<AddtlAmtGrp>');
      APayload.Add(Format('<AddAmt>%s</AddAmt>',
        [FormatFloatValue(SettlementData.OriginalAmount)]));
      APayload.Add(Format('<AddAmtCrncy>%s</AddAmtCrncy>', [A3DigitCode]));
      APayload.Add('<AddAmtType>TotalAuthAmt</AddAmtType>');
      APayload.Add('</AddtlAmtGrp>');
    end
    else if (ATransactionType in [ttCredit, ttVoid]) then
    begin
      // Block 1:  FirstAuthAmt
      APayload.Add('<AddtlAmtGrp>');
      APayload.Add(Format('<AddAmt>%s</AddAmt>',
        [FormatFloatValue(ReversalData.OriginalAmount)]));
      APayload.Add(Format('<AddAmtCrncy>%s</AddAmtCrncy>', [A3DigitCode]));
      APayload.Add('<AddAmtType>FirstAuthAmt</AddAmtType>');
      APayload.Add('</AddtlAmtGrp>');

      // Block 2:  TotalAuthAmt
      APayload.Add('<AddtlAmtGrp>');
      APayload.Add(Format('<AddAmt>%s</AddAmt>',
        [FormatFloatValue(ReversalData.OriginalAmount)]));
      APayload.Add(Format('<AddAmtCrncy>%s</AddAmtCrncy>', [A3DigitCode]));
      APayload.Add('<AddAmtType>TotalAuthAmt</AddAmtType>');
      APayload.Add('</AddtlAmtGrp>');
    end;

    // Add this block if adding a token, or if the card is already a token
    // and it is being used in a transaction.
    if (ATransactionType = ttAddToken) or
      (CreditCard.IsToken and (ATransactionType in
      [ttSale, ttAuthOnly, ttCapture, ttCredit, ttForce, ttVoid, ttAVSOnly]))
    then
    begin
      APayload.Add('<TAGrp>');
      // SctyLvl: "This field must be submitted for TransArmor request
      // Winapi.Messages that are sending a previously acquired token instead
      // of the PAN/card number, Track 1, or Track 2 data."
      // "This field must be submitted in a TAKeyRequest transaction."
      // "This field must be submitted in a TATokenRequest transaction."
      APayload.Add('<SctyLvl>Tknizatn</SctyLvl>');
      // TknType: "This field indicates the Multi-pay token type
      // identifier used in a transaction. It is assigned by First Data."
      APayload.Add('<TknType>3528</TknType>');
      if CreditCard.IsToken and (CreditCard.CardNumber > '') { and
        not (ATransactionType in [ttCredit, ttAVSOnly]) } then
        APayload.Add(Format('<Tkn>%s</Tkn>', [CreditCard.CardNumber]));
      APayload.Add('</TAGrp>');
    end;

    // Provide only for Sale, Settlement, or Refund
    if (ATransactionType in [ttSale, ttCapture, ttCredit, ttForce]) then
    begin
      // ECommerce Group
      APayload.Add('<EcommGrp>');
      // APayload.Add('<EcommTxnInd>0</EcommTxnInd>');
      APayload.Add('<CustSvcPhoneNumber>4048900000</CustSvcPhoneNumber>');
      // APayload.Add('<EcommURL></EcommURL>');
      APayload.Add('</EcommGrp>');
    end;

    if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly, ttCapture, ttCredit,
      ttVoid]) then
    begin
      // Visa Group
      if (CreditCard.CardType = ccVisa) then
      begin
        APayload.Add('<VisaGrp>');
        if (ATransactionType in [ttCapture, ttVoid]) then
        begin
          AValue1 := OriginalResponse.Items.Values['VISA_ACI'];
          if AValue1 = '' then
            AValue1 := 'T';
          APayload.Add(Format('<ACI>%s</ACI>', [AValue1]));
        end
        else if (ATransactionType in [ttSale, ttAuthOnly, ttForce]) then
          APayload.Add('<ACI>Y</ACI>');

        if (ATransactionType in [ttCapture]) then
        begin
          AValue1 := OriginalResponse.Items.Values['VISA_CARDLEVEL'];
          if AValue1 > '' then
            APayload.Add(Format('<CardLevelResult>%s</CardLevelResult>',
              [AValue1]));
        end;

        AValue1 := OriginalResponse.Items.Values['VISA_TRANSID'];
        if (ATransactionType in [ttCapture, ttVoid]) then
          APayload.Add(Format('<TransID>%s</TransID>', [AValue1]));

        if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly, ttCapture,
          ttCredit]) then
          APayload.Add(Format('<VisaBID>%s</VisaBID>',
            [System.StrUtils.DupeString(' ', 10)]));

        if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly, ttCapture,
          ttCredit]) then
          APayload.Add('<VisaAUAR>000000000000</VisaAUAR>');

        // 1=Terminal is tax prompt capable
        if (ATransactionType in [ttSale, ttAuthOnly]) then
          APayload.Add('<TaxAmtCapablt>1</TaxAmtCapablt>');
        APayload.Add('</VisaGrp>');
      end
      // American Express Group
      else if (CreditCard.CardType = ccAmex) and
        (ATransactionType in [ttCapture, ttVoid]) then
      begin
        AValue1 := OriginalResponse.Items.Values['AMEX_POS_DATA'];
        AValue2 := OriginalResponse.Items.Values['AMEX_TRANSID'];
        if Trim(AValue1 + AValue2) > '' then
        begin
          APayload.Add('<AmexGrp>');
          if AValue1 > '' then
            APayload.Add(Format('<AmExPOSData>%s</AmExPOSData>',
              [AValue1]));
          if AValue2 > '' then
            APayload.Add(Format('<AmExTranID>%s</AmExTranID>',
              [AValue2]));
          APayload.Add('</AmexGrp>');
        end;
      end
      // MasterCard Group
      else if (CreditCard.CardType = ccMasterCard) and
        (ATransactionType in [ttCapture, ttVoid]) then
      begin
        AValue1 := OriginalResponse.Items.Values['MC_BANKNET_DATA'];
        if AValue1 > '' then
        begin
          APayload.Add('<MCGrp>');
          APayload.Add(Format('<BanknetData>%s</BanknetData>',
            [AValue1]));
          APayload.Add('</MCGrp>');
        end;
      end
      // Discover Group
      // Note:  FirstData sees Diners Club and JCB as Discover Card.
      else if (CreditCard.CardType in [ccDiscover, ccDinersClub, ccJCB]) and
        (ATransactionType in [ttCapture, ttVoid]) then
      begin
        AValue1 := OriginalResponse.Items.Values['DISCOVER_PROC_CODE'];
        AValue2 := OriginalResponse.Items.Values['DISCOVER_POS_ENTRY'];
        AValue3 := OriginalResponse.Items.Values['DISCOVER_RESPONSE_CODE'];
        AValue4 := OriginalResponse.Items.Values['DISCOVER_POS_DATA'];
        AValue5 := OriginalResponse.Items.Values
          ['DISCOVER_TRANS_QUALIFIER'];
        AValue6 := OriginalResponse.Items.Values['DISCOVER_NRID'];
        if Trim(AValue1 + AValue2 + AValue3 + AValue4 + AValue5 + AValue6) > ''
        then
        begin
          APayload.Add('<DSGrp>');
          if AValue1 > '' then
            APayload.Add(Format('<DiscProcCode>%s</DiscProcCode>',
              [AValue1]));
          if AValue2 > '' then
            APayload.Add(Format('<DiscPOSEntry>%s</DiscPOSEntry>',
              [AValue2]));
          if AValue3 > '' then
            APayload.Add(Format('<DiscRespCode>%s</DiscRespCode>',
              [AValue3]));
          if AValue4 > '' then
            APayload.Add(Format('<DiscPOSData>%s</DiscPOSData>',
              [AValue4]));
          if AValue5 > '' then
            APayload.Add
              (Format('<DiscTransQualifier>%s</DiscTransQualifier>',
              [AValue5]));
          if AValue6 > '' then
            APayload.Add(Format('<DiscNRID>%s</DiscNRID>', [AValue6]));
          APayload.Add('</DSGrp>');
        end;
      end;
    end;

    // AVS
    // 07/14/2015 Changed address information from ShipTo data to
    // cardholder data.  According to FirstData documentation for
    // topic "AVSBillingAddr":
    // "This field contains the street address of the customer.
    // This field is used to submit the street address of the cardholder
    // when attempting to perform address verification."
    if (ATransactionType in [ttSale, ttAuthOnly, ttAVSOnly]) and
      (not CreditCard.CustomerAddress.IsEmpty or
      not CreditCard.CustomerPostalCode.IsEmpty) then
    begin
      APayload.Add('<CustInfoGrp>');
      if not CreditCard.CustomerAddress.IsEmpty then
        APayload.Add(Format('<AVSBillingAddr>%s</AVSBillingAddr>',
          [IQMS.Common.StringUtils.LeftStr(CreditCard.CustomerAddress, 30)]));
      if not CreditCard.CustomerPostalCode.IsEmpty then
        APayload.Add(Format('<AVSBillingPostalCode>%s</AVSBillingPostalCode>',
          [IQMS.Common.StringUtils.LeftStr(CreditCard.CustomerPostalCode, 9)]));
      APayload.Add('</CustInfoGrp>');
    end;

    // Add Level 2 block
    if (CreditCard.CardType in [ccVisa, ccMasterCard, ccAmex]) and
      (ATransactionType in [ttSale, ttCapture]) then
    begin
      if (ProcessingClass = pclLevel2) then
      begin
        APayload.Add('<PurchCardlvl2Grp>');
        // if (CreditCard.CardType in [ccVisa, ccMasterCard]) then
        // begin
        if not TaxExempt and (TaxAmount > 0) then
          APayload.Add(Format('<TaxAmt>%s</TaxAmt>',
            [FormatFloatValue(TaxAmount)]));
        { Must be present for Visa and MasterCard Purchase Card transactions only:
          0 – No tax information provided
          1 – Tax Amount is provided
          2 – Purchase item is tax exempt or non-taxable }
        if TaxExempt then
          APayload.Add('<TaxInd>2</TaxInd>')
        else if (TaxAmount > 0) then
          APayload.Add('<TaxInd>1</TaxInd>')
        else
          APayload.Add('<TaxInd>0</TaxInd>');
        // end;
        APayload.Add(Format('<PurchIdfr>%s</PurchIdfr>',
          [IQMS.Common.StringUtils.LeftStr(PurchaseOrderNumber, 25)]));
        APayload.Add(Format('<PCOrderNum>%s</PCOrderNum>',
          [IQMS.Common.StringUtils.LeftStr(SalesOrderNumber, 17)]));
        APayload.Add(Format('<DiscntAmt>%s</DiscntAmt>',
          [FormatFloatValue(DiscountAmount)]));
        APayload.Add(Format('<FrghtAmt>%s</FrghtAmt>',
          [FormatFloatValue(FreightAmount)]));
        APayload.Add(Format('<DutyAmt>%s</DutyAmt>',
          [FormatFloatValue(Level3Options.DutyAmount)]));
        APayload.Add(Format('<DestPostalCode>%s</DestPostalCode>',
          [Destination.PostalCode]));
        APayload.Add(Format('<DestCtryCode>%s</DestCtryCode>',
          [Destination.CountryCode3Digit]));
        // APayload.Add(Format('<ShipFromPostalCode>%s</ShipFromPostalCode>',
        // [Sender.PostalCode]));
        APayload.Add(Format('<MerchTaxID>%s</MerchTaxID>',
          [Level3Options.MerchantTaxID]));
        if (CreditCard.CardType in [ccAmex]) then
          APayload.Add(Format('<ProdDesc>%s</ProdDesc>',
            [SalesOrderNumber]));
        APayload.Add('</PurchCardlvl2Grp>');
      end;
    end;

    // Voids and Refunds - original transaction data
    if TimeOutReversalStatus.Required or
      (ATransactionType in [ttVoid, ttCapture]) then
    begin
      APayload.Add('<OrigAuthGrp>');
      // Response Transaction ID
      if not TimeOutReversalStatus.Required then
      begin
        if AOrigAuthID = '' then
          // cc_rscstr.cTXT0000694 = 'Original Authorization ID (OrigAuthID) not provided.';
          raise Exception.Create(cc_rscstr.cTXT0000694);
        APayload.Add(Format('<OrigAuthID>%s</OrigAuthID>', [AOrigAuthID]));
      end;
      APayload.Add(Format('<OrigLocalDateTime>%s</OrigLocalDateTime>',
        [AOrigLocalDateTime]));
      APayload.Add(Format('<OrigTranDateTime>%s</OrigTranDateTime>',
        [AOrigTranDateTime]));
      APayload.Add(Format('<OrigSTAN>%s</OrigSTAN>', [AOrigSTAN]));
      if not TimeOutReversalStatus.Required then
        APayload.Add(Format('<OrigRespCode>%s</OrigRespCode>',
          [AOrigRespCode]));
      APayload.Add('</OrigAuthGrp>');
    end
    else if (ATransactionType = ttForce) then
    begin
      APayload.Add('<OrigAuthGrp>');
      APayload.Add(Format('<OrigAuthID>%s</OrigAuthID>',
        [FForceVoiceAuthCode]));
      APayload.Add(Format('<OrigLocalDateTime>%s</OrigLocalDateTime>',
        [FLocalDateTime]));
      APayload.Add(Format('<OrigTranDateTime>%s</OrigTranDateTime>',
        [FTranDateTime]));
      APayload.Add(Format('<OrigSTAN>%s</OrigSTAN>', [STAN]));
      APayload.Add('<OrigRespCode>000</OrigRespCode>');
      APayload.Add('</OrigAuthGrp>');
    end;

    if TimeOutReversalStatus.Required or (ATransactionType = ttVoid) then
      APayload.Add('</ReversalRequest>')
    else if (ATransactionType = ttAddToken) then
      APayload.Add('</TransArmorRequest>')
    else
      APayload.Add('</CreditRequest>');

    APayload.Add('</GMF>');
    APayloadText := IQMS.Common.StringUtils.StrTran(APayload.Text, #13, '');
    APayloadText := IQMS.Common.XML.XMLEncode(APayloadText, []);
    FCommand.Add(APayloadText);
  finally
    FreeAndNil(APayload);
  end;
  FCommand.Add('</Payload>');
  FCommand.Add('</Transaction>');
  FCommand.Add('</Request>');
end;

function TEPaymentFirstData.Refund: Boolean;
var
  s: string;
begin
  // This method evaluates for a partial credit, giving the amount
  // parameters. Important Note:  This only applies to Visa.
  // s := Response.GetReturnValue('OrigSTAN');
  s := OriginalResponse.Items.Values['RESPONSE_STAN'];
  if s = '' then
    raise Exception.Create
      ('Application Error:  Reference Number (STAN) is required.');
  IQAssert(not TransactionID.IsEmpty, 'TransactionID is required.');
  Result := inherited Refund;
end;

function TEPaymentFirstData.Void: Boolean;
var
  s: string;
begin
  s := OriginalResponse.Items.Values['RESPONSE_STAN'];
  if s = '' then
    raise Exception.Create
      ('Application Error:  Reference Number (STAN) is required.');
  IQAssert(not TransactionID.IsEmpty, 'TransactionID is required.');
  // TransactionID
  // // ReversalData.ReferenceNumber
  // IQAssert(FSTAN > 0,
  // 'Application Error:  Reference Number (STAN) is required.');
  //
  // if not IQMS.Common.Numbers.IsStringValidInteger(ReversalData.ReferenceNumber, FSTAN) then
  // raise Exception.CreateFmt
  // ('Application Error:  Invalid reference number:  %s.',
  // [ReversalData.ReferenceNumber]);

  Result := inherited Void;

end;

procedure TEPaymentFirstData.ParseResponseText;
var
  DOM: IXMLDocument;
  Node: IXMLNode;
  NodeList: IXMLNodeList;
  i: Integer;
  APayloadXML: string;
  ADatawireCode, ADatawireStatus, ADatawireError: string;
  s: string;
  ACode: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  // STAN must go in RESPONSE_REFERENCE_NUMBER
  if Response.ResponseData.IsEmpty then
    Exit;

  Response.TransactionID := Self.TransactionID;

  // NOTE:  Use of DOM is required because some elements embed important
  // information in attributes.
  DOM := TXMLDocument.Create(nil);
  DOM.LoadFromXML(Response.ResponseData);
  //  Example of response xml for a time-out reversal:
  //
  //  * ?xml version="1.0"?>
  //  * <Response xmlns="http://securetransport.dw/rcservice/xml" Version="3">
  //  *   <RespClientID>
  //  *     <DID>00010813113639407692</DID>
  //  *     <ClientRef>1799VIQv2014.1</ClientRef>
  //  *   </RespClientID>
  //  *   <Status StatusCode="OK"/>
  //  *   <TransactionResponse>
  //  *     <ReturnCode>205</ReturnCode>
  //  *     <Payload Encoding="xml_escape"/>
  //  *   </TransactionResponse>
  //  * </Response>

  // Datawire:  Communication status
  if TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement, 'Status', Node) then
  begin
    ADatawireError := Node.Text;
    // OK | AuthenticationError | UnknownServiceID | XMLError | OtherError
    if Node.HasAttribute('StatusCode') then
      ADatawireStatus := Node.Attributes['StatusCode'];
  end;

  ADatawireCode := IQMS.Common.XML.GetXMLTagValue(Response.ResponseData,
    'Response\TransactionResponse\ReturnCode');

  // If processing a time-out reversal, check the result here.  Do not
  // go any further because the Response data should not be modified.
  // We just want to know if the message was received.
  if TimeOutReversalStatus.Required and TimeOutReversalStatus.Processing then
  begin
    // StatusCode = 'OK'
    // ReturnCode = '000'
    if (CompareText(ADatawireStatus, 'OK') = 0) and
      (CompareText(ADatawireCode, '000') = 0) then
      TimeOutReversalStatus.Resolved := True;
    // Always exit at this point, regardless of the result
    Exit;
  end;

  // Testing time-out:
  // ADatawireCode := '203';

  // To allow retry, the status cannot be any one of these values.
  FRetry := (CompareText(ADatawireStatus, 'OK') <> 0) and
    (CompareText(ADatawireStatus, 'AuthenticationError') <> 0) and
    (CompareText(ADatawireStatus, 'UnknownServiceID') <> 0) and
    (CompareText(ADatawireStatus, 'XMLError') <> 0) and
    (CompareText(ADatawireStatus, 'OtherError') <> 0);

  // Possible Datawire status strings:
  // OK | AuthenticationError | UnknownServiceID | XMLError | OtherError
  if (CompareText(ADatawireStatus, 'OK') <> 0) then
  begin
    Response.StatusClass := rcError;

    if ADatawireCode > '' then
      Response.StatusCode := ADatawireCode
    else if ADatawireStatus > '' then
      Response.StatusCode := ADatawireStatus;

    if ADatawireError > '' then
      Response.StatusDescription := ADatawireError
    else
      Response.StatusDescription := 'Datawire error';

    Response.StatusClass := rcError;

    if ADatawireCode > '' then
      Response.ErrorCode := ADatawireCode
    else if ADatawireStatus > '' then
      Response.ErrorCode := ADatawireStatus;

    if ADatawireError > '' then
      Response.ErrorDescription := ADatawireError
    else
      Response.ErrorDescription := 'Datawire error';

    Response.ErrorText := Format('%s: %s.',
      [Response.StatusCode, Response.StatusDescription]);

    if CompareText(ADatawireStatus, 'AuthenticationError') = 0 then
      Response.ErrorDetails := 'Datawire authentication error.  ' +
        'Please verify your merchant account settings are correct.'
    else
      Response.ErrorDetails := '[Datawire error]';

    Exit;
  end;

  if (CompareText(ADatawireCode, '000') <> 0) then
  begin
    if ADatawireCode = '203' then
      ADatawireError := 'Host Drop.  The processor’s Host ' +
        'disconnected during the transaction before sending a response.'
    else if ADatawireCode = '204' then
    begin
      ADatawireError := 'Host Comm Error.  An error was encountered ' +
        'while communicating with the processor’s Host.';
      FRetry := False;
    end
    else if ADatawireCode = '205' then
      ADatawireError := 'No Response. No response from the ' +
        'processor’s Host.'
    else if ADatawireCode = '206' then
      ADatawireError := 'Host Send Error. An error was encountered ' +
        'when sending the request to the processor and the Host ' +
        'daemon cannot continue sending packets to the processor ' +
        'because the connection is broken.'
    else if ADatawireCode = '405' then
      ADatawireError := 'Datawire Secure Data Transport Network ' +
        'Timeout. The request could not be processed.'
    else if ADatawireStatus = '505' then
      ADatawireError := 'Network Error. The request could not be ' +
        'processed.'
    else if ADatawireCode = '008' then
      ADatawireError := 'Network Error. The request could not be ' +
        'processed.';

    Response.StatusClass := rcError;
    Response.StatusCode := ADatawireCode;
    Response.StatusDescription := ADatawireError;
    Response.ErrorCode := ADatawireCode;
    Response.ErrorDescription := ADatawireError;
    Response.ErrorText := Format('%s: %s.',
      [Response.StatusCode, Response.StatusDescription]);
    Response.ErrorDetails := '[Datawire error]';

    // If the DataWire response is one of these codes, then
    // we need to interecept everything here and send a "time out
    // reversal" command:
    //
    // 203 Host Drop.  The processor’s Host disconnected during the transaction before sending a response.
    // 204 Host Comm Error.  An error was encountered while communicating with the processor’s Host.
    // 205 No Response. No response from the processor’s Host.
    // 206 Host Send Error. An error was encountered when sending the request to the processor and the Host daemon cannot continue sending packets to the processor because the connection is broken.
    // 405 Datawire Secure Data Transport Network Timeout. The request could not be processed.
    // 505 Network Error. The request could not be processed.
    // 008 Network Error. The request could not be processed.
    //
    // Timeout Reversal – This transaction is used when the merchant does not receive a
    // response to a transaction. At that point it is unknown whether the host received
    // the transaction or not; therefore a timeout reversal request must be submitted.
    // Upon the successful completion of the timeout reversal, the original transaction
    // may be sent again. The merchant is responsible for sending the timeout reversals.
    // Note: Timeout reversals are not supported on Check transactions.
    if not (FTransactionType in [ttAVSOnly]) and
      IQMS.Common.StringUtils.StrInList(ADatawireCode, ['203', '204', '205', '206', '405',
      '505', '008']) then
      TimeOutReversalStatus.Required := True;
  end
  else
  begin
    Response.StatusClass := rcSuccess;
    Response.StatusCode := ADatawireCode; // 000
    // Response.StatusDescription := 'APPROVAL';
    // Response.ApprovalCode := 'APPROVAL';
  end;

  // Message details
  if TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement, 'Payload', Node) then
  begin
    APayloadXML := IQMS.Common.XML.XMLDecode(Node.Text);
    // Example of Authorization Response:
    // *       <GMF xmlns="com/firstdata/Merchant/gmfV2.08">
    // *         <CreditResponse>
    // *           <CommonGrp>
    // *             <PymtType>Credit</PymtType>
    // *             <TxnType>Authorization</TxnType>
    // *             <LocalDateTime>20140415145119</LocalDateTime>
    // *             <TrnmsnDateTime>20140415175128</TrnmsnDateTime>
    // *             <STAN>000127</STAN>
    // *             <RefNum>323</RefNum>
    // *             <OrderNum>00003336</OrderNum>
    // *             <TermID>00000001</TermID>
    // *             <MerchID>RCTST0000000200</MerchID>
    // *             <TxnAmt>63110</TxnAmt>
    // *             <TxnCrncy>840</TxnCrncy>
    // *           </CommonGrp>
    // *           <CardGrp>
    // *             <AcctNum>4264281511117771</AcctNum>
    // *             <AVSResultCode>Y</AVSResultCode>
    // *             <CCVResultCode>Match</CCVResultCode>
    // *           </CardGrp>
    // *           <VisaGrp>
    // *             <ACI>V</ACI>
    // *             <SourceReasonCode>4</SourceReasonCode>
    // *             <TransID>014105875980638G410</TransID>
    // *             <TaxAmtCapablt>TX</TaxAmtCapablt>
    // *           </VisaGrp>
    // *           <RespGrp>
    // *             <RespCode>000</RespCode>
    // *             <AuthID>OK5933</AuthID>
    // *             <AddtlRespData>APPROVAL</AddtlRespData>
    // *           </RespGrp>
    // *         </CreditResponse>
    // *       </GMF>
    //
    // Example of Token Request Response:
    // *       <GMF xmlns="com/firstdata/Merchant/gmfV2.08">
    // *         <TransArmorResponse>
    // *           <CommonGrp>
    // *             <PymtType>Credit</PymtType>
    // *             <TxnType>TATokenRequest</TxnType>
    // *             <LocalDateTime>20140904082608</LocalDateTime>
    // *             <TrnmsnDateTime>20140904112639</TrnmsnDateTime>
    // *             <STAN>001588</STAN>
    // *             <RefNum>2209</RefNum>
    // *             <TermID>00000001</TermID>
    // *             <MerchID>RCTST0000000097</MerchID>
    // *           </CommonGrp>
    // *           <TAGrp>
    // *             <Tkn>741173961551118</Tkn>
    // *           </TAGrp>
    // *           <RespGrp>
    // *             <RespCode>000</RespCode>
    // *             <AddtlRespData>APPROVAL</AddtlRespData>
    // *           </RespGrp>
    // *         </TransArmorResponse>
    // *       </GMF>

    if APayloadXML > '' then
    begin
      // NOTE:  Experimented with additional TXMLDocument, but found
      // it unnecessary.  It was faster, with fewer lines of code,
      // to use IQMS.Common.XML.GetXMLTagValue.
      if (FTransactionType in [ttSale, ttAuthOnly]) then
      begin
        Response.ReferenceNumber := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\CommonGrp\RefNum');
        s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\CommonGrp\STAN');
        if s = '' then
          s := FSTAN;
        Response.AddReturnValue('RESPONSE_STAN', s);

        // Note:  You can obtain the response values for TrnmsnDateTime
        // and LocalDateTime, but don't.  They are useless.  Instead
        // of sending the response values, you have to send the values
        // in the original transaction.
        // s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
        // 'CreditResponse\CommonGrp\TrnmsnDateTime');
        // Response.TimeStamp := s;
        // Response.AddReturnValue('RESPONSE_TRANSMISSION_TIMESTAMP', s);
        // Response.AddReturnValue('RESPONSE_LOCAL_TIMESTAMP',
        // IQMS.Common.XML.GetXMLTagValue(APayloadXML,
        // 'CreditResponse\CommonGrp\LocalDateTime'));
        Response.AddReturnValue('RESPONSE_TRANSMISSION_TIMESTAMP',
          FTranDateTime);
        Response.AddReturnValue('RESPONSE_LOCAL_TIMESTAMP',
          FLocalDateTime);

        // Visa Group:
        //  *  <VisaGrp>
        //  *    <ACI> T </ACI>
        //  *    <SourceReasonCode> 4 </SourceReasonCode>
        //  *    <TransID> 014128124226382G228 </TransID>
        //  *    <TaxAmtCapablt> TX </TaxAmtCapablt>
        //  *  </VisaGrp>

        Response.AddReturnValue('VISA_ACI',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\VisaGrp\ACI'));
        Response.AddReturnValue('VISA_CARDLEVEL',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\VisaGrp\CardLevelResult'));
        Response.AddReturnValue('VISA_REASON_CODE',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\VisaGrp\SourceReasonCode'));
        Response.AddReturnValue('VISA_TRANSID',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\VisaGrp\TransID'));
        Response.AddReturnValue('VISA_AMTCAPAB',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\VisaGrp\TaxAmtCapablt'));

        // AmEx Group:
        //  *  <AmexGrp>
        //  *    <AmExPOSData> 660020S00001 </AmExPOSData>
        //  *    <AmExTranID> 014128522346387 </AmExTranID>
        //  *  </AmexGrp>

        Response.AddReturnValue('AMEX_POS_DATA',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\AmexGrp\AmExPOSData'));
        Response.AddReturnValue('AMEX_TRANSID',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\AmexGrp\AmExTranID'));

        // MasterCard Group:
        //  *  <MCGrp>
        //  *    <BanknetData> 0508MCC460394 </BanknetData>
        //  *  </MCGrp>
        Response.AddReturnValue('MC_BANKNET_DATA',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\MCGrp\BanknetData'));

        // Discover Group:
        //  *  <DSGrp>
        //  *    <DiscProcCode> 000000 </DiscProcCode>
        //  *    <DiscPOSEntry> 0100 </DiscPOSEntry>
        //  *    <DiscRespCode> 00 </DiscRespCode>
        //  *    <DiscPOSData> 0002100000700 </DiscPOSData>
        //  *    <DiscTransQualifier> 00 </DiscTransQualifier>
        //  *    <DiscNRID> 139956482123563 </DiscNRID>
        //  *  </DSGrp>
        Response.AddReturnValue('DISCOVER_PROC_CODE',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscProcCode'));
        Response.AddReturnValue('DISCOVER_POS_ENTRY',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscPOSEntry'));
        Response.AddReturnValue('DISCOVER_RESPONSE_CODE',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscRespCode'));
        Response.AddReturnValue('DISCOVER_POS_DATA',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscPOSData'));
        Response.AddReturnValue('DISCOVER_TRANS_QUALIFIER',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscTransQualifier'));
        Response.AddReturnValue('DISCOVER_NRID',
          IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\DSGrp\DiscNRID'));
      end;

      if (FTransactionType in [ttSale, ttAuthOnly, ttCapture, ttCredit,
        ttForce]) then
        // AuthID:  The value assigned by the authorizer and returned in
        // the response to the authorization request.  This field is
        // returned if the transaction was approved.
        Response.ProcessorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\RespGrp\AuthID')
      else if (FTransactionType in [ttVoid]) then
        Response.ProcessorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'ReversalResponse\RespGrp\AuthID');

      // <RespGrp>
      //  <RespCode>000</RespCode>
      //  <AuthID>OK6793</AuthID>
      //  <AddtlRespData>APPROVAL</AddtlRespData>
      //  </RespGrp>
      // RespCode:  This field contains a value representing the
      // status of the transaction for the given processor
      if (FTransactionType in [ttSale, ttAuthOnly, ttCapture, ttCredit,
        ttForce, ttAVSOnly]) then
        Response.ReturnCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\RespGrp\RespCode')
      else if (FTransactionType in [ttVoid]) then
        Response.ReturnCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'ReversalResponse\RespGrp\RespCode')
        // Tokenization response
      else if (FTransactionType in [ttAddToken]) then
        Response.ReturnCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'TransArmorResponse\RespGrp\RespCode');

      // AddtlRespData: This field contains additional data that may be
      // returned in an authorization response message. This field could
      // contain values that describe items such as the reason for a
      // decline, the field in error, etc.
      if (FTransactionType in [ttSale, ttAuthOnly, ttCapture, ttCredit,
        ttForce, ttAVSOnly]) then
        s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\RespGrp\AddtlRespData')
      else if (FTransactionType in [ttVoid]) then
        s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'ReversalResponse\RespGrp\AddtlRespData')
      else if (FTransactionType in [ttAddToken]) then
        s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'TransArmorResponse\RespGrp\AddtlRespData');

      if not FRetry then
        FRetry := Pos(s, 'PLEASE RETRY') > 0;

      if s > '' then
      begin
        Response.StatusDescription := s;
        Response.AddReturnValue('AddtlRespData', s);
      end;

      // SttlmDate: This field contains the date the transaction will
      // be settled.
      if FTransactionType = ttCapture then
      begin
        s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'CreditResponse\RespGrp\SttlmDate');
        Response.AddReturnValue('SttlmDate', s);
      end;

      // ErrorData:  A code and description returned in the response
      // message that describes an error condition encountered when
      // processing the transaction.

      // Basic transaction error.  This occurs if there is an XML error.
      Response.ErrorDescription := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
        'RejectResponse\RespGrp\ErrorData');
      if not Response.ErrorDescription.IsEmpty then
      begin
        Response.ErrorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'RejectResponse\RespGrp\RespCode');
        Response.ReturnCode := Response.ErrorCode;
      end;

      // Tokenization error
      if (FTransactionType in [ttAddToken]) then
      begin
        Response.ErrorDescription := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'TransArmorResponse\RespGrp\ErrorData');
        if not Response.ErrorDescription.IsEmpty then
        begin
          Response.ErrorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
            'TransArmorResponse\RespGrp\RespCode');
          Response.ReturnCode := Response.ErrorCode;
        end;
      end;

      // If there is no RejectResponse error, try getting the error
      // based on the transaction type.
      if Response.ErrorDescription = '' then
      begin
        if FTransactionType = ttVoid then
        begin
          Response.ErrorDescription := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
            'ReversalResponse\RespGrp\ErrorData');
          if not Response.ErrorDescription.IsEmpty then
          begin
            Response.ErrorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
              'ReversalResponse\RespGrp\RespCode');
            Response.ReturnCode := Response.ErrorCode;
          end;
        end
        else
        begin
          Response.ErrorDescription := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
            'CreditResponse\RespGrp\ErrorData');
          if not Response.ErrorDescription.IsEmpty then
          begin
            Response.ErrorCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
              'CreditResponse\RespGrp\RespCode');
            Response.ReturnCode := Response.ErrorCode;
          end;
        end;
      end;

      if not Response.ErrorDescription.IsEmpty then
      begin
        Response.ErrorText :=
          Format('%s: %s', [Response.ErrorCode,
          Response.ErrorDescription]);
        Response.StatusClass := rcError;
        Response.StatusCode := Response.ErrorCode;
        Response.StatusDescription := Response.ErrorDescription;
        Response.ApprovalCode := '';
        Response.Approved := False;
      end;

      // 08/11/2014
      if (FTransactionType = ttAddToken) then
      begin
        Response.NewToken := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
          'TransArmorResponse\TAGrp\Tkn');
        if (Response.StatusClass = rcSuccess) then
          Response.TokenStatusClass := trcSuccess
        else
          Response.TokenStatusClass := trcFailure;
        Response.TokenStatusCode := Response.StatusCode;
        Response.TokenStatusDescription := Response.StatusDescription;
      end;

      // <CardGrp>
      //  <AcctNum>4264281511117771</AcctNum>
      //  <AVSResultCode>Y</AVSResultCode>
      //  <CCVResultCode>Match</CCVResultCode>
      //  </CardGrp>
      // AVS
      Response.AVSCode := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
        'CreditResponse\CardGrp\AVSResultCode');
      // CVV - the result will not be standard.
      s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
        'CreditResponse\CardGrp\CCVResultCode');
      // FirstData values:
      //  Match – Values match
      //  NoMtch – Values do not match
      //  NotPrc – Not processed
      //  NotPrv – Value not provided
      //  NotPrt – Issuer not participating
      //  Unknwn – Unknown
      // Convert the non-standard result to a standard value
      Response.SetNonStandardSecurityResultCode(s,
        cc_firstdata_utils.GetStandardSecurityCode(s));

      // <VisaGrp>
      //  <ACI>V</ACI>
      //  <SourceReasonCode>4</SourceReasonCode>
      //  <TransID>014099058522084G488</TransID>
      //  <TaxAmtCapablt>TX</TaxAmtCapablt>
      //  </VisaGrp>
      // s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
      //  'CreditResponse\VisaGrp\TransID');
      //  if s > '' then
      //  Response.TransactionID := s;
      //
      //  s := IQMS.Common.XML.GetXMLTagValue(APayloadXML,
      //  'CreditResponse\VisaGrp\AmexGrp');
      //  if s > '' then
      //  Response.TransactionID := s;
    end;
  end;

  if not TimeOutReversalStatus.Required then
  begin
    // If an error, including a datawire error, was encountered,
    // just treat it as an error
    if not Response.ErrorText.IsEmpty then
    begin
      Response.StatusClass := rcError;
      Response.StatusCode := Response.ErrorCode;
      Response.ErrorDescription := Response.ErrorText;
      Response.Approved := False;
    end
    else
    begin
      // The FirstData status text will be APPROVAL, REFERRAL, etc.
      Response.ApprovalCode := Response.StatusDescription;
      // Initialize these variables before analyzing
      ADescription := Response.StatusDescription;
      ACode := Response.ReturnCode;
      // Get the response class and user-friendly description
      // based on the return code
      ProcessResponseStatusCode(Response.ReturnCode, ACode, ADescription,
        AResponseClass);
      // Set the status values
      Response.StatusDescription := ADescription;
      Response.StatusCode := ACode;
      Response.StatusClass := AResponseClass;
      // If an error is encountered, then set the error values
      if (Response.StatusClass <> rcSuccess) and
        (Response.ErrorCode = '') then
      begin
        Response.ErrorCode := Response.StatusCode;
        Response.ErrorDescription := ADescription;
        if not Response.ErrorCode.IsEmpty and
          not Response.ErrorDescription.IsEmpty
        then
          Response.ErrorText := Format('%s: %s',
            [Response.ErrorCode, Response.ErrorDescription])
        else
          Response.ErrorText := Response.ErrorDescription;
      end;
      // Set the approved boolean value
      Response.Approved := Response.StatusClass = rcSuccess;
    end;
  end;

  if not TimeOutReversalStatus.Required and
    not (FTransactionType in [ttAVSOnly]) and
    (CompareText(Response.ReturnCode, '911') = 0) then
    TimeOutReversalStatus.Required := True;

  if TimeOutReversalStatus.Required and
    (FTimeOutReversalRec.OrigSTAN = '') then
  begin
    FTimeOutReversalRec.OrigSTAN := FSTAN;
    FTimeOutReversalRec.OrigAuthID := Response.ProcessorCode;
    FTimeOutReversalRec.OrigLocalDateTime := FLocalDateTime;
    FTimeOutReversalRec.OrigTranDateTime := FTranDateTime;
    FTimeOutReversalRec.OrigRespCode := Response.ReturnCode;
    FTimeOutReversalRec.OrigAVSResultCode := Response.AVSCode;
    FTimeOutReversalRec.OrigCCVResultCode := Response.SecurityResultCode;
  end;

  // 06/18/2014 Allow retry if not approved
  FRetry := TimeOutReversalStatus.Required or not Response.Approved;

end;

procedure TEPaymentFirstData.ProcessResponseStatusCode(const AResponse
  : ShortString; var ACode: ShortString; var ADescription: string;
  var AResponseClass: TResponseClass);
begin
  ADescription := cc_firstdata_utils.GetResponseText(AResponse, AResponseClass);
  ACode := AResponse;
  if ACode = '' then
    ACode := Response.StatusCode;
  if ADescription = '' then
    ADescription := Response.StatusDescription;
end;

{$ENDREGION 'TEPaymentFirstData'}

{$REGION 'TEPaymentPayFlowPro'}

{ TEPaymentPayFlowPro }

constructor TEPaymentPayFlowPro.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HttpContentType := ctXML;
  FCountryCodeFormat := cctChr2;
  FGateway := cgwPayFlowPro;
  FNonReferencedCreditsAllowed := False;
end;

procedure TEPaymentPayFlowPro.GetURL(var AURL: string; var APort: Integer);
begin
  APort := 0;
  if TestMode then
    AURL := 'https://pilot-payflowpro.paypal.com'
  else
    AURL := 'https://payflowpro.paypal.com';
end;

procedure TEPaymentPayFlowPro.Validate;
begin
  inherited Validate;
  ValidateSetting(MerchantLogin, 'Merchant Login');
  ValidateSetting(MerchantPassword, 'Merchant Password');
  ValidateSetting(MerchantPartner, 'Merchant Partner');
  ValidateSetting(MerchantVendor, 'Merchant Vendor');
end;

function TEPaymentPayFlowPro.CardTypeStr: string;
begin
  // These are the only cards supported by PayFlowPro
  case CreditCard.CardType of
    ccVisa:
      Result := 'Visa';
    ccMasterCard:
      Result := 'MasterCard';
    ccAmex:
      Result := 'Amex';
    ccDiscover:
      Result := 'Discover';
    ccDinersClub:
      Result := 'DinersClub';
    ccJCB:
      Result := 'JCB';
  else
    // We raise an exception because this data is required, and
    // is limited to a short list of values.
    raise Exception.Create('Card type not supported by PayFlow Pro.');
  end;
end;

function TEPaymentPayFlowPro.ToDateTime(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('YYYY-MM-DD HH:NN:SS', AValue);
end;

function TEPaymentPayFlowPro.ToDate(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('YYYYMMDD', AValue);
end;

procedure TEPaymentPayFlowPro.AddTextFieldWithLength(const AField,
  AValue: string; const AMaxLength: Integer);
var
  AFixedValue: string;
  ALength: Integer;
begin
  // From the documentation (pp_payflowpro_guide.pdf, page 21:
  // To use special characters in the value of a name-value pair, use
  // a length tag. The length tag specifies the exact number of
  // characters and spaces that appear in the value. The following
  // name-value pairs are valid.
  // NAME[14]=Ruff & Johnson
  // COMMENT1[7]=Level=5
  if not String.IsNullOrWhiteSpace(AValue) then
  begin
    AFixedValue := FixText(Trim(AValue));
    ALength := Min(AMaxLength, Length(AFixedValue));
    AddFieldA(Format('%s [%d]', [AField, ALength]), AFixedValue, ALength);
  end;
end;

procedure TEPaymentPayFlowPro.BuildCommand(
  const ATransactionType: TTransactionType);
begin
  FTransactionType := ATransactionType;
  FCommand.Clear;
  FCommand.AllowEmptyValues := False;

  case ATransactionType of
    ttSale:
      begin
        // S = Sale transaction
        AddFieldA('TRXTYPE', 'S');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttAuthOnly:
      begin
        // A = Authorization
        AddFieldA('TRXTYPE', 'A');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttCapture:
      begin
        // D = Delayed Capture
        AddFieldA('TRXTYPE', 'D');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttCredit:
      begin
        // C = Credit
        AddFieldA('TRXTYPE', 'C');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttVoid:
      begin
        // V = Void
        AddFieldA('TRXTYPE', 'V');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttAVSOnly:
      begin
        // I = Inquiry
        AddFieldA('TRXTYPE', 'A');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
    ttForce:
      begin
        // F = Voice Authorization
        AddFieldA('TRXTYPE', 'F');
        // C = Credit Card
        AddFieldA('TENDER', 'C');
      end;
  else
    begin
      FCommand.Clear;
      Exit;
    end;
  end;

  // User authentication
  AddFieldA('USER', Self.MerchantLogin);
  AddFieldA('VENDOR', Self.MerchantVendor);
  AddFieldA('PARTNER', Self.MerchantPartner);
  AddFieldA('PWD', Self.MerchantPassword);

  // Original Transaction ID.  This is the value that was
  // returned in the element, PNREF.
  if (ATransactionType in [ttCapture, ttCredit, ttVoid]) then
    AddFieldA('ORIGID', TransactionID);

  // Non-referenced credits
  if (ATransactionType in [ttCredit]) and FNonReferencedCreditsAllowed then
  begin
    AddFieldA('ACCT', CreditCard.CardNumber);
    // Example: submit '012016', instead of the customary, '0116'.
    AddFieldA('EXPDATE', CreditCard.ExpireMonthAsStr +
      CreditCard.Expire4DigitYearAsStr);
  end;

  if ATransactionType = ttForce then
    AddFieldA('AUTHCODE', FForceVoiceAuthCode);

  if CanSendCardData(ATransactionType) then
  begin
    AddFieldA('ACCT', CreditCard.CardNumber);
    // Example: submit '012016', instead of the customary, '0116'.
    AddFieldA('EXPDATE', CreditCard.ExpireMonthAsStr +
      CreditCard.Expire4DigitYearAsStr);
    AddFieldA('CVV2', CreditCard.SecurityCode);
    if not CreditCard.CustomerFullName.IsEmpty then
    begin
      AddFieldA('FIRSTNAME', CreditCard.CustomerFirstName, 15);
      AddFieldA('LASTNAME', CreditCard.CustomerLastName, 15);
    end;
    AddTextFieldWithLength('CUSTCODE', CreditCard.CustomerId, 30);
    AddTextFieldWithLength('COMPANYNAME', CreditCard.CustomerCompany, 30);
    AddTextFieldWithLength('STREET', CreditCard.CustomerAddress, 30);
    AddFieldA('CITY', CreditCard.CustomerCity, 20);
    AddFieldA('STATE', CreditCard.CustomerState, 2);
    AddFieldA('ZIP', CreditCard.CustomerPostalCode, 9);
    // 2-character country code
    AddFieldA('BILLTOCOUNTRY', CreditCard.CustomerCountryCode, 4);
    AddTextFieldWithLength('EMAIL', CreditCard.CustomerEmail, 64);
    // Sender address (why 2 params?)
    AddFieldA('SHIPFROMZIP', Sender.PostalCode, 30);
    AddFieldA('SHIPPEDFROMZIP', Sender.PostalCode, 30);

    // Shipping address
    AddTextFieldWithLength('SHIPTOFIRSTNAME', CreditCard.CustomerFirstName, 30);
    AddTextFieldWithLength('SHIPTOLASTNAME', CreditCard.CustomerLastName, 30);
    AddTextFieldWithLength('SHIPTOSTREET', Destination.Address1, 30);
    AddFieldA('SHIPTOCITY', Destination.City, 30);
    AddTextFieldWithLength('SHIPTOCOUNTRY', Destination.CountryCode3Digit, 30);
    AddFieldA('SHIPTOSTATE', Destination.StateOrRegion, 10);
    AddFieldA('SHIPTOZIP', Destination.PostalCode, 30);
  end;

  if (ATransactionType in [ttSale, ttAuthOnly, ttVoid]) then
    AddFieldA('CURRENCY', TransactionCurrencyCode);

  // Note:  The total amount (AMT) must include tax and freight.
  if (ATransactionType in [ttSale, ttAuthOnly, ttCredit]) then
    AddFieldA('AMT', FormatFloatValue(TransactionAmount))
  else if (ATransactionType = ttAVSOnly) then
    AddFieldA('AMT', FormatFloatValue(0.00));

  if (ATransactionType in [ttSale, ttAuthOnly]) then
  begin
    // The item amount (does not include tax or freight)
    AddFieldA('ITEMAMT', FormatFloatValue(TransactionAmount -
      (FreightAmount + TaxAmount)));
    // Freight amount
    AddFieldA('FREIGHTAMT', FormatFloatValue(FreightAmount));
    // Handling amount
    AddFieldA('HANDLINGAMT', FormatFloatValue(0.00));
    // Tax amount
    AddFieldA('TAXAMT', FormatFloatValue(TaxAmount));
    AddFieldA('TAXEXEMPT', IQMS.Common.Numbers.sIIf(TaxAmount = 0, 'Y', 'N'), 1);
    AddFieldA('DISCOUNT', FormatFloatValue(DiscountAmount));

    AddTextFieldWithLength('DESC', TransactionDescription, 127);
    // Although the property is optional, the PayPal Invoice Number must
    // be unique for each transaction.
    if not InvoiceNumber.IsEmpty then
      AddTextFieldWithLength('INVNUM',
        Format('%s-%s', [InvoiceNumber,
        cc_share.NextReferenceNumber(cgwPayFlowPro)]), 127);
    AddTextFieldWithLength('PONUM', PurchaseOrderNumber, 25);
    AddFieldA('ORDERDATE', ToDate(SalesOrderDate));

    AddTextFieldWithLength('COMMENT1', TransactionDescription, 100);

    if (ProcessingClass in [pclLevel2, pclLevel3]) then
    begin
      // Level 2 and 3
      AddFieldA('DUTYAMT', FormatFloatValue(Level3Options.DutyAmount));

      // Level 3
      if ProcessingClass = pclLevel3 then
      begin
        if (CreditCard.CardType = ccAmex) then
          AddTextFieldWithLength('REQNAME', CreditCard.CustomerFullName, 40);
        AddFieldA('COMMCARD', 'U');
        AddFieldA('NATIONALTAXAMT',
          FormatFloatValue(Level3Options.NationalTaxAmount));
        AddFieldA('LOCALTAXAMT',
          FormatFloatValue(Level3Options.LocalTaxAmount));
        AddFieldA('COMMCODE', Level3Options.CommodityCode);
        AddFieldA('VATREGNUM', Level3Options.CustomerTaxID);
        AddFieldA('CUSTVATREGNUM', Level3Options.CustomerTaxID);
        AddFieldA('ALTERNATETAXID', Level3Options.CustomerTaxID);
        AddFieldA('ALTERNATETAXAMT', FormatFloatValue(0.00));
        AddFieldA('TAXPERCENTAGE',
          FormatFloatValue(IQMS.Common.Numbers.GetTaxRateApplied(TransactionAmount,
          TaxAmount)));
        BuildCommand_ItemDetails;
      end;

    end;
  end;

  AddTextFieldWithLength('MERCHANTNAME', MerchantName, 100);
  AddFieldA('VERBOSITY', 'MEDIUM');

end;

procedure TEPaymentPayFlowPro.BuildCommand_ItemDetails;
var
  i: Integer;
  AValue: string;
begin
  for i := 0 to Level3Options.Itemization.Count - 1 do
  begin
    // Item #
    AValue := IQMS.Common.StringUtils.AlphaNumeric(Level3Options.Itemization.Items[i]
      .ItemNumber);
    AddFieldA(Format('L_PRODCODE%d', [i + 1]), AValue, 12);
    AddFieldA(Format('L_UPC%d', [i + 1]), AValue, 12);
    // Item Description
    AValue := UpperCase(IQMS.Common.StringUtils.AlphaNumeric(Level3Options.Itemization.Items
      [i].ItemDescription));
    AddFieldA(Format('L_DESC%d', [i + 1]), AValue, 35);
    // Unit price
    AddFieldA(Format('L_COST%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].Price));
    // Total
    AddFieldA(Format('L_AMT%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].TotalAmount));
    // Quantity
    AddFieldA(Format('L_QTY%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].Quantity));

    // UOM - this gets a little weird because Sterling has a list of
    // expected values, and only those values will work.
    AValue := UpperCase(Level3Options.Itemization.Items[i].UOM);
    if AValue.IsEmpty then
      AValue := 'NPT';
    AddFieldA(Format('L_UOM%d', [i + 1]), AValue, 3);

    // Commodity code
    AValue := UpperCase(Level3Options.Itemization.Items[i].CommodityCode);
    AddFieldA(Format('L_COMMCODE%d', [i + 1]), AValue, 12);
    // Debit Indicator Line Item
    { C Item extended amount is a credit or taking away from the
      total amount of the sale, such as when a coupon or discount
      was applied or a return issued
      D Item extended amount is a debit or adding to the total
      amount of the sale }
    // AddFieldA(Format('DCIndicator_%d', [i + 1]), 'D');
    // Gross Net Indicator -
    // Indicates whether tax amount is included in the item amount.
    // AddFieldA(Format('GNIndicator_%d', [i + 1]), 'Y');
    // Discount Amount for line item
    AddFieldA(Format('L_DISCOUNT%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].Discount));
    // Tax Amount
    AddFieldA(Format('L_TAXAMT%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].Tax));
    // Tax Rate
    AddFieldA(Format('L_TAXRATE%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].TaxRate));

    // Freight
    AddFieldA(Format('L_FREIGHTAMT%d', [i + 1]),
      FormatFloatValue(Level3Options.Itemization.Items[i].Freight));
  end;
end;

procedure TEPaymentPayFlowPro.ParseResponseText;
var
  AElements: TStringList;
  ACode, AValue1, AValue2, AValue3: ShortString;
  ADescription: string;
  AResponseClass: TResponseClass;
begin
  if Response.ResponseData.IsEmpty then
    Exit;

  AElements := TStringList.Create;
  try
    IQMS.Common.StringUtils.Tokenize(Response.ResponseData, ['&'], AElements);
    Response.ReturnValues.AddStrings(AElements);

    // RESULT=0&PNREF=VXYZ01234567&RESPMSG=APPROVED&AVSADDR=Y&AVSZIP=N&IAVS=Y&CVV2 MATCH=Y

    Response.ReturnCode := ShortString(Trim(AElements.Values['RESULT']));
    ProcessResponseStatusCode(Response.ReturnCode, { var } ACode, ADescription,
      AResponseClass);
    Response.StatusClass := AResponseClass;
    Response.StatusCode := ACode;
    Response.StatusDescription :=
      ShortString(Trim(AElements.Values['RESPMSG']));

    Response.ProcessorCode :=
      ShortString(Trim(AElements.Values['HOSTCODE']));
    // cc_payflowpro_utils.GetHostCodeDescription(Response.ProcessorCode,
    // AResponseClass, ACode, ADescription);

    if (CompareText(Response.ReturnCode, '125') = 0) or
      (CompareText(Response.ReturnCode, '126') = 0) or
      (CompareText(Response.ReturnCode, '127') = 0) or
      (CompareText(Response.ReturnCode, '128') = 0) then
    begin
      // If this error occurs, this will be the message text:
      // "Under review by Fraud Service".
      Response.StatusClass := rcSecurity;
      Response.ErrorCode := Response.ReturnCode;
      Response.ErrorText := Response.StatusDescription;
      Response.ErrorDetails := ParsePayFlowProFraudError(AElements);
    end
    else if (CompareText(Response.ReturnCode, '114') = 0) then
    begin
      Response.StatusClass := rcWarning;
      // Card Security Code (CSC) Mismatch. An authorization may still exist on the
      // cardholder’s account.
    end;

    if (Response.StatusClass in [rcFailure, rcError]) and
      (Response.ErrorText = '') then
    begin
      Response.ErrorCode := Response.ReturnCode;
      Response.ErrorText := Response.StatusDescription;
      Response.ErrorDetails := ParsePayFlowProFraudError(AElements);
      if Response.ErrorText = '' then
        Response.ErrorText := 'Unknown error.';
    end;

    if (AElements.IndexOfName('PNREF') > - 1) then
      Response.TransactionID :=
        ShortString(Trim(AElements.Values['PNREF']));
    Response.ApprovalCode := ShortString(Trim(AElements.Values['AUTHCODE']));
    if Response.ApprovalCode = '' then
      Response.ApprovalCode := Response.ReturnCode;

    // For PayPal, the reference number is the same as the transaction ID
    // Response.ReferenceNumber := Response.TransactionID;
    // Indicates the status of the last transaction.
    Response.Approved := (Response.StatusClass in [rcSuccess, rcWarning]);

    // Get the standard AVS code
    AValue1 := ShortString(Trim(AElements.Values['AVSADDR']));
    AValue2 := ShortString(Trim(AElements.Values['AVSZIP']));
    AValue3 := ShortString(Trim(AElements.Values['IAVS']));
    ACode := cc_payflowpro_utils.GetStandardAVSCode(
      CreditCard.CustomerAddress, CreditCard.CustomerPostalCode,
      AValue1, AValue2, AValue3);
    Response.SetNonStandardAVSResultCode(
      Format('Address=%s; Postal Code=%s; International=%s',
      [AValue1, AValue2, AValue3]), ACode);

    // Get the standard Security Code
    Response.SetNonStandardSecurityResultCode(
      ShortString(Trim(AElements.Values['CVV2 MATCH'])),
      cc_payflowpro_utils.GetStandardSecurityCode(
      ShortString(Trim(AElements.Values['CVV2 MATCH']))));
    { TODO : IQMS.Common.StringUtils.HTMLEncode undeclared }
    {Response.TimeStamp :=
      ShortString(IQMS.Common.StringUtils.HTMLDecode(Trim(AElements.Values['TIMESTAMP'])));           }
    // 06/18/2014 Allow retry if not approved
    FRetry := not Response.Approved;
  finally
    if Assigned(AElements) then
      FreeAndNil(AElements);
  end;
end;

function TEPaymentPayFlowPro.ParsePayFlowProFraudError
  (AElements: TStringList): string;

  procedure _ProcXML(const AXML: string; var AMessage: TStringList);
  var
    DOM: IXMLDocument;
    Node, AChildNode: IXMLNode;
    NodeList: IXMLNodeList;
    i: Integer;
  begin
    if Assigned(AMessage) then
    begin
      DOM := TXMLDocument.Create(nil);
      DOM.LoadFromXML(AXML);
      if TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement, 'triggeredRules',
        Node) then
      begin
        NodeList := TIQWebXMLNodeHelper.SelectNodes(Node, 'rule');
        if Assigned(NodeList) and (NodeList.Count > 0) then
          for i := 0 to NodeList.Count - 1 do
          begin
            Node := NodeList.Get(i);
            if Assigned(Node) then
            begin
              if TIQWebXMLNodeHelper.FindNodeByName(Node, 'triggeredMessage',
                AChildNode) then
                AMessage.Add('- ' + AChildNode.Text);
            end;
          end;
      end;
    end;
  end;

  procedure _GetXMLFromTag(const AElements: TStringList; const ATag: string;
    var AXML: string);
  var
    i, x: Integer;
    ALine: string;
  begin
    if Assigned(AElements) and (ATag > '') then
      for i := 0 to AElements.Count - 1 do
      begin
        if CompareText(LeftStr(AElements.Strings[i], Length(ATag)), ATag) = 0
        then
        begin
          ALine := AElements.Strings[i];
          x := Pos('=', ALine);
          AXML := Copy(ALine, x + 1, Length(ALine));
          Break;
        end;
      end;
  end;

var
  AMessage: TStringList;
  AValue1, AValue2: string;
begin
  AMessage := TStringList.Create;
  try
    AMessage.Add(Trim(AElements.Values['RESPMSG']));
    _GetXMLFromTag(AElements, 'FPS_PREXMLDATA', { var } AValue1);
    _ProcXML(AValue1, AMessage);
    _GetXMLFromTag(AElements, 'FPS_POSTXMLDATA', { var } AValue2);
    _ProcXML(AValue2, AMessage);
    Result := Trim(AMessage.Text);
  finally
    FreeAndNil(AMessage);
  end;
end;

procedure TEPaymentPayFlowPro.ProcessResponseStatusCode(
  const AResponse: ShortString; var ACode: ShortString;
  var ADescription: string; var AResponseClass: TResponseClass);

  function _Eval(const Code: array of string;
    AResponseClassIfTrue: TResponseClass = rcFailure): Boolean;
  begin
    // Evaluate combinations of codes
    Result := IQMS.Common.StringUtils.StrInList(ACode, Code);
    if Result then
      AResponseClass := AResponseClassIfTrue;
  end;

begin
  ACode := AResponse;
  if _Eval(['0'], rcSuccess) then
    Exit
  else if _Eval(['11', '50', '102', '104', '109', '115', '150', '151'],
    rcFailure) then
    Exit
  else if _Eval(['114', '125', '126', '127', '128'], rcSecurity) then
    Exit
  else
    AResponseClass := rcError;
end;

function TEPaymentPayFlowPro.Refund: Boolean;
begin
  Validate;
  ValidateSetting(TransactionID, 'Transaction ID (Sequence number)');
  TransactionAmount := ReversalData.RequestedAmount;
  BuildCommand(ttCredit);
  // Execute the command
  Result := ExecuteCommand(FCommand.Command);
end;

{$ENDREGION 'TEPaymentPayFlowPro'}

end.
