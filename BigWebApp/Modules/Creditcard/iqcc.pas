unit iqcc;

(* *** Credit Card Processing ***
  *
  *  This unit provides wrappers for credit card processing.  It can
  *  safely be declared in any application unit.  All wrappers execute a
  *  screen through COM.
  *
  *  There are additional "helper" methods in this unit which can
  *  also be called.
  *
  *  Note:  Under no circumstances are any credit card units to have jumps to
  *         other parts of the software.  No other module shall be referenced
  *         in the credit card units.  Likewise, not module is to declare any
  *         credit card unit, except iqcc for processing cards.
  *
  *         /n Software has a strict (or restrictive) licensing agreement
  *         where they attempt to require anyone, who desires to compile our
  *         software, to have their component payed for and installed.  We get
  *         around this by isolating all credit card processing to this
  *         COM executable.
  *
  *
*)

interface

uses
  Vcl.Forms,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,
  iqcc_utils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf;

// *************************************************** //
// ***                Wrappers                     *** //
// *************************************************** //

// Shows the list of cards for a customer
procedure CC_DoShowCustCreditCards(AArcustoID: Real); // shows cc_custcards.pas

// Shows a list of accepted credit card types for the company
procedure CC_DoAcceptedCreditCards; // shows cc_cardtypes.pas

// Charge a credit card (main wrapper).  Displays the charge screen.
procedure CC_DoCustCharge(AChargeSource: TChargePostingSource;
  AChargeSourceID: LargeInt);

// Charge a credit card (web wrapper).  Charges card "silently" (no Windows
// dialog boxes), and returns boolean result with any error message.
// function CC_DoCustChargeSilent(ACreditCardChargeInformation
// : TCreditCardChargeInfo; var AResponse: string): Boolean;
// function CC_DoCustChargeSilentB(AArcustoCreditCardID: Real;
// ATotalAmount, ATaxAmount, AFreightAmount: Real; ACVV2: string;
// var ACreditCardTransID: Real; var AResponse: string): Boolean;

// Shows the Settlement screen
procedure CC_DoSettleCreditCharges; // shows cc_settle.pas

// Attach a credit card to a customer record
// Wrapper shows cc_attach.pas
procedure CC_AttachCreditCard(AChargeSource: TChargePostingSource;
  AChargeSourceID, AArcustoID: Real); overload;
procedure CC_AttachCreditCard(AChargeSource: string;
  AChargeSourceID, AArcustoID: Real); overload;

// Show the Credit Card transaction log
procedure CC_CreditCardTransLog;

// *************************************************** //
// ***             Additional Methods              *** //
// *************************************************** //

// Inserts or updates Customer Credit Card (ARCUSTO_CREDIT_CARD)
// If inserting and you need to know the ARCUSTO_CREDIT_CARD.ID value,
// pass the value you want to use for the new record; otherwise, you can
// pass zero (0) for the ANewID value.  Encrypted data will be
// saved to the record.
procedure SetArcustoCreditCard(
  const ANewID: Real; // Required
  const AArcustoID: Real; // Required
  const ACreditCardID: Real; // Required
  const AAccount, // Required
  ANameOnCard, // Required
  AExpires: string; // Required
  ADefault: Boolean = False);

// Returns Customer Credit Card data (ARCUSTO_CREDIT_CARD).
// Pass the ARCUSTO_CREDIT_CARD.ID containing the data you need.
// The "var" params will be filled with the unencrypted record data.
procedure GetArcustoCreditCard(const AArcustoCreditCardID: Real;
  var AArcustoID: Real; var ACreditCardID: Real;
  var AAccount, ANameOnCard, AExpires: string; var ADefault: Boolean);

// Credit Card Validation:
// A.) Determines if the card on file (for the given
// ARCUSTO_CREDIT_CARD.ID) is valid.
function ValidateCreditCardA(const AArcustoCreditCardID: Real;
  var AErrorMsg: string): Boolean;
// B.) Not only determines if the card on file is valid, but
// also checks of amounts are acceptable.
function ValidateCreditCardB(const AArcustoCreditCardID: Real;
  AAmount, ATax, AFreight: Real; var AErrorMsg: string): Boolean;

