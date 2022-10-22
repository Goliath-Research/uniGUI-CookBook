unit cc_trans;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  System.SysUtils,
  cc_types,
  cc_rscstr,
  IQMS.Common.VerticalParam,
  IQMS.Common.PrincipalSourceTypes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule;

type
  { Forwards }
  TTransactionResponse = class;
  TTransactionResponseItem = class;
  TTransactionResponseTable = class;
  TTransactionAddendum = class;
  TTransactionAddendumItem = class;
  TTransactionAddendumTable = class;

  { TTransaction }
  { Component used for adding a transaction }
  TTransaction = class(TComponent)
  strict private
    { Private declarations }
    FCreditCard: TCreditCardRec;
    // FSettled: Boolean;
    FTaxAmount: Real;
    FSpotRate: Real;
    FBANKINFO_DTL_ID: Real;
    FARPREPOST_ID: Real;
    FARINVOICE_ID: Real;
    FORDERS_ID: Real;
    FTransactionID: Int64;
    FAuthorizedAmount: Real;
    FCURRENCY_ID: Real;
    FPO_ID: Real;
    FAuthorizedUserID: string;
    FPONo: string;
    FInvoiceNo: string;
    FOrderNo: string;
    FCustomer: TCustomerSource;
    FGatewayResponse: TTransactionResponse;
    FStatusComment: string;
    FTransactionStatus: TTransactionStatus;
    FStatusAmount: Real;
    FAuthorizedDate: TDateTime;
    FManual: Boolean;
    FResponseText: string;
    FResponseApprovalCode: string;
    FResponseTransactionID: string;
    FResponseData: string;
    FGatewayURL: string;
    FGateway: TCreditCardGateway;
    FCreditCardAccountID: Real;
    FFreight: Real;
    FTransactionMethod: TTransactionMethod;
    FTransactionType: TTransactionType;
    FTransactionDescription: string;
    FIsOnAccount: Boolean;
    FTaxExempt: Boolean;
    procedure Initialize;
    procedure Validate;
    function GetMerchantName: string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ACreditCardAccountID: Real);
      reintroduce;
    destructor Destroy; override;
    procedure Execute;
    procedure AssignCustomer(const ACustomer: TCustomerSource);
  published
    { Published declarations }
    property CreditCardAccountID: Real read FCreditCardAccountID
      write FCreditCardAccountID;
    property TransactionID: Int64 read FTransactionID write FTransactionID;
    property AuthorizedAmount: Real read FAuthorizedAmount
      write FAuthorizedAmount;
    property AuthorizedUserID: string read FAuthorizedUserID
      write FAuthorizedUserID;
    property TaxAmount: Real read FTaxAmount write FTaxAmount;
    property TaxExempt: Boolean read FTaxExempt write FTaxExempt;
    property Freight: Real read FFreight write FFreight;
    property AuthorizedDate: TDateTime read FAuthorizedDate
      write FAuthorizedDate;
    property CURRENCY_ID: Real read FCURRENCY_ID write FCURRENCY_ID;
    property ARPREPOST_ID: Real read FARPREPOST_ID write FARPREPOST_ID;
    property ARINVOICE_ID: Real read FARINVOICE_ID write FARINVOICE_ID;
    property ORDERS_ID: Real read FORDERS_ID write FORDERS_ID;
    property PO_ID: Real read FPO_ID write FPO_ID;
    property BANKINFO_DTL_ID: Real read FBANKINFO_DTL_ID
      write FBANKINFO_DTL_ID;
    property Gateway: TCreditCardGateway read FGateway write FGateway;
    property GatewayURL: string read FGatewayURL write FGatewayURL;
    // Lists additional response items. This will vary by gateway.
    property GatewayResponse: TTransactionResponse read FGatewayResponse
      write FGatewayResponse;
    // These properties exists for all gateways
    property ResponseTransactionID: string read FResponseTransactionID
      write FResponseTransactionID;
    property ResponseApprovalCode: string read FResponseApprovalCode
      write FResponseApprovalCode;
    property ResponseText: string read FResponseText write FResponseText;
    property ResponseData: string read FResponseData write FResponseData;
    property Customer: TCustomerSource read FCustomer write FCustomer;
    property CreditCard: TCreditCardRec read FCreditCard write FCreditCard;
    // property Settled: Boolean read FSettled write FSettled;
    property Status: TTransactionStatus read FTransactionStatus
      write FTransactionStatus;
    property StatusComment: string read FStatusComment write FStatusComment;
    property StatusAmount: Real read FStatusAmount write FStatusAmount;
    property Manual: Boolean read FManual write FManual;
    // Read-only properties
    property SpotRate: Real read FSpotRate;
    property InvoiceNumber: string read FInvoiceNo;
    property OrderNumber: string read FOrderNo;
    property PONumber: string read FPONo write FPONo;
    property TransactionMethod: TTransactionMethod read FTransactionMethod
      write FTransactionMethod;
    property TransactionType: TTransactionType read FTransactionType
      write FTransactionType;
    property TransactionDescription: string read FTransactionDescription
      write FTransactionDescription;
    property IsOnAccount: Boolean read FIsOnAccount write FIsOnAccount;
  end;

  { TTransactionResponse }
  TTransactionResponse = class(TCollection)
  private
    { Private declarations }
    function GetItems(index: Integer): TTransactionResponseItem;
    procedure SetItems(index: Integer; const Value: TTransactionResponseItem);
    function AddItem: TTransactionResponseItem;
  public
    { Public declarations }
    constructor Create;
    function Add(const ACode: ShortString; const AValue: string)
      : TTransactionResponseItem;
    function Find(const ACode: ShortString): TTransactionResponseItem;
    function IndexOf(const ACode: ShortString): Integer;
    procedure SetParamValue(const ACode: ShortString; const AValue: string);
    procedure AddNameValuePairs(const AStrings: TStringList);
    property Items[index: Integer]: TTransactionResponseItem read GetItems
      write SetItems; default;
  end;

  { TTransactionResponseItem }
  TTransactionResponseItem = class(TCollectionItem)
  private
    { Private declarations }
    FValue: string;
    FCode: ShortString;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property Code: ShortString read FCode write FCode;
    property Value: string read FValue write FValue;
  end;

  { TTransactionResponseTable }
  TTransactionResponseTable = class(TIQWebCustomParams)
  private
    { Private declarations }
    FTransactionID: Int64;
    procedure DoBeforeGetValues;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATransactionID: Int64); reintroduce;
    procedure GetNameValuePairs(AStrings: TStrings);
  published
    { Published declarations }
    property TransactionID: Int64 read FTransactionID write FTransactionID;
    // property DatabaseName;
    property TableName;
    property MasterField;
    property MasterFieldValue;
    property Options;
    property OnSetValue;
    property OnGetValues;
    property OnBeforeGetValues;
    property WriteImmediate;
  end;

  { TTransactionAddendum }
  TTransactionAddendum = class(TCollection)
  private
    { Private declarations }
    function GetItems(index: Integer): TTransactionAddendumItem;
    procedure SetItems(index: Integer; const Value: TTransactionAddendumItem);
    function AddItem: TTransactionAddendumItem;
  public
    { Public declarations }
    constructor Create;
    function Add(const ACode, AValue: string): TTransactionAddendumItem;
    function Find(const ACode: string): TTransactionAddendumItem;
    function IndexOf(const ACode: string): Integer;
    procedure SetParamValue(const ACode, AValue: string);
    property Items[index: Integer]: TTransactionAddendumItem read GetItems
      write SetItems; default;
  end;

  { TTransactionAddendumItem }
  TTransactionAddendumItem = class(TCollectionItem)
  private
    { Private declarations }
    FValue: string;
    FCode: string;
  public
    { Public declarations }
    constructor Create(Collection: TCollection); override;
  published
    { Published declarations }
    property Code: string read FCode write FCode;
    property Value: string read FValue write FValue;
  end;

  { TTransactionAddendumTable }
  TTransactionAddendumTable = class(TIQWebCustomParams)
  private
    { Private declarations }
    FTransactionID: Int64;
    procedure DoBeforeGetValues;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ATransactionID: Int64); reintroduce;
  published
    { Published declarations }
    property TransactionID: Int64 read FTransactionID write FTransactionID;
    // property DatabaseName;
    property TableName;
    property MasterField;
    property MasterFieldValue;
    property Options;
    property OnSetValue;
    property OnGetValues;
    property OnBeforeGetValues;
    property WriteImmediate;
  end;

