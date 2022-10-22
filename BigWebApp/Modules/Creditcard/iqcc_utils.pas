unit iqcc_utils;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB;

// This record object is used for the "silent" version of the charge credit card wrapper
type
  { TCreditCardChargeInfo }
  TCreditCardChargeInfo = packed record
    // New ID value
    NewTransactionID: Real; // (required) = GetNextID('CREDIT_CARD_TRANS')
    // Card Information
    CreditCardNumber: string; // (required)
    CreditCardType: string; // (required)
    ExpirationDate: string; // Format = 'MM/YY' (required)
    CVV2Data: string; // (optional)
    CardHolderName: string; // (optional)
    IsToken: Boolean;
    ARCUSTO_CREDIT_CARD_ID: Real; // Associated Credit Card record (optional)
    ARCUSTO_ID: Real; // Associated Customer (required)
    BILL_TO_ID: Real; // (optional)
    SHIP_TO_ID: Real; // (optional)

    // Charge Values
    TotalAmount: Real; // (required)
    TaxAmount: Real; // (optional)
    Freight: Real; // (optional)
    Discount: Real;

    // Special Fields (used for Level discounts)
    ARPREPOST_ID: Real; // (optional)
    ARINVOICE_ID: Real; // (optional)
    ORDERS_ID: Real; // (optional)
    PO_ID: Real; // (optional)
    PONO: string;// (optional)
    WEB_ORDERS_ID: Real; // (optional)
    EPLANT_ID: Int64;
    CURRENCY_ID: Int64;
  end;

  { TChargePostingSource }
  TChargePostingSource = (csNone, csOrders, csARPrepost, csARInvoice);

const
  // Table name for the associated charge source
  ChargeSourceTableName: array [TChargePostingSource] of string = ('', 'ORDERS',
    'ARPREPOST', 'ARINVOICE');

  // DCOM server name
  CC_SERVER_NAME = 'CREDITCARD';

  // Returns True if the Credit Card is licensed for this end user.
function IsCreditCardLicensed: Boolean;

// Raises exception if the Credit Card is not licensed for this end user.
procedure CheckCreditCardLicensed;

// Given a table name, return the TChargePostingSource
function GetChargeSourceForTableName(const ATableName: string)
  : TChargePostingSource;

// Get total amounts previously charged
procedure GetTotalCharged(AChargeSource: TChargePostingSource;
  AChargeSourceID: Int64; var ATotalAmount, ATaxAmount: Real);
// Get total amounts to charge, excluding what was previously charged
procedure GetTotalToCharge(AChargeSource: TChargePostingSource;
  AChargeSourceID: Int64; var ATotalAmount, ATaxAmount, AFreight: Real);

// Get the credit card gateway index
function GetGatewayIndex(const ACurrencyID: Int64): Integer;

// return credit card number
// These return an value like ************5678
function GetDecryptedMaskedAccount(const AAccount: string): string;
function GetMaskedAccount(const AAccount: string): string;
function GetDecryptedAccountLastFour(const AAccount: string): string;
function GetAccountLastFour(const AAccount: string): string;

procedure ClearCreditCardChargeInfo(var ACreditCardChargeInfo: TCreditCardChargeInfo);

implementation

uses
  cc_encrypt,
  cc_params,
  cc_rscstr,
  IQMS.Common.Applications,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

// Returns True if the Credit Card is licensed for this end user.
function IsCreditCardLicensed: Boolean;
begin
  try
    Result := (SecurityManager <> nil) and SecurityManager.IsModuleLicensed
      (IQAppsNames[IQMS.Common.Applications.apCCP]);
  except
    Result := False;
  end;
end;

// Raises exception if the Credit Card is not licensed for this end user.
procedure CheckCreditCardLicensed;
begin
  if not IsCreditCardLicensed then
    // 'You are not licensed to use Credit Card Processing.'
    raise Exception.Create(cc_rscstr.cTXT0000050);