function EncryptionKeysExpired: Boolean;
function EncryptionKeysExpiredEx(var ALastEncrypted: TDateTime;
  var ADaysElapsed: Integer): Boolean;
procedure CheckPromptCreditCardEncryption;

implementation

// cc_charge, cc_settle, cc_custcards
uses
  cc_const,
  cc_encrypt,
  cc_rscstr,
  cc_valid,
  IQMS.Common.Boolean,
  IQMS.Common.COMExe,
  IQMS.Common.COMServer,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  System.DateUtils;


// *************************************************** //
// ***             Begin Wrappers                 *** //
// *************************************************** //

procedure CC_DoShowCustCreditCards(AArcustoID: Real);
begin

  if AArcustoID = 0 then
    raise Exception.Create
      (cc_rscstr.cTXT0000024 { 'Please specify a Customer.' } );

  try
    try
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_CUSTOMER_CARDS,
        AArcustoID]);
    finally
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CC_DoAcceptedCreditCards;
begin
  try
    try
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_CARD_TYPES, 0]);
    finally
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CC_DoCustCharge(AChargeSource: TChargePostingSource;
  AChargeSourceID: LargeInt);
var
  AArcustoID, ABillToID, AShipToID, AArcustoCreditCardID, ARPrepostID,
    AArinvoiceID, AOrdersID, APO_ID, ATotalAmount, ATaxAmount, AFreight,
    AChargedTax, AChargedAmount, AAmountToCharge, ATaxToCharge: Real;

  APONo, ASourceTableName: string;
  AHeader, ADetail: Variant;