implementation

uses
  cc_share,
  IQMS.Common.Boolean,
  IQMS.Common.Dates,
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  System.DateUtils;

{ TTransactionResponseTable }

constructor TTransactionResponseTable.Create(AOwner: TComponent;
  ATransactionID: Int64);
begin
  inherited Create(AOwner);
  FTransactionID := ATransactionID;
  // Connection := MainModule.FDConnection;
  TableName := 'CREDIT_CARD_RESPONSE';
  MasterField := 'CREDIT_CARD_TRANS_ID';
  MasterFieldValue := FloatToStr(ATransactionID);
  OnBeforeGetValues := DoBeforeGetValues;
  Refresh;
end;

procedure TTransactionResponseTable.DoBeforeGetValues;
begin
  if FTransactionID > 0 then
    ExecuteCommandFmt(
      'BEGIN iqms.cc.check_response_created(%d); END;',
      [FTransactionID]);
end;

procedure TTransactionResponseTable.GetNameValuePairs(AStrings: TStrings);
var
  i: Integer;
begin
  if Assigned(AStrings) then
    for i := 0 to Params.Count - 1 do
      AStrings.Add(Format('%s=%s', [Params.Strings[i],
        ParamByName(Params.Strings[i]).AsString]));
end;

{ TTransaction }