end;

function GetChargeSourceForTableName(const ATableName: string)
  : TChargePostingSource;
var
  i: Integer;
  o: TChargePostingSource;
begin
  Result := csNone;
  for o := Low(TChargePostingSource) to High(TChargePostingSource) do
   if CompareText(ATableName, ChargeSourceTableName[o]) = 0 then
     begin
       Result := o;
       Break;
     end;
{
  if CompareText(ATableName, ChargeSourceTableName[csOrders]) = 0 then
    Result := csOrders
  else if CompareText(ATableName, ChargeSourceTableName[csARPrepost]) = 0 then
    Result := csARPrepost
  else if CompareText(ATableName, ChargeSourceTableName[csARInvoice]) = 0 then
    Result := csARInvoice
  else if CompareText(ATableName, ChargeSourceTableName[csCashReceipts]) = 0 then
    Result := csCashReceipts
  else
    Result := csNone; }
end;

procedure GetTotalCharged(AChargeSource: TChargePostingSource;
  AChargeSourceID: Int64; var ATotalAmount, ATaxAmount: Real);
begin
  ATotalAmount := 0;
  ATaxAmount := 0;

  case AChargeSource of
    csOrders:
      with TFDStoredProc.Create(nil) do
        try
          Connection := UniMainModule.FDConnection1;
          StoredProcName := 'IQMS.CC.GET_CHARGED_ON_ORDER';
          // Params IN
          with Params.CreateParam(ftFMTBcd, 'v_orders_id', ptInput) do
            AsFMTBcd := AChargeSourceID;
          // Params OUT
          Params.CreateParam(ftFMTBcd, 'v_total', ptOutput);
          Params.CreateParam(ftFMTBcd, 'v_tax', ptOutput);
          // Get values
          Prepare;
          ExecProc;
          // Apply values
          ATotalAmount := ParamByName('v_total').AsFloat;
          ATaxAmount := ParamByName('v_tax').AsFloat;
        finally
          Free;
        end;

    csARPrepost:
      with TFDStoredProc.Create(nil) do
        try
          Connection := UniMainModule.FDConnection1;
          StoredProcName := 'IQMS.CC.GET_CHARGED_ON_ARPREPOST';
          // Params IN
          with Params.CreateParam(ftFMTBcd, 'v_arprepost_id', ptInput) do
            AsFMTBcd := AChargeSourceID;
          // Params OUT
          Params.CreateParam(ftFMTBcd, 'v_total', ptOutput);
          Params.CreateParam(ftFMTBcd, 'v_tax', ptOutput);
          // Get values
          Prepare;
          ExecProc;
          // Apply values
          ATotalAmount := ParamByName('v_total').AsFloat;
          ATaxAmount := ParamByName('v_tax').AsFloat;
        finally
          Free;
        end;

    csARInvoice:
      with TFDStoredProc.Create(nil) do
        try
          Connection := UniMainModule.FDConnection1;
          StoredProcName := 'IQMS.CC.GET_CHARGED_ON_ARINVOICE';
          // Params IN
          with Params.CreateParam(ftFMTBcd, 'v_arinvoice_id', ptInput) do
            AsFMTBcd := AChargeSourceID;
          // Params OUT
          Params.CreateParam(ftFMTBcd, 'v_total', ptOutput);
          Params.CreateParam(ftFMTBcd, 'v_tax', ptOutput);
          // Get values
          Prepare;
          ExecProc;
          // Apply values
          ATotalAmount := ParamByName('v_total').AsFloat;
          ATaxAmount := ParamByName('v_tax').AsFloat;
        finally
          Free;
        end;
  end;
end;

procedure GetTotalToCharge(AChargeSource: TChargePostingSource;
  AChargeSourceID: Int64; var ATotalAmount, ATaxAmount, AFreight: Real);