begin
  // Initialization
  AHeader := Unassigned;
  ADetail := Unassigned;
  AShipToID := 0;
  ARPrepostID := 0;
  AArinvoiceID := 0;
  APO_ID := 0;
  ATotalAmount := 0;
  ATaxAmount := 0;
  AFreight := 0;
  AChargedTax := 0;
  AChargedAmount := 0;
  APONo := '';

  // Allow calling button to repaint after click
  Application.ProcessMessages;

  if (AChargeSource = csNone) then
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
          'SELECT a.arcusto_id,                   '#13 +
          '       a.bill_to_id,                   '#13 +
          '       a.ship_to_id,                   '#13 +
          '       a.arcusto_credit_card_id,       '#13 +
          '       a.pono,                         '#13 +
          '       a.freight_charge                '#13 +
          '  FROM orders a                        '#13 +
          ' WHERE a.id = %d                       ',
          [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Populate header record data variables
        AArcustoID := System.Variants.VarAsType(AHeader[0], varInt64);
        ABillToID := System.Variants.VarAsType(AHeader[1], varInt64);
        AShipToID := System.Variants.VarAsType(AHeader[2], varInt64);
        AArcustoCreditCardID := System.Variants.VarAsType(AHeader[3], varInt64);
        APONo := System.Variants.VarToStr(AHeader[4]);
        AFreight := System.Variants.VarAsType(AHeader[5], varDouble);

        APO_ID := SelectValueFmtAsInt64(
          'SELECT id FROM po WHERE pono = ''%s''',
          [FixStr(APONo)]);
        // Get detail record data
        ADetail := SelectValueArrayFmt(
          'SELECT oe_misc.get_order_tax_total(id) AS total_tax,     '#13 +
          '       oe_misc.get_order_grand_total(id) AS grand_total  '#13 +
          '  FROM orders                                            '#13 +
          ' WHERE id = %d                                           ',
          [AChargeSourceID]);

        // Populate detail record data variables
        if System.Variants.VarArrayDimCount(ADetail) > 0 then
          begin
            ATaxAmount := System.Variants.VarAsType(ADetail[0], varDouble);
            // NOTE:  The total from the package includes the freight
            ATotalAmount := System.Variants.VarAsType(ADetail[1], varDouble);
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

        // Has the full amount been authorized or settled? If so do not charge.
        // cc_rscstr.cTXT0000403 = 'The Customer has already been charged for
        // the full amount of this order. Continue?';
        if (AChargedAmount > 0) and (AAmountToCharge = 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000403) then
          Exit
          // cc_rscstr.cTXT0000404 = 'The Customer has already been overcharged
          // for this order.  Continue?.';
        else if (AChargedAmount > 0) and (AAmountToCharge < 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000404) then
          Exit;

        // Have invoices been charged against this sales order (in credit_card_trans)?
        // cc_rscstr.cTXT0000405 = 'An invoice has already been charged for
        // this Sales Order.  Continue?';
        if (SelectValueFmtAsInteger(
          'SELECT 1                         '#13 +
          '  FROM credit_card_trans         '#13 +
          'WHERE arprepost_id > 0 AND       '#13 +
          '      orders_id = %d AND         '#13 +
          '      status <> 2 AND            '#13 +
          '      ROWNUM < 2                 ',
          [AChargeSourceID]) > 0) and
          not IQConfirmYN(cc_rscstr.cTXT0000405) then
          Exit;

      end;
    csARPrepost:
      begin
        // Assign header ID variable based on source ID parameter
        ARPrepostID := AChargeSourceID;

        // Get the Sales Order ID (ORDERS.ID) from the Invoice header
        AOrdersID := SelectValueFmtAsInt64(
          'SELECT orders_id                                   '#13 +
          '  FROM ord_detail                                  '#13 +
          ' WHERE id = (SELECT MIN(ord_detail_id)             '#13 +
          '               FROM arprepost_detail               '#13 +
          '              WHERE arprepost_id = %d) AND         '#13 +
          '       ROWNUM < 2                                  ',
          [AChargeSourceID]);

        // Get header record data
        AHeader := SelectValueArrayFmt(
          'SELECT a.arcusto_id AS arcusto_id,                 '#13 +
          '       a.bill_to_id AS bill_to_id,                 '#13 +
          '       a.arinvoice_id AS arinvoice_id,             '#13 +
          '       a.arcusto_credit_card_id                    '#13 +
          '  FROM arprepost a                                 '#13 +
          ' WHERE a.id = %d                                   ',
          [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Populate header record data variables
        AArcustoID := System.Variants.VarAsType(AHeader[0], varInt64);
        ABillToID := System.Variants.VarAsType(AHeader[1], varInt64);
        AArinvoiceID := System.Variants.VarAsType(AHeader[2], varInt64);
        AArcustoCreditCardID := System.Variants.VarAsType(AHeader[3], varInt64);

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

        // Has the full amount been authorized or settled? If so do not charge.
        // cc_rscstr.cTXT0000406 = 'The Customer has already been charged for
        // the full amount of this invoice.  Continue?';
        if (AChargedAmount > 0) and (AAmountToCharge = 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000406) then
          Exit
          // cc_rscstr.cTXT0000407 = 'The Customer has already been
          // overcharged for this invoice.  Continue?';
        else if (AChargedAmount > 0) and (AAmountToCharge < 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000407) then
          Exit;

      end;
    csARInvoice:
      begin
        // Assign header ID variable based on source ID parameter
        AArinvoiceID := AChargeSourceID;

        // Get the Sales Order ID (ORDERS.ID) from the Invoice header
        AOrdersID := SelectValueFmtAsInt64(
          'SELECT MIN(b.orders_id) AS id            '#13 +
          '  FROM arinvoice_detail a, ord_detail b  '#13 +
          ' WHERE a.arinvoice_id = %d AND           '#13 +
          '       a.ord_detail_id = b.id            ',
          [AChargeSourceID]);

        // Get header record data
        AHeader := SelectValueArrayFmt(
          'SELECT a.arcusto_id,               '#13 +
          '       a.bill_to_id,               '#13 +
          '       a.arcusto_credit_card_id    '#13 +
          '  FROM arinvoice a                 '#13 +
          ' WHERE a.id = %d                   ',
          [AChargeSourceID]);

        // Verify header record data exists
        if System.Variants.VarArrayDimCount(AHeader) = 0 then
          // 'Application Error:  Record data unavailable.  Operation aborted.';
          raise Exception.Create(cc_rscstr.cTXT0000408);

        // Populate header record data variables
        AArcustoID := System.Variants.VarAsType(AHeader[0], varInt64);
        ABillToID := System.Variants.VarAsType(AHeader[1], varInt64);
        AArcustoCreditCardID := System.Variants.VarAsType(AHeader[2], varInt64);

        // Get detail record data
        ADetail := SelectValueArrayFmt(
          'SELECT net_tax, freight, total     '#13 +
          '  FROM v_arinvoice_detail_total    '#13 +
          ' WHERE arinvoice_id = %d           ',
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

        // Has the full amount been authorized or settled? If so do not charge.
        // cc_rscstr.cTXT0000406 = 'The Customer has already been charged for
        // the full amount of this invoice.  Continue?';
        if (AChargedAmount > 0) and (AAmountToCharge = 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000406) then
          Exit
          // cc_rscstr.cTXT0000407 = 'The Customer has already been
          // overcharged for this invoice.  Continue?';
        else if (AChargedAmount > 0) and (AAmountToCharge < 0) and
          not IQMS.Common.Dialogs.IQWarningYN(cc_rscstr.cTXT0000407) then
          Exit;

      end;
  else
    Exit;
  end;

  // After gather data, verify that a customer record exists.
  // We require a customer at this point because we need to
  // associate each transaction with a customer record -- even
  // if we are doing a manual charge.
  if (AArcustoID = 0) then
    // 'Please specify a Customer.'
    raise Exception.Create(cc_rscstr.cTXT0000024);

  // Charge the card.  We do this by calling the Credit Card
  // "charge" event through DCOM.  This involves passing a
  // very lengthy list of parameters, but we need to do it this
  // way to allow flexibility.
  try
    try
      // Hide the "please wait" message, if applicable
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;

      // Show the credit card "charge" screen
      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_CHARGE_CARD,
        ASourceTableName, AArcustoID, ABillToID, AShipToID, AAmountToCharge,
        ATaxToCharge, AFreight, AArcustoCreditCardID, ARPrepostID, AArinvoiceID,
        AOrdersID, APO_ID, APONo]);
    finally
      // Reset the "please wait" message
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    // Show exception if it is not related to OLE and is not EAbort.
    // We check exception type, in case the user has clicked "Cancel"
    // somewhere in the process.
    on E: Exception do
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CC_DoSettleCreditCharges;
begin
  try
    try
      // 02/18/2009 Remmed these lines.  Although it is desirable to hide
      // the ugly "please wait" message, if the application is called
      // from SmartPage, then for some reason (I never determined
      // why) it will cause the application to terminate.  In effect, the
      // screen will flash momentarily and disappear.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;

      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_SETTLE_TRANS, 0]);
    finally
      // 02/18/2009 See foregoing note.
      // if Assigned(IQMS.Common.COMServer.IQComSrvList) then
      // IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CC_AttachCreditCard(AChargeSource: TChargePostingSource;
  AChargeSourceID, AArcustoID: Real);