constructor TTransaction.Create(AOwner: TComponent; ACreditCardAccountID: Real);
begin
  inherited Create(AOwner);
  FCreditCardAccountID := ACreditCardAccountID;
  Customer := TCustomerSource.Create(Self);
  Initialize;
end;

destructor TTransaction.Destroy;
begin
  if Assigned(FCreditCard) then
    FreeAndNil(FCreditCard);
  if Assigned(FGatewayResponse) then
    FreeAndNil(FGatewayResponse);
  inherited Destroy;
end;

procedure TTransaction.Execute;
var
  AErrDtl: string;
  ASQL: TStringList;
  ATransTable: TTransactionResponseTable; // vertical table
  i: Integer;
  AMerchantName: string;
  ALastFour, ALastFourMasked: string;
begin
  // Initialization
  ATransTable := nil;
  AErrDtl := '';
  // Ensure basic values provided
  Validate;
  // Insert record
  try // try... except
    try // try... finally
      ASQL := TStringList.Create;
      // Next transaction ID
      if FTransactionID = 0 then
        begin
          AErrDtl := 'Retrieving next ID value for CREDIT_CARD_TRANS';
          FTransactionID := GetNextID('CREDIT_CARD_TRANS');
        end;
      // Get the currency spot rate
      AErrDtl := 'Retrieving spot rate.';
      FSpotRate := SelectValueFmtAsFloat(
        'SELECT spot_rate FROM currency WHERE id = %d',
        [Trunc(FCURRENCY_ID)]);

      // Get the merchant name
      AErrDtl := 'Retrieving merchant name.';
      AMerchantName := GetMerchantName;
      ALastFour := IQMS.Common.StringUtils.RightStr(CreditCard.AccountNumber, 4);
      ALastFourMasked := cc_share.GetMaskedAccount(CreditCard.AccountNumber);
      AErrDtl := 'Adding transaction record.';
      ASQL.Add('INSERT INTO credit_card_trans(id,');
      ASQL.Add('                              credit_card_account_id,');
      ASQL.Add('                              authorized,');
      ASQL.Add('                              authorized_amount,');
      ASQL.Add('                              authorized_date,');
      ASQL.Add('                              authorized_by,');
      ASQL.Add('                              settlement_amount,');
      ASQL.Add('                              status,');
      ASQL.Add('                              card_number,');
      ASQL.Add('                              card_exp,');
      ASQL.Add('                              card_expiration_date,');
      ASQL.Add('                              card_holder_name,');
      ASQL.Add('                              card_addr,');
      ASQL.Add('                              card_zip,');
      ASQL.Add('                              last_four,');
      ASQL.Add('                              last_four_masked,');
      ASQL.Add('                              manual,');
      ASQL.Add('                              response_transaction_id,');
      ASQL.Add('                              response_approval_code,');
      ASQL.Add('                              response_text,');
      ASQL.Add('                              gateway,');
      ASQL.Add('                              gateway_url,');
      ASQL.Add('                              settle_error,');
      ASQL.Add('                              credit_card_descrip,');
      ASQL.Add('                              currency_id,');
      ASQL.Add('                              spot_rate,');
      ASQL.Add('                              transaction_method,');
      ASQL.Add('                              transaction_type,');
      ASQL.Add('                              transaction_descrip,');
      ASQL.Add('                              merchant_name,');
      ASQL.Add('                              onacct,');
      ASQL.Add('                              tax_exempt,');
      ASQL.Add('                              is_token)');
      ASQL.Add('    VALUES (:id, :credit_card_account_id, ''Y'',');
      ASQL.Add('            :authorized_amount, :authorized_date,');
      ASQL.Add('            :authorized_by, :settlement_amount, 0,');
      ASQL.Add('            iqms.cc_encrypt.get_encrypted(:card_number),');
      ASQL.Add('            :card_exp, :card_expiration_date,');
      ASQL.Add('            :card_holder_name, :card_addr,');
      ASQL.Add('            :card_zip, :last_four, :last_four_masked, ');
      ASQL.Add('            :manual, :response_transaction_id, ');
      ASQL.Add('            :response_approval_code, :response_text,');
      ASQL.Add('            :gateway, :gateway_url, ''N'', :credit_card_descrip,');
      ASQL.Add('            :currency_id, :spot_rate, :transaction_method, ');
      ASQL.Add('            :transaction_type, :transaction_descrip, ');
      ASQL.Add('            :merchant_name, :onacct, :tax_exempt,');
      ASQL.Add('            :is_token)');
      ExecuteCommandParam(
        ASQL.Text,
        ['ID;INT64',
        'CREDIT_CARD_ACCOUNT_ID;INT64',
        'AUTHORIZED_AMOUNT;F',
        'AUTHORIZED_DATE;D',
        'AUTHORIZED_BY',
        'SETTLEMENT_AMOUNT;F',
        'CARD_NUMBER',
        'CARD_EXP',
        'CARD_EXPIRATION_DATE;D',
        'CARD_HOLDER_NAME',
        'CARD_ADDR',
        'CARD_ZIP',
        'LAST_FOUR',
        'LAST_FOUR_MASKED',
        'MANUAL',
        'RESPONSE_TRANSACTION_ID',
        'RESPONSE_APPROVAL_CODE',
        'RESPONSE_TEXT',
        'GATEWAY;INT',
        'GATEWAY_URL',
        'CREDIT_CARD_DESCRIP;S',
        'CURRENCY_ID;F',
        'SPOT_RATE;F',
        'TRANSACTION_METHOD;I',
        'TRANSACTION_TYPE;I',
        'TRANSACTION_DESCRIP;S',
        'MERCHANT_NAME;S',
        'ONACCT;S',
        'TAX_EXEMPT;S',
        'IS_TOKEN;S'],
        [FTransactionID,
        Trunc(FCreditCardAccountID),
        FAuthorizedAmount,
        FAuthorizedDate,
        SecurityManager.UserName,
        FAuthorizedAmount,
        CreditCard.AccountNumber,
        CreditCard.Expires,
        CreditCard.ExpirationDate,
        CreditCard.NameOnCard,
        CreditCard.CustomerAddress1,
        CreditCard.CustomerPostalCode,
        ALastFour,
        ALastFourMasked,
        IQMS.Common.Boolean.BoolToYN(FManual),
        ResponseTransactionID,
        ResponseApprovalCode,
        ResponseText,
        cc_types.IndexBySupportedGateway(Gateway),
        GatewayURL,
        CreditCard.CardDescription,
        IQMS.Common.Numbers.NullIfZero(CURRENCY_ID),
        IQMS.Common.Numbers.NullIfZero(SpotRate),
        Ord(TransactionMethod),
        Ord(TransactionType),
        TransactionDescription,
        AMerchantName,
        IQMS.Common.Boolean.BoolToYN(FIsOnAccount),
        IQMS.Common.Boolean.BoolToYN(FTaxExempt),
        IQMS.Common.Boolean.BoolToYN(CreditCard.IsToken)]);
      ASQL.Clear;

      AErrDtl := 'Updating transaction data';
      UpdateCreditCardTransResponseData(FTransactionID, ResponseData);
      AErrDtl := '';
      // update customer information
      if Trunc(Customer.ARCUSTO_ID) > 0 then
        begin
          AErrDtl := 'Updating transaction record customer.';
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET arcusto_id = :arcusto_id,');
          ASQL.Add('       custno = :custno,');
          ASQL.Add('       company = :company,');
          ASQL.Add('       addr1 = :addr1,');
          ASQL.Add('       addr2 = :addr2,');
          ASQL.Add('       addr3 = :addr3,');
          ASQL.Add('       city = :city,');
          ASQL.Add('       state = :state,');
          ASQL.Add('       zip = :zip,');
          ASQL.Add('       country = :country');
          ASQL.Add(' WHERE id = :id');
          ExecuteCommandParam(
            ASQL.Text,
            ['ARCUSTO_ID;INT64',
            'CUSTNO',
            'COMPANY',
            'ADDR1',
            'ADDR2',
            'ADDR3',
            'CITY',
            'STATE',
            'ZIP',
            'COUNTRY',
            'ID;INT64'],
            [Trunc(Customer.ARCUSTO_ID),
            Customer.ARCUSTO_CUSTNO,
            Customer.ARCUSTO_COMPANY,
            Customer.ARCUSTO_ADDR1,
            Customer.ARCUSTO_ADDR2,
            Customer.ARCUSTO_ADDR3,
            Customer.ARCUSTO_CITY,
            Customer.ARCUSTO_STATE,
            Customer.ARCUSTO_ZIP,
            Customer.ARCUSTO_COUNTRY,
            FTransactionID]);
        end;

      ASQL.Clear;
      AErrDtl := '';
      // update billing information
      if Trunc(Customer.BILL_TO_ID) > 0 then
        begin
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET');
          ASQL.Add('       (bill_to_id,');
          ASQL.Add('       bill_to_addr1,');
          ASQL.Add('       bill_to_city,');
          ASQL.Add('       bill_to_state,');
          ASQL.Add('       bill_to_zip,');
          ASQL.Add('       bill_to_country,');
          ASQL.Add('       bill_to_country_code');
          ASQL.Add('       ) =');
          ASQL.Add('          (SELECT id, addr1, city, state, zip, country,');
          ASQL.Add('                  iqms.country_code.get2charcountrycode(country)');
          ASQL.Add('             FROM bill_to');
          ASQL.Add(Format('            WHERE id = %d)', [Trunc(Customer.BILL_TO_ID)]));
          ASQL.Add(Format(' WHERE id = %d', [FTransactionID]));
          ExecuteCommand(ASQL.Text);
        end;

      ASQL.Clear;
      AErrDtl := '';
      // update shipping information
      if Trunc(Customer.SHIP_TO_ID) > 0 then
        begin
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET');
          ASQL.Add('       (ship_to_id,');
          ASQL.Add('       ship_to_addr1,');
          ASQL.Add('       ship_to_city,');
          ASQL.Add('       ship_to_state,');
          ASQL.Add('       ship_to_zip,');
          ASQL.Add('       ship_to_country,');
          ASQL.Add('       ship_to_country_code');
          ASQL.Add('       ) =');
          ASQL.Add('          (SELECT id, addr1, city, state, zip, country,');
          ASQL.Add('                  iqms.country_code.get2charcountrycode(country)');
          ASQL.Add('             FROM ship_to');
          ASQL.Add(Format('            WHERE id = %d)', [Trunc(Customer.SHIP_TO_ID)]));
          ASQL.Add(Format(' WHERE id = %d', [FTransactionID]));
          ExecuteCommand(ASQL.Text);
        end;

      ASQL.Clear;
      AErrDtl := '';
      // Invoice number
      if Trunc(FARPREPOST_ID) > 0 then
        begin
          FInvoiceNo :=
            SelectValueFmtAsString(
            'SELECT invoice_no FROM arprepost WHERE id = %d',
            [Trunc(FARPREPOST_ID)]);
          AErrDtl := 'Updating transaction invoice number (prepost).';
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET arprepost_id = :arprepost_id,');
          ASQL.Add('       invoice_no = :invoice_no');
          ASQL.Add(' WHERE id = :id');
          ExecuteCommandParam(
            ASQL.Text,
            ['ARPREPOST_ID;INT64',
            'INVOICE_NO',
            'ID;INT64'],
            [Trunc(FARPREPOST_ID),
            FInvoiceNo,
            FTransactionID]);
        end;
      ASQL.Clear;
      AErrDtl := '';
      // Invoice number
      if Trunc(FARINVOICE_ID) > 0 then
        begin
          FInvoiceNo :=
            SelectValueFmtAsString(
            'SELECT invoice_no FROM arinvoice WHERE id = %d ',
            [Trunc(FARINVOICE_ID)]);
          AErrDtl := 'Updating transaction invoice number (posted).';
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET arinvoice_id = :arinvoice_id,');
          ASQL.Add('       invoice_no = :invoice_no');
          ASQL.Add(' WHERE id = :id');
          ExecuteCommandParam(ASQL.Text,
            ['ARINVOICE_ID;INT64',
            'INVOICE_NO',
            'ID;INT64'],
            [Trunc(FARINVOICE_ID),
            FInvoiceNo,
            FTransactionID]);
        end;
      ASQL.Clear;
      AErrDtl := '';
      // Order number
      if Trunc(FORDERS_ID) > 0 then
        begin
          FOrderNo := SelectValueFmtAsString(
            'SELECT orderno FROM orders WHERE id = %d',
            [Trunc(FORDERS_ID)]);
          AErrDtl := 'Updating transaction order number.';
          ASQL.Add('UPDATE credit_card_trans');
          ASQL.Add('   SET orders_id = :orders_id,');
          ASQL.Add('       orderno = :orderno');
          ASQL.Add(' WHERE id = :id');
          ExecuteCommandParam(
            ASQL.Text,
            ['ORDERS_ID;INT64',
            'ORDERNO',
            'ID;INT64'],
            [Trunc(FORDERS_ID),
            FOrderNo,
            FTransactionID]);
        end;
      ASQL.Clear;
      AErrDtl := '';
      // Get PO number
      if (PO_ID > 0) and (FPONo = '') then
        begin
          FPONo := cc_share.GetPurchaseOrderNumber(FPO_ID, FORDERS_ID);
        end;
      // Update PO.ID
      if Trunc(PO_ID) > 0 then
        begin
          AErrDtl := 'Updating transaction purchase order number (ID).';
          ExecuteCommandParam(
            'UPDATE credit_card_trans SET po_id = :PO_ID WHERE id = :ID',
            ['PO_ID;INT64', 'ID;INT64'],
            [Trunc(FPO_ID), FTransactionID]);
        end;
      // Update PO.PONO
      if (FPONo > '') then
        begin
          AErrDtl := 'Updating transaction purchase order number (PONO).';
          ExecuteCommandParam(
            'UPDATE credit_card_trans SET pono = :PONO WHERE id = :ID',
            ['PONO', 'ID;INT64'],
            [FPONo, FTransactionID]);
        end;
      // Update tax amount
      if TaxAmount > 0 then
        begin
          AErrDtl := 'Updating transaction tax amount.';
          ExecuteCommandParam(
            'UPDATE credit_card_trans SET tax_amount = :TAX_AMOUNT WHERE id = :ID',
            ['TAX_AMOUNT;F', 'ID;INT64'],
            [TaxAmount, FTransactionID]);
        end;
      // Update freight amount (08/26/2011)
      if Freight > 0 then
        begin
          AErrDtl := 'Updating transaction freight amount.';
          ExecuteCommandParam(
            'UPDATE credit_card_trans SET freight = :FREIGHT WHERE id = :ID',
            ['FREIGHT;F', 'ID;INT64'],
            [Freight, FTransactionID]);
        end;
      // Update the bank info dtl ID
      if BANKINFO_DTL_ID > 0 then
        begin
          AErrDtl := 'Updating transaction bank info detail ID.';
          ExecuteCommandFmt(
            'UPDATE credit_card_trans SET bankinfo_dtl_id = %d ' +
            'WHERE id = %d',
            [Trunc(BANKINFO_DTL_ID), FTransactionID]);
        end;
      // 09/18/2009 Write the additional gateway values
      AErrDtl := 'Initiating transaction response class.';
      ATransTable := TTransactionResponseTable.Create(nil, FTransactionID);
      ATransTable.Options := [cpAutoAddSettings, cpErrorNoSettings];
      ATransTable.Refresh;
      AErrDtl := 'Writing response details to table.';
      // Loop the gateway response items and write them to the table
      // ATransTable.Params.AutoAdd := True;
      for i := 0 to GatewayResponse.Count - 1 do
        begin
          if ATransTable.ParamByName(GatewayResponse.Items[i].Code) = nil then
            ATransTable.Params.AddCodeValuePair(GatewayResponse.Items[i].Code,
              GatewayResponse.Items[i].Value)
          else
            ATransTable.ParamByName(GatewayResponse.Items[i].Code).AsString :=
              GatewayResponse.Items[i].Value;
        end;

      // 01/16/2008 If the Transaction Type was ttSale, then we need to mark
      // it as already settled.
      AErrDtl := 'Setting transaction status.';
      if (Status = ccsSettled) then
        cc_share.DoMarkAsSettled(FTransactionID, '')
      else if (Status <> ccsUnknown) then
        SetCardStatus(FTransactionID, Status, StatusComment, StatusAmount);
      // cc_share
      AErrDtl := '';
    finally;
      if Assigned(ATransTable) then
        FreeAndNil(ATransTable);
    end;
  except
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        // cc_rscstr.cTXT0000317 = 'Error updating transaction history.'
        IQMS.Common.ErrorDialog.ShowIQErrorMessage(cc_rscstr.cTXT0000317, E.Message, AErrDtl);
  end;