var
  ARPrepostID, AArinvoiceID, AOrdersID, AChargedTax, AChargedAmount,
    AAmountToCharge, ATaxToCharge: Real;
  ASourceTableName: string;
  AHeader, ADetail: Variant;
begin
  // Initialization
  AHeader := Unassigned;
  ADetail := Unassigned;
  ARPrepostID := 0;
  AArinvoiceID := 0;
  ATotalAmount := 0;
  ATaxAmount := 0;
  AFreight := 0;
  AChargedTax := 0;
  AChargedAmount := 0;

  if AChargeSource = csNone then
    Exit;

  // Verify licensing
  iqcc_utils.CheckCreditCardLicensed;

  cc_encrypt.ResetPackage;

  // Get the table name for the charge source
  ASourceTableName := ChargeSourceTableName[AChargeSource];

  // Get what has already been charged for this source
  iqcc_utils.GetTotalCharged(AChargeSource, AChargeSourceID,
    { var } AChargedAmount,
    { var } AChargedTax);

  case AChargeSource of
    csOrders:
      begin
        // Assign header ID variable based on source ID parameter
        AOrdersID := AChargeSourceID;

        // Get header record data
        AHeader := SelectValueArrayFmt(
          'SELECT a.arcusto_id AS arcusto_id, a.bill_to_id AS bill_to_id,'#13 +
          '       a.ship_to_id AS ship_to_id,'#13 +
          '       a.arcusto_credit_card_id AS arcusto_credit_card_id, '#13 +
          '       a.pono AS pono, a.freight_charge AS freight_charge'#13 +
          '  FROM orders a'#13 +
          ' WHERE a.id = %d', [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Populate header record data variables
        AFreight := System.Variants.VarAsType(AHeader[5], varDouble);

        // Get detail record data
        ADetail := SelectValueArrayFmt(
          'SELECT SUM(ROUND(ROUND(NVL(d.total_qty_ord, 0) * NVL(d.unit_price, 0) + '#13 +
          '         DECODE(SIGN(d.id - v.min_id), 0,'#13 +
          '         DECODE(NVL(t.include_freight, ''N''), ''N'', 0,'#13 +
          '            NVL(o.freight_charge, 0)), 0), 2) *'#13 +
          '            NVL(t.tax_rate, 0) / 100, 2)) AS total_tax,'#13 +
          '       SUM(ROUND(NVL(d.total_qty_ord, 0) * NVL(d.unit_price, 0), 2)) +'#13 +
          '       SUM(ROUND(ROUND(NVL(d.total_qty_ord, 0) * NVL(d.unit_price, 0) +'#13 +
          '                       DECODE(SIGN(d.id - v.min_id), 0,'#13 +
          '                       DECODE(NVL(t.include_freight, ''N''),'#13 +
          '                              ''N'', 0,'#13 +
          '                              NVL(o.freight_charge, 0)), 0), 2) *'#13 +
          '                 NVL(t.tax_rate, 0) /'#13 +
          '                 100, 2))'#13 +
          '          AS grand_total'#13 +
          '  FROM ord_detail d, (SELECT MIN(id) AS min_id'#13 +
          '                      FROM ord_detail'#13 +
          '                      WHERE orders_id = %d) v, v_tax_codes t, orders o'#13 +
          ' WHERE d.orders_id = %d AND'#13 +
          '       t.id(+) = d.tax_code_id AND'#13 +
          '       d.orders_id = o.id',
          [AChargeSourceID, AChargeSourceID]);

        // Populate detail record data variables
        if System.Variants.VarArrayDimCount(ADetail) > 0 then
          begin
            ATaxAmount := System.Variants.VarAsType(ADetail[0], varDouble);
            ATotalAmount := System.Variants.VarAsType(ADetail[1], varDouble) +
              AFreight;
          end;

        // Get the amounts to charge by subtracting what was charged
        // previously from existing totals.
        // Note:  Total amount includes tax and freight by default.
        ATotalAmount := IQMS.Common.Numbers.DtoF(ATotalAmount);
        AChargedAmount := IQMS.Common.Numbers.DtoF(AChargedAmount);
        ATaxAmount := IQMS.Common.Numbers.DtoF(ATaxAmount);
        AChargedTax := IQMS.Common.Numbers.DtoF(AChargedTax);
        AAmountToCharge := IQMS.Common.Numbers.DtoF(ATotalAmount - AChargedAmount);
        ATaxToCharge := IQMS.Common.Numbers.DtoF(ATaxAmount - AChargedTax);
      end;
    csARPrepost:
      begin
        // Assign header ID variable based on source ID parameter
        ARPrepostID := AChargeSourceID;

        // Get the Sales Order ID (ORDERS.ID) from the Invoice header
        AOrdersID := SelectValueFmtAsInt64(
          'SELECT orders_id'#13 +
          '  FROM ord_detail'#13 +
          ' WHERE id = (SELECT MIN(ord_detail_id)'#13 +
          '               FROM arprepost_detail'#13 +
          '              WHERE arprepost_id = %d) AND'#13 +
          '       ROWNUM < 2',
          [AChargeSourceID]);

        // Get header record data
        AHeader := SelectValueArrayFmt(
          'SELECT a.arcusto_id AS arcusto_id, a.bill_to_id AS bill_to_id,'#13 +
          '       a.arinvoice_id AS arinvoice_id,'#13 +
          '       a.arcusto_credit_card_id AS arcusto_credit_card_id'#13 +
          '  FROM arprepost a'#13 +
          ' WHERE a.id = %d', [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Populate header record data variables
        AArinvoiceID := System.Variants.VarAsType(AHeader[2], varInteger);

        // Get detail record data
        ADetail := SelectValueArrayFmt(
          'SELECT net_tax, freight, total'#13 +
          '  FROM v_arprepost_detail_total'#13 +
          ' WHERE arprepost_id = %d',
          [AChargeSourceID]);

        // Populate detail record data variables
        if System.Variants.VarArrayDimCount(ADetail) > 0 then
          begin
            ATaxAmount := System.Variants.VarAsType(ADetail[0], varDouble);
            AFreight := System.Variants.VarAsType(ADetail[1], varDouble);
            // Note:  Total amount already includes the tax and freight.
            // See the view, v_arprepost_detail_total.
            ATotalAmount := System.Variants.VarAsType(ADetail[2], varDouble);
          end;

        // Get the amounts to charge by subtracting what was charged
        // previously from existing totals.
        ATotalAmount := IQMS.Common.Numbers.DtoF(ATotalAmount);
        AChargedAmount := IQMS.Common.Numbers.DtoF(AChargedAmount);
        ATaxAmount := IQMS.Common.Numbers.DtoF(ATaxAmount);
        AChargedTax := IQMS.Common.Numbers.DtoF(AChargedTax);
        AAmountToCharge := IQMS.Common.Numbers.DtoF(ATotalAmount - AChargedAmount);
      end;
    csARInvoice:
      begin
        // Assign header ID variable based on source ID parameter
        AArinvoiceID := AChargeSourceID;

        // Get the Sales Order ID (ORDERS.ID) from the Invoice header
        AOrdersID := SelectValueFmtAsInt64(
          'SELECT MIN(b.orders_id) AS id'#13 +
          '  FROM arinvoice_detail a, ord_detail b'#13 +
          ' WHERE a.arinvoice_id = %d AND'#13 +
          '       a.ord_detail_id = b.id',
          [AChargeSourceID]);

        // Get header record data
        AHeader := SelectValueArrayFmt(
          'SELECT a.arcusto_id AS arcusto_id, a.bill_to_id AS bill_to_id,'#13 +
          '       a.arcusto_credit_card_id AS arcusto_credit_card_id'#13 +
          '  FROM arinvoice a'#13 +
          ' WHERE a.id = %d', [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Get detail record data
        ADetail := SelectValueArrayFmt(
          'SELECT net_tax, freight, total'#13 +
          '  FROM v_arinvoice_detail_total'#13 +
          ' WHERE arinvoice_id = %d',
          [AChargeSourceID]);

        // Populate detail record data variables
        if System.Variants.VarArrayDimCount(ADetail) > 0 then
          begin
            ATaxAmount := System.Variants.VarAsType(ADetail[0], varDouble);
            AFreight := System.Variants.VarAsType(ADetail[1], varDouble);
            // Note:  Total amount already includes the tax;
            // just add the freight.
            ATotalAmount := System.Variants.VarAsType(ADetail[2], varDouble);
          end;

        // Get the amounts to charge by subtracting what was charged
        // previously from existing totals.
        ATotalAmount := IQMS.Common.Numbers.DtoF(ATotalAmount);
        AChargedAmount := IQMS.Common.Numbers.DtoF(AChargedAmount);
        ATaxAmount := IQMS.Common.Numbers.DtoF(ATaxAmount);
        AChargedTax := IQMS.Common.Numbers.DtoF(AChargedTax);
        AAmountToCharge := IQMS.Common.Numbers.DtoF(ATotalAmount - AChargedAmount);
        ATaxToCharge := IQMS.Common.Numbers.DtoF(ATaxAmount - AChargedTax);
      end;
  end;
  // Return values
  ATotalAmount := AAmountToCharge;
  ATaxAmount := ATaxToCharge;
end;

function GetGatewayIndex(const ACurrencyID: Int64): Integer;
var
  AID: Int64;
begin
  { Gateway Index:

    Index               Gateway
    -----------------------------------------
    -1                  (None)
    0                   TSYS
    1                   Authorize.Net
    24                  3DSI EC-Linx
    31                  Moneris Canada
    64                  Moneris USA

  }

  Result := - 1;

  AID := cc_params.GetCreditCardAccountID(ACurrencyID);
  if AID = 0 then
    Exit;

  // The TCreditCardGateway type is declared in cc_types.pas
  // The TCreditCardGateway listing is uniquely ours (IQMS), and is not
  // linked to any /n Software IBiz component listing.
  Result := SelectValueFmtAsInteger(
    'SELECT NVL(gateway, -1) FROM credit_card_account WHERE id = %d',
    [AID]);
end;

function GetDecryptedMaskedAccount(const AAccount: string): string;
var
  S: string;
begin
  S := cc_encrypt.CCKeyDecrypt(AAccount);
  Result := GetMaskedAccount(S);
end;

function GetMaskedAccount(const AAccount: string): string;
var
  ALast4: string;
  i: Integer;
begin
  Result := '';
  if (Trim(AAccount) = '') then
    Exit;
    { TODO -oysingh -cWebConvert :  IQMS.Common.StringUtils has no RightStr method }
  ALast4 := IQMS.Common.StringUtils.RightStr(AAccount, 4);
  for i := 1 to Length(AAccount) - 4 do
    Result := Result + '*';
  Result := Result + ALast4;
end;

function GetDecryptedAccountLastFour(const AAccount: string): string;
var
  S: string;
begin
  S := cc_encrypt.CCKeyDecrypt(AAccount);
  Result := GetAccountLastFour(S);
end;

function GetAccountLastFour(const AAccount: string): string;
begin
  Result := '';
  if (Trim(AAccount) > '') then
  { TODO -oysingh -cWebConvert :  IQMS.Common.StringUtils has no RightStr method }
    Result := IQMS.Common.StringUtils.RightStr(AAccount, 4);
end;

procedure ClearCreditCardChargeInfo(var ACreditCardChargeInfo: TCreditCardChargeInfo);
begin
  ZeroMemory(@ACreditCardChargeInfo, SizeOf(TCreditCardChargeInfo));
end;

end.