var
  ATableName: string;
begin

  // Get the table name for the charge source
  ATableName := ChargeSourceTableName[AChargeSource];

  // Set overload below
  CC_AttachCreditCard(ATableName, AChargeSourceID, AArcustoID);
end;

procedure CC_AttachCreditCard(AChargeSource: string;
  AChargeSourceID, AArcustoID: Real);
begin

  // Verify that we have a table name and ID
  if (Length(AChargeSource) = 0) or (AChargeSourceID = 0) then
    // cc_rscstr.cTXT0000025 = 'Application Error:  Please specify a dataset.'
    raise Exception.Create(cc_rscstr.cTXT0000025);

  // Verify that we have a customer ID
  if AArcustoID = 0 then
    // cc_rscstr.cTXT0000024 = 'Please specify a Customer.'
    raise Exception.Create(cc_rscstr.cTXT0000024);

  // Verify that the parent record exists
  try
    if SelectValueFmtAsInteger(
      'SELECT 1 FROM %s WHERE id = %.0f AND ROWNUM < 2',
      [AChargeSource, AChargeSourceID]) = 0 then
      // 'Please create a record before attempting to attach a credit card.'
      raise Exception.Create(cc_rscstr.cTXT0000026);
  except
    // 'Application Error:  The required dataset fields for attaching a
    // credit card were not found.'
    raise Exception.Create(cc_rscstr.cTXT0000027);
  end;

  try
    try
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_ATTACH_CARD, AChargeSource,
        AChargeSourceID, AArcustoID]); // IQMS.Common.COMExe.pas
    finally
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