end;

procedure TTransaction.Initialize;
begin
  FCreditCard := TCreditCardRec.Create;
  FGatewayResponse := TTransactionResponse.Create;
  FTransactionMethod := tmTelephone;
  FTransactionType := TTransactionType(0);
  with FCreditCard do
    begin
      ID := 0;
      CardDescription := '';
      AccountNumber := '';
      Expires := '';
      CVV2 := '';
      NameOnCard := '';
      CustomerAddress1 := '';
      CustomerCity := '';
      CustomerState := '';
      CustomerPostalCode := '';
      CustomerCountry := '';
    end;
  // FSettled := False;
  FTransactionStatus := ccsUnknown;
  FStatusComment := '';
  FStatusAmount := 0;
  FManual := False;
  FAuthorizedDate := IQMS.Common.Dates.IQOracleAdjustedDateTime;
  FTaxAmount := 0;
  FFreight := 0;
  FSpotRate := 0;
  FBANKINFO_DTL_ID := 0;
  FARPREPOST_ID := 0;
  FORDERS_ID := 0;
  FTransactionID := 0;
  FAuthorizedAmount := 0;
  FCURRENCY_ID := 0;
  FPO_ID := 0;
  FPONo := '';
  FInvoiceNo := '';
  FOrderNo := '';
  with FCustomer do
    begin
      // ARCUSTO
      ARCUSTO_ID := 0;
      ARCUSTO_CUSTNO := '';
      ARCUSTO_COMPANY := '';
      ARCUSTO_ADDR1 := '';
      ARCUSTO_ADDR2 := '';
      ARCUSTO_ADDR3 := '';
      ARCUSTO_CITY := '';
      ARCUSTO_STATE := '';
      ARCUSTO_ZIP := '';
      ARCUSTO_COUNTRY := '';
      // BILL TO
      BILL_TO_ID := 0;
      BILL_TO_ATTN := '';
      BILL_TO_ADDR1 := '';
      BILL_TO_ADDR2 := '';
      BILL_TO_ADDR3 := '';
      BILL_TO_CITY := '';
      BILL_TO_STATE := '';
      BILL_TO_ZIP := '';
      BILL_TO_COUNTRY := '';
      // SHIP TO
      SHIP_TO_ID := 0;
      SHIP_TO_ATTN := '';
      SHIP_TO_ADDR1 := '';
      SHIP_TO_ADDR2 := '';
      SHIP_TO_ADDR3 := '';
      SHIP_TO_CITY := '';
      SHIP_TO_STATE := '';
      SHIP_TO_ZIP := '';
      SHIP_TO_COUNTRY := '';
    end;