procedure CC_CreditCardTransLog;
begin

  try
    try
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := True;
      IQMS.Common.COMExe.Com_Exec(CC_SERVER_NAME, [cc_const.CC_TRANSLOG, '', 0, 0]);
    finally
      if Assigned(IQMS.Common.COMServer.IQComSrvList) then
        IQMS.Common.COMServer.IQComSrvList.HidePleaseWaitMessage := False;
    end;
  except
    on E: Exception do // in case Cancel was clicked
      if not IQMS.Common.Miscellaneous.IgnoreCOMRaisedEAbort(E) then
        raise;
  end;
end;

// *************************************************** //
// ***         Begin Additional Methods            *** //
// *************************************************** //

procedure SetArcustoCreditCard(const ANewID: Real; const AArcustoID: Real;
  const ACreditCardID: Real; const AAccount, ANameOnCard, AExpires: string;
  ADefault: Boolean = False);
var
  i: Integer;
  AID: Int64;
  AAccountTrimmed, ALastFour, ALastFourMasked: string;
begin
  AAccountTrimmed := IQMS.Common.StringUtils.Numerics(AAccount);

  // Validation
  if Trunc(AArcustoID) = 0 then
    Exit;
  if Trim(AAccountTrimmed) = '' then
    Exit;
  if Trim(AExpires) = '' then
    Exit;

  // Get the last four
  { TODO -oysingh -cWebConvert :  IQMS.Common.StringUtils has no RightStr method }
  ALastFour := IQMS.Common.StringUtils.RightStr(AAccountTrimmed, 4);
  for i := 1 to Length(AAccountTrimmed) - 4 do
    ALastFourMasked := ALastFourMasked + '*';
  ALastFourMasked := ALastFourMasked + ALastFour;

  // Ensure ID has a value
  AID := Trunc(ANewID);
  if AID = 0 then
    AID := GetNextID('ARCUSTO_CREDIT_CARD');

  cc_encrypt.ResetPackage;

  // Record does not exist; add it.
  if (SelectValueFmtAsInt64(
    'SELECT id FROM arcusto_credit_card WHERE id = %.0f',
    [ANewID]) = 0) then
    begin
      ExecuteCommandParam(
        'INSERT INTO arcusto_credit_card(id,                          '#13 +
        '                                arcusto_id,                  '#13 +
        '                                credit_card_id,              '#13 +
        '                                acctno,                      '#13 +
        '                                name_on,                     '#13 +
        '                                exp_mmyy,                    '#13 +
        '                                expiration_date,             '#13 +
        '                                is_default,                  '#13 +
        '                                last_four,                   '#13 +
        '                                last_four_masked,            '#13 +
        '                                created,                     '#13 +
        '                                createdby)                   '#13 +
        '    VALUES (:id,                                             '#13 +
        '            :arcusto_id,                                     '#13 +
        '            :credit_card_id,                                 '#13 +
        '            iqms.cc_encrypt.get_encrypted(:acctno),          '#13 +
        '            :name_on,                                        '#13 +
        '            :exp_mmyy,                                       '#13 +
        '            iqms.cc.get_exp_date(:exp_mmyy2),                '#13 +
        '            :is_default,                                     '#13 +
        '            :last_four,                                      '#13 +
        '            :last_four_masked,                               '#13 +
        '            SYSDATE,                                         '#13 +
        '            misc.getusername)                                ',
        ['ID;INT64', 'ARCUSTO_ID;F', 'CREDIT_CARD_ID;F', 'ACCTNO', 'NAME_ON',
        'EXP_MMYY', 'EXP_MMYY2', 'IS_DEFAULT', 'LAST_FOUR', 'LAST_FOUR_MASKED'],
        [AID, AArcustoID, ACreditCardID, AAccountTrimmed, ANameOnCard, AExpires,
        AExpires, TIQBoolean.AsYN(ADefault), ALastFour, ALastFourMasked]);
    end
    // Record exists; update it.
  else
    begin
      ExecuteCommandParam(
        'UPDATE arcusto_credit_card '#13 +
        '   SET arcusto_id = :ARCUSTO_ID,'#13 +
        '       credit_card_id = :CREDIT_CARD_ID,'#13 +
        '       acctno = iqms.cc_encrypt.get_encrypted(:ACCTNO),'#13 +
        '       name_on = :NAME_ON,'#13 +
        '       exp_mmyy = :EXP_MMYY,'#13 +
        '       expiration_date = iqms.cc.get_exp_date(:EXP_MMYY2),'#13 +
        '       is_default = :IS_DEFAULT,'#13 +
        '       last_four = :LAST_FOUR,'#13 +
        '       last_four_masked = :LAST_FOUR_MASKED'#13 +
        ' WHERE id = :ID',
        ['ARCUSTO_ID;F', 'CREDIT_CARD_ID;F', 'ACCTNO', 'NAME_ON', 'EXP_MMYY',
        'EXP_MMYY2', 'IS_DEFAULT', 'LAST_FOUR', 'LAST_FOUR_MASKED', 'ID;INT64'],
        [AArcustoID, ACreditCardID, AAccountTrimmed, ANameOnCard, AExpires,
        AExpires, TIQBoolean.AsYN(ADefault), ALastFour, ALastFourMasked, AID]);
    end;