end;

procedure TTransaction.Validate;
begin
  // As of 12/29/2008 we allow zero or negative transactions.
  // This was specifically requested by Accessible Tech.  So,
  // during our validation do not check the trancation value.
  // Besides, this would be caught on the intial, front-end
  // screen prior to getting here.
  // 'Credit Card number not provided.'
  Assert(not CreditCard.AccountNumber.IsEmpty, cc_rscstr.cTXT0000315);
  // 'Credit Card expiration date not provided.'
  Assert(not CreditCard.Expires.IsEmpty, cc_rscstr.cTXT0000316);
  // 'Credit Card Account ID not provided.'
  Assert(FCreditCardAccountID > 0, cc_rscstr.cTXT0000390);
end;

procedure TTransaction.AssignCustomer(const ACustomer: TCustomerSource);
begin
  FCustomer.CopyFrom(ACustomer);
end;

function TTransaction.GetMerchantName: string;
begin
  try
    Result := SelectValueFmtAsString(
      'SELECT merchant_name FROM credit_card_account WHERE id = %d',
      [Trunc(FCreditCardAccountID)]);
  except
    Result := '';
  end;
end;

{ TTransactionResponse }

constructor TTransactionResponse.Create;
begin
  inherited Create(TTransactionResponseItem);
end;

function TTransactionResponse.Add(const ACode: ShortString; const AValue: string)
  : TTransactionResponseItem;
begin
  Result := Find(ACode);
  if Result = nil then
    try
      BeginUpdate;
      Result := AddItem;
      Result.Code := ACode;
      Result.Value := AValue;
    finally
      EndUpdate;
    end;
end;

function TTransactionResponse.AddItem: TTransactionResponseItem;
begin
  Result := TTransactionResponseItem(inherited Add);
end;

procedure TTransactionResponse.AddNameValuePairs(const AStrings: TStringList);
var
  i: Integer;
  AName, AValue: String;
begin
  if Assigned(AStrings) then
    for i := 0 to AStrings.Count - 1 do
      begin
        IQMS.Common.StringUtils.GetNameValuePair(AStrings.Strings[i], AName, AValue);
        if (AName > '') and (AValue > '') then
          Add(AName, AValue);
      end;
end;

function TTransactionResponse.Find(const ACode: ShortString)
  : TTransactionResponseItem;
var
  i: Integer;
begin
  i := IndexOf(ACode);
  if i < 0 then
    Result := nil
  else
    Result := TTransactionResponseItem(Items[i]);
end;

function TTransactionResponse.IndexOf(const ACode: ShortString): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if (TTransactionResponseItem(Items[i]).Code = ACode) then
      begin
        Result := i;
        Break;
      end;