end;

procedure GetArcustoCreditCard(const AArcustoCreditCardID: Real;
  var AArcustoID: Real; var ACreditCardID: Real;
  var AAccount, ANameOnCard, AExpires: string; var ADefault: Boolean);
begin
  // Initialize
  AArcustoID := 0;
  ACreditCardID := 0;
  AAccount := '';
  ANameOnCard := '';
  AExpires := '';
  ADefault := False;

  // 10/12/2012 Required.  Reset package because CGI will use this
  // to grab data.
  cc_encrypt.ResetPackage;

  // Get data
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT a.arcusto_id AS arcusto_id,');
      SQL.Add('       a.credit_card_id AS credit_card_id,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.acctno) AS acctno,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.name_on) AS name_on,');
      SQL.Add('       iqms.cc_encrypt.get_decrypted(a.exp_mmyy) AS exp_mmyy,');
      SQL.Add('       a.is_default AS is_default');
      SQL.Add('  FROM arcusto_credit_card a');
      SQL.Add(Format(' WHERE a.id = %.0f', [AArcustoCreditCardID]));
      Open;
      if not (Bof and Eof) then
        begin
          AArcustoID := Fields[0].AsLargeInt;
          ACreditCardID := Fields[1].AsLargeInt;
          AAccount := Fields[2].AsString;
          ANameOnCard := Fields[3].AsString;
          AExpires := Fields[4].AsString;
          ADefault := Boolean(Fields[5].AsString = 'Y');
        end;
    finally
      Free;
    end;
end;

function ValidateCreditCardA(const AArcustoCreditCardID: Real;
  var AErrorMsg: string): Boolean;
var
  ACardNumber, ACardHolder, AExpires, ACardType: string;
  AIsToken: Boolean;
begin
  Result := False;
  AErrorMsg := '';
  if (Trunc(AArcustoCreditCardID) = 0) then
    Exit(False);
  cc_encrypt.ResetPackage;
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT SUBSTR(iqms.cc_encrypt.get_decrypted(a.acctno), 1, 20) AS acctno,');
      SQL.Add('       SUBSTR(iqms.cc_encrypt.get_decrypted(a.name_on), 1, 100) AS name_on,');
      SQL.Add('       SUBSTR(iqms.cc_encrypt.get_decrypted(a.exp_mmyy), 1, 10) AS exp_mmyy,');
      SQL.Add('       b.descrip,');
      SQL.Add('       a.is_token');
      SQL.Add('  FROM arcusto_credit_card a, credit_card b');
      SQL.Add(Format(' WHERE a.id = %.0f AND', [AArcustoCreditCardID]));
      SQL.Add('       b.id = a.credit_card_id');
      Open;
      if not (Bof and Eof) then
        begin
          ACardNumber := Fields[0].AsString;
          ACardHolder := Fields[1].AsString;
          AExpires := Fields[2].AsString;
          ACardType := Fields[3].AsString;
          AIsToken := Fields[3].AsString = 'Y';
          Result := cc_valid.ValidateCreditCardA(ACardNumber, AExpires,
            ACardType, AIsToken, { var } AErrorMsg, False);
        end
      else
        begin
          Result := False;
          // cc_rscstr.cTXT0000497 = 'Credit card record not found.';
          AErrorMsg := cc_rscstr.cTXT0000497;
        end;
    finally
      Free;
    end;