end;

function TTransactionResponse.GetItems(index: Integer)
  : TTransactionResponseItem;
begin
  Result := TTransactionResponseItem(inherited Items[index]);
end;

procedure TTransactionResponse.SetItems(index: Integer;
  const Value: TTransactionResponseItem);
begin
  inherited Items[index] := Value;
end;

procedure TTransactionResponse.SetParamValue(const ACode: ShortString;
  const AValue: string);
var
  AItem: TTransactionResponseItem;
begin
  AItem := Find(ACode);
  if AItem = nil then
    Add(ACode, AValue)
  else
    AItem.Value := AValue;
end;

{ TTransactionResponseItem }

constructor TTransactionResponseItem.Create(Collection: TCollection);
begin
  inherited Create(TTransactionResponse(Collection));
end;

{ TTransactionAddendumTable }

constructor TTransactionAddendumTable.Create(AOwner: TComponent;
  ATransactionID: Int64);
begin
  inherited Create(AOwner);
  FTransactionID := ATransactionID;
  // Connection := MainModule.FDConnection;
  TableName := 'CREDIT_CARD_ADDENDUM';
  MasterField := 'CREDIT_CARD_TRANS_ID';
  MasterFieldValue := FloatToStr(ATransactionID);
  OnBeforeGetValues := DoBeforeGetValues;
  Refresh;
end;

procedure TTransactionAddendumTable.DoBeforeGetValues;
begin
  if FTransactionID > 0 then
    ExecuteCommandFmt('BEGIN iqms.cc.check_addendum_created(%d); END;',
      [FTransactionID]);
end;
{ TTransactionAddendum }

constructor TTransactionAddendum.Create;
begin
  inherited Create(TTransactionAddendumItem);
end;

function TTransactionAddendum.Add(const ACode, AValue: string)
  : TTransactionAddendumItem;
begin
  Result := Find(ACode);
  if Result = nil then
    try
      BeginUpdate;
      Result := AddItem;
      Result.Code := ACode;
      Result.Value := AValue;
    finally
      EndUpdate;
    end;
end;

function TTransactionAddendum.AddItem: TTransactionAddendumItem;
begin
  Result := TTransactionAddendumItem(inherited Add);
end;

function TTransactionAddendum.Find(const ACode: string)
  : TTransactionAddendumItem;
var
  i: Integer;
begin
  i := IndexOf(ACode);
  if i < 0 then
    Result := nil
  else
    Result := TTransactionAddendumItem(Items[i]);
end;

function TTransactionAddendum.GetItems(index: Integer)
  : TTransactionAddendumItem;
begin
  Result := TTransactionAddendumItem(inherited Items[index]);
end;

function TTransactionAddendum.IndexOf(const ACode: string): Integer;
var
  i: Integer;
begin
  Result := - 1;
  for i := 0 to Count - 1 do
    if (TTransactionAddendumItem(Items[i]).Code = ACode) then
      begin
        Result := i;
        Break;
      end;
end;

procedure TTransactionAddendum.SetItems(index: Integer;
  const Value: TTransactionAddendumItem);
begin
  inherited Items[index] := Value;
end;

procedure TTransactionAddendum.SetParamValue(const ACode, AValue: string);
var
  AItem: TTransactionAddendumItem;
begin
  AItem := Find(ACode);
  if AItem = nil then
    Add(ACode, AValue)
  else
    AItem.Value := AValue;
end;
{ TTransactionAddendumItem }

constructor TTransactionAddendumItem.Create(Collection: TCollection);
begin
  inherited Create(TTransactionAddendum(Collection));
end;

end.