end;

function ValidateCreditCardB(const AArcustoCreditCardID: Real;
  AAmount, ATax, AFreight: Real; var AErrorMsg: string): Boolean;
begin
  Result := ValidateCreditCardA(AArcustoCreditCardID, { var } AErrorMsg);
  if not Result then
    Exit(False);
  { Note: We do allow negative charges, since some gateways support it.
    Just verify that the amount is not zero.
    cc_rscstr.cTXT0000064 = 'Please enter a value for Amount.' }
  if (AAmount = 0) then
    begin
      AErrorMsg := cc_rscstr.cTXT0000064;
      Exit(False);
    end;
  // cc_rscstr.cTXT0000052 = 'Invalid number for Amount.';
  if (AAmount < 0) then
    begin
      AErrorMsg := cc_rscstr.cTXT0000052;
      Exit(False);
    end;
  // 10/04/2012 The amount must be greater than the tax and freight
  // combined because it must include both tax and freight.
  { cc_rscstr.cTXT0000475 =
    'Invalid number for Amount.  The total charge amount must ' +
    'contain the tax and freight.' }
  if (AAmount < (ATax + AFreight)) then
    begin
      AErrorMsg := cc_rscstr.cTXT0000475;
      Exit(False);
    end;

  // if we get here, all is well
  Result := True;
end;

function EncryptionKeysExpired: Boolean;
begin
  // The package function will return 1 for True, 0 for False.
  Result := SelectValueAsInteger(
    'SELECT iqms.cc.get_encryption_keys_expired ' +
    'FROM DUAL') = 1;
end;

function EncryptionKeysExpiredEx(var ALastEncrypted: TDateTime;
  var ADaysElapsed: Integer): Boolean;
var
  ADaysSetting: Integer;
  AData: Variant;
begin
  ADaysElapsed := 0;
  ALastEncrypted := Date;
  Result := EncryptionKeysExpired; // see above
  AData := SelectValueArray(
    'SELECT a.encrypted_date, ' +
    'a.cryptoperiod_days FROM credit_card_setting a WHERE ROWNUM < 2');
  Result := Result and (System.Variants.VarArrayDimCount(AData) > 0);
  if Result then
    begin
      ALastEncrypted := System.Variants.VarAsType(AData[0], varDate);
      ADaysSetting := System.Variants.VarAsType(AData[1], varInteger);
      ADaysElapsed := System.DateUtils.DaysBetween(Now, ALastEncrypted);
      Result := ADaysElapsed > 0;
    end;
end;

procedure CheckPromptCreditCardEncryption;
var
  ADaysElapsed: Integer;
  ALastEncrypted: TDateTime;
  ADateStr: string;
begin
  // Prompt user
  if EncryptionKeysExpiredEx(ALastEncrypted, ADaysElapsed) then
    begin
      ADateStr := FormatDateTime('ddddd', ALastEncrypted);
      { cc_rscstr.cTXT0000508 =
        'Credit card encryption keys have passed the recommended ' +
        'duration.  Please change the credit card encryption keys.'#13#13 +
        'Encryption Date:  %s'#13'Days Elapsed:  %d' }
      IQMS.Common.Dialogs.IQWarningChk(Format(cc_rscstr.cTXT0000508,
        [ADateStr, ADaysElapsed]), 'Credit Card Encryption Keys Expired');
    end;
end;

end.
