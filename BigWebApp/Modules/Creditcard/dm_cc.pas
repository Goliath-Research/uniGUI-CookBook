unit dm_cc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  System.Variants,
  Data.DB,
  IQMS.WebVcl.Hpick,
  uniImage,
  cc_types,
  cc_epayment,
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
  uniImageList, uniGUIClasses;

type
  { TCC_DM }
  TCC_DM = class(TDataModule)
    PkArPrePost: TIQWebHPick;
    PkArPrePostID: TBCDField;
    PkArPrePostINVOICE_NO: TStringField;
    PkArPrePostINVOICE_DATE: TDateTimeField;
    PkArPrePostDUE_DATE: TDateTimeField;
    PkArPrePostCUSTNO: TStringField;
    PkArPrePostCOMPANY: TStringField;
    PkArPrePostATTN: TStringField;
    PkArPrePostSTART_DATE: TDateTimeField;
    PkArPrePostEND_DATE: TDateTimeField;
    PkArPrePostACCT: TStringField;
    PkArPrePostEPLANT_ID: TBCDField;
    PkArPrePostPRIOR_ENTRY: TStringField;
    PkOrders: TIQWebHPick;
    PkOrdersID: TBCDField;
    PkOrdersORDERNO: TStringField;
    PkOrdersPONO: TStringField;
    PkOrdersDATE_TAKEN: TDateTimeField;
    PkOrdersORD_BY: TStringField;
    PkOrdersCUSTNO: TStringField;
    PkOrdersCOMPANY: TStringField;
    PkOrdersSHIP_TO_ATTN: TStringField;
    PkOrdersBILL_TO_ATTN: TStringField;
    PkOrdersCRM_QUOTE_RFQ: TStringField;
    PkOrdersEPLANT_ID: TBCDField;
    PkPO: TIQWebHPick;
    PkPOPONO: TStringField;
    PkPOPO_DATE: TDateTimeField;
    PkPOID: TBCDField;
    PkPOEPLANT_ID: TBCDField;
    PkBillTo: TIQWebHPick;
    PkBillToARCUSTO_ID: TBCDField;
    PkBillToBILL_TO_ID: TBCDField;
    PkBillToCUSTNO: TStringField;
    PkBillToATTN: TStringField;
    PkBillToADDR1: TStringField;
    PkBillToADDR2: TStringField;
    PkBillToADDR3: TStringField;
    PkBillToCITY: TStringField;
    PkBillToSTATE: TStringField;
    PkBillToZIP: TStringField;
    PkBillToCOUNTRY: TStringField;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoPK_HIDE: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkBillToID: TBCDField;
    PkEmployee: TIQWebHPick;
    PkEmployeeID: TBCDField;
    PkEmployeeEMPNO: TStringField;
    PkEmployeeFIRST_NAME: TStringField;
    PkEmployeeLAST_NAME: TStringField;
    PkEmployeeADDR1: TStringField;
    PkEmployeeCITY: TStringField;
    PkEmployeeSTATE: TStringField;
    PkEmployeeCOUNTRY: TStringField;
    PkEmployeeZIP: TStringField;
    PkEmployeeEMAIL: TStringField;
    PkEmployeeEPLANT_ID: TBCDField;
    PkEmployeeUSER_NAME: TStringField;
    PkEmployeeEPLANT_NAME: TStringField;
    PkEmployeeDISPLAY_NAME: TStringField;
    PkCurrencyCode: TIQWebHPick;
    PkCurrencyCodeDESCRIP: TStringField;
    PkCurrencyCodeCHR3: TStringField;
    PkCurrencyCodeDIGIT3: TStringField;
    PkCurrencyCodeNATIVE_CURR: TStringField;
    PkCountryCode: TIQWebHPick;
    PkCountryCodeCOUNTRY: TStringField;
    PkCountryCodeCHR2: TStringField;
    PkCountryCodeCHR3: TStringField;
    PkCountryCodeDIGIT3: TStringField;
    PkCurrencyISO: TIQWebHPick;
    PkCurrencyISODESCRIP: TStringField;
    PkCurrencyISOCHR3: TStringField;
    PkCurrencyISODIGIT3: TStringField;
    PkShipToCustomer: TIQWebHPick;
    PkShipToCustomerSHIP_TO_ID: TBCDField;
    PkShipToCustomerATTN: TStringField;
    PkShipToCustomerADDR1: TStringField;
    PkShipToCustomerCITY: TStringField;
    PkShipToCustomerSTATE: TStringField;
    PkShipToCustomerZIP: TStringField;
    PkShipToCustomerCOUNTRY: TStringField;
    PkShipToInvoice: TIQWebHPick;
    PkShipToInvoiceSHIP_TO_ID: TBCDField;
    PkShipToInvoiceATTN: TStringField;
    PkShipToInvoiceADDR1: TStringField;
    PkShipToInvoiceCITY: TStringField;
    PkShipToInvoiceSTATE: TStringField;
    PkShipToInvoiceZIP: TStringField;
    PkShipToInvoiceCOUNTRY: TStringField;
    PkShipToOrder: TIQWebHPick;
    PkShipToOrderSHIP_TO_ID: TBCDField;
    PkShipToOrderATTN: TStringField;
    PkShipToOrderADDR1: TStringField;
    PkShipToOrderCITY: TStringField;
    PkShipToOrderSTATE: TStringField;
    PkShipToOrderZIP: TStringField;
    PkShipToOrderCOUNTRY: TStringField;
    PkARInvoice: TIQWebHPick;
    PkARInvoiceID: TBCDField;
    PkARInvoiceINVOICE_NO: TStringField;
    PkARInvoiceINVOICE_DATE: TDateTimeField;
    PkARInvoiceDUE_DATE: TDateTimeField;
    PkARInvoiceCUSTNO: TStringField;
    PkARInvoiceCOMPANY: TStringField;
    PkARInvoiceATTN: TStringField;
    PkARInvoiceSTART_DATE: TDateTimeField;
    PkARInvoiceEND_DATE: TDateTimeField;
    PkARInvoiceACCT: TStringField;
    PkARInvoiceEPLANT_ID: TBCDField;
    PkMerchantAccount: TIQWebHPick;
    PkMerchantAccountID: TBCDField;
    PkMerchantAccountDESCRIPTION: TStringField;
    PkMerchantAccountGATEWAY: TBCDField;
    PkMerchantAccountGATEWAY_DESCRIP: TStringField;
    PkMerchantAccountBANKINFO_DTL_ID: TBCDField;
    PkMerchantAccountBANK_ACCOUNT_NUMBER: TStringField;
    PkMerchantAccountBANK_ACCOUNT_DESCRIPTION: TStringField;
    PkMerchantAccountBANK_ACCOUNT_EPLANT_ID: TBCDField;
    PkMerchantAccountCURRENCY_ID: TBCDField;
    PkMerchantAccountCURR_DESCRIP: TStringField;
    PkMerchantAccountCURR_CODE: TStringField;
    PkMerchantAccountEPLANT_ID: TBCDField;
    PkMerchantAccountIS_DEFAULT: TStringField;
    PkMerchantAccountARCHIVED: TStringField;
    PkMerchantAccountMERCHANT_NAME: TStringField;
    PkTokenizationMerchantAccount: TIQWebHPick;
    PkTokenizationMerchantAccountID: TBCDField;
    PkTokenizationMerchantAccountDESCRIPTION: TStringField;
    PkTokenizationMerchantAccountGATEWAY: TBCDField;
    PkTokenizationMerchantAccountGATEWAY_DESCRIP: TStringField;
    PkTokenizationMerchantAccountBANKINFO_DTL_ID: TBCDField;
    PkTokenizationMerchantAccountBANK_ACCOUNT_NUMBER: TStringField;
    PkTokenizationMerchantAccountBANK_ACCOUNT_DESCRIPTION: TStringField;
    PkTokenizationMerchantAccountBANK_ACCOUNT_EPLANT_ID: TBCDField;
    PkTokenizationMerchantAccountCURRENCY_ID: TBCDField;
    PkTokenizationMerchantAccountCURR_DESCRIP: TStringField;
    PkTokenizationMerchantAccountCURR_CODE: TStringField;
    PkTokenizationMerchantAccountEPLANT_ID: TBCDField;
    PkTokenizationMerchantAccountIS_DEFAULT: TStringField;
    PkTokenizationMerchantAccountARCHIVED: TStringField;
    PkTokenizationMerchantAccountMERCHANT_NAME: TStringField;
    ResponseImageList: TUniImageList;
    procedure ApplyArcustoParams(DataSet: TDataSet);
    procedure PkShipToInvoiceBeforeOpen(DataSet: TDataSet);
    procedure PkShipToOrderBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FPkFilter_ArcustoID: Int64;
    FPkFilter_ARPrepostID: Int64;
    FPkFilter_OrdersID: Int64;
  public
    { Public declarations }
    { TODO : trichedit not yet converted. TUniImage has a problem }
    {procedure SetTransactionDisplay(AEPaymentProcessor: TEPaymentProcessor;
      ARichEdit: TRichEdit; AResponseImage: TUniImage);  }
    procedure LoadResponseImage(AResponseImage: TUniImage;
      AResponseClass: TResponseClass);

    function CountOfMerchantAccounts: Integer;
    function CountOfTokenizationMerchantAccounts: Integer;

    function SelectCustomerBillTo(const AArcustoID: Int64;
      var AID: Int64): Boolean;
    function SelectShipToForCustomer(const AArcustoID: Int64;
      var AID: Int64): Boolean;
    function SelectShipToFromInvoice(const AARPrepostID: Int64;
      var AID: Int64): Boolean;
    function SelectShipToFromOrder(const AOrdersID: Int64;
      var AID: Int64): Boolean;
    function SelectARPrepost(const AArcustoID: Int64; var AID: Int64): Boolean;
    function SelectARInvoice(const AArcustoID: Int64; var AID: Int64): Boolean;
    function SelectOrder(const AArcustoID: Int64; var AID: Int64;
      var AOrderNo: String; var APONO: String): Boolean;
    function SelectMerchantAccount(var AID: Int64): Boolean;
    function SelectMerchantAccountForTokenization(var AID: Int64): Boolean;
  end;

var
  CC_DM: TCC_DM;

implementation

{$R *.dfm}


uses
  cc_rscstr,
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  cc_helper_classes,
  uniPanel;

procedure TCC_DM.ApplyArcustoParams(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FPkFilter_ArcustoID);
  AssignQueryParamValue(DataSet, 'BY_ARCUSTO_ID',
    Integer(FPkFilter_ArcustoID > 0));
end;

function TCC_DM.SelectCustomerBillTo(const AArcustoID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_ArcustoID := AArcustoID;
  AID := 0; // initial
  with PkBillTo do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
    end;
end;

function TCC_DM.SelectMerchantAccount(var AID: Int64): Boolean;
begin
  AID := 0;
  // If there is only one merchant account, then just pass it.
  // Don't prompt the user
  if CountOfMerchantAccounts = 1 then
    begin
      AID := SelectValueAsInt64(
        'SELECT id FROM credit_card_account ' +
        'WHERE iqms.misc.eplant_filter_include_nulls(eplant_id) = 1 AND ' +
        'ROWNUM < 2');
      Result := AID > 0;
    end
  else
    with PkMerchantAccount do
      begin
        Result := Execute;
        if Result then
          AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
      end;
end;

function TCC_DM.SelectMerchantAccountForTokenization(var AID: Int64): Boolean;
begin
  AID := 0;
  // If there is only one merchant account, then just pass it.
  // Don't prompt the user
  if CountOfTokenizationMerchantAccounts = 1 then
    begin
      AID := SelectValueAsInt64(
        'SELECT id FROM credit_card_account ' +
        'WHERE iqms.misc.eplant_filter_include_nulls(eplant_id) = 1 AND ' +
        'gateway IS NOT NULL AND gateway IN (0, 61) AND ROWNUM < 2');
      Result := AID > 0;
    end
  else
    with PkTokenizationMerchantAccount do
      begin
        Result := Execute;
        if Result then
          AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
      end;
end;

function TCC_DM.SelectShipToForCustomer(const AArcustoID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_ArcustoID := AArcustoID;
  AID := 0; // initial
  with PkShipToCustomer do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('SHIP_TO_ID'), varInt64);
    end;
end;

function TCC_DM.SelectShipToFromInvoice(const AARPrepostID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_ARPrepostID := AARPrepostID;
  AID := 0; // initial
  with PkShipToInvoice do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('SHIP_TO_ID'), varInt64);
    end;
end;

function TCC_DM.SelectShipToFromOrder(const AOrdersID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_OrdersID := AOrdersID;
  AID := 0; // initial
  with PkShipToOrder do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('SHIP_TO_ID'), varInt64);
    end;
end;

function TCC_DM.SelectARInvoice(const AArcustoID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_ArcustoID := AArcustoID;
  AID := 0; // initial
  with PkARInvoice do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
    end;
end;

function TCC_DM.SelectARPrepost(const AArcustoID: Int64;
  var AID: Int64): Boolean;
begin
  FPkFilter_ArcustoID := AArcustoID;
  AID := 0; // initial
  with PkArPrePost do
    begin
      Result := Execute;
      if Result then
        AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
    end;
end;

function TCC_DM.SelectOrder(const AArcustoID: Int64; var AID: Int64;
  var AOrderNo: String; var APONO: String): Boolean;
begin
  FPkFilter_ArcustoID := AArcustoID;
  AID := 0; // initial
  with PkOrders do
    begin
      Result := Execute;
      if Result then
        begin
          AID := System.Variants.VarAsType(GetValue('ID'), varInt64);
          AOrderNo := GetValue('ORDERNO');
          APONO := GetValue('PONO');
        end;
    end;
end;

function TCC_DM.CountOfMerchantAccounts: Integer;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT COUNT( * )');
      SQL.Add('  FROM credit_card_account a');
      SQL.Add(' WHERE NVL(a.archived, ''N'') <> ''Y'' AND');
      SQL.Add('       iqms.misc.eplant_filter_include_nulls(a.eplant_id) = 1');
      Open;
      Result := Fields[0].AsInteger;
    finally
      Free;
    end;
end;

function TCC_DM.CountOfTokenizationMerchantAccounts: Integer;
begin
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT COUNT( * )');
      SQL.Add('  FROM credit_card_account a');
      SQL.Add(' WHERE a.gateway IS NOT NULL AND ');
      SQL.Add('       a.gateway IN (0, 61) AND');
      SQL.Add('       NVL(a.archived, ''N'') <> ''Y'' AND');
      SQL.Add('       iqms.misc.eplant_filter_include_nulls(a.eplant_id) = 1');
      Open;
      Result := Fields[0].AsInteger;
    finally
      Free;
    end;
end;

procedure TCC_DM.PkShipToInvoiceBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARPREPOST_ID', FPkFilter_ARPrepostID);
end;

procedure TCC_DM.PkShipToOrderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ORDERS_ID', FPkFilter_OrdersID);
end;

procedure TCC_DM.LoadResponseImage(AResponseImage: TUniImage;
  AResponseClass: TResponseClass);
var
  AParentPanel: TUniPanel;
begin
  AParentPanel := nil;
  if Assigned(AResponseImage) then
    begin
      if (AResponseImage.Parent is TUniPanel) then
        AParentPanel := TUniPanel(AResponseImage.Parent);
      case AResponseClass of
        rcSuccess:
          LoadBitmapFromImageList(ResponseImageList, 0, AResponseImage);
        rcWarning:
          LoadBitmapFromImageList(ResponseImageList, 1, AResponseImage);
        rcFailure:
          LoadBitmapFromImageList(ResponseImageList, 2, AResponseImage);
        rcError:
          LoadBitmapFromImageList(ResponseImageList, 3, AResponseImage);
        rcSecurity:
          LoadBitmapFromImageList(ResponseImageList, 4, AResponseImage);
      else
        AResponseImage.Picture.Bitmap := nil;
      end; // end case
      if Assigned(AParentPanel) then
        AParentPanel.Visible := Assigned(AResponseImage.Picture.Bitmap) and
          (AResponseClass in [rcSuccess, rcWarning, rcFailure, rcError,
          rcSecurity]);
    end;
end;

{ TODO : trichedit not yet converted. TUniImage has a problem }
(*procedure TCC_DM.SetTransactionDisplay(AEPaymentProcessor: TEPaymentProcessor;
  ARichEdit: TRichEdit; AResponseImage: TUniImage);
type
  TCustomLineData = packed record
    Caption, Value: string;
  end;

  TCustomLinesArray = array of TCustomLineData;
var
  AStatusText: string; // for debugging
  // additional status lines
  ACustomLines: TCustomLinesArray;
  ALastResponseClass: TResponseClass;
  AGateway: TCreditCardGateway;
  AMerchantName: string;
  // ---------------------------------------------------------------------------
  procedure _addLine(ACaption, AText: string; AWarningFont: Boolean = False);
  var
    AIndex, AIndexEx: Integer;
    ACaptionStr: string;
  begin
    // Do not add empty line
    if Trim(AText) = '' then
      Exit;
    with ARichEdit do
      begin
        SelStart := Length(ARichEdit.Text);
        SelLength := 0;
        SelAttributes.Style := [fsBold];
        SelAttributes.Color := clBlack;
        ACaptionStr := ACaption + ':  ';
        AIndex := Lines.Add(ACaptionStr);
        AIndexEx := Perform(EM_LINEINDEX, AIndex, 0) + Length(ACaptionStr);
        // + 1;
        SelStart := AIndexEx;
        SelLength := 0;
        SelAttributes.Style := [];
        if AWarningFont then
          SelAttributes.Color := clRed;
        // SelLength := 0;
        // SelStart := SelStart + 1;
        SelText := AText;
        SelStart := Length(Lines.Strings[AIndex]);
        SelLength := 0;
      end;
  end;
// ---------------------------------------------------------------------------
  procedure _addCustomLine(ACaption, AValue: string);
  var
    AIndex: Integer;
  begin
    if (ACaption = '') or (AValue = '') then
      Exit;
    AIndex := high(ACustomLines) + 1;
    SetLength(ACustomLines, AIndex + 1);
    ACustomLines[AIndex].Caption := ACaption;
    ACustomLines[AIndex].Value := AValue;
  end;
// ---------------------------------------------------------------------------

begin
  AResponseImage.Picture.Bitmap := nil;
  try
    ARichEdit.Lines.BeginUpdate;
    // Clear and initialize the RTF
    ARichEdit.Clear;
    ARichEdit.SelectAll;
    ARichEdit.SelAttributes.Style := [fsBold];

    ALastResponseClass := AEPaymentProcessor.Response.StatusClass;
    AGateway := AEPaymentProcessor.Gateway;
    AMerchantName := AEPaymentProcessor.MerchantName;

    if (AEPaymentProcessor.GetLastTransactionType <> ttAVSOnly) then
      begin
        // cc_rscstr.cTXT0000224 = 'Status'
        _addLine(cc_rscstr.cTXT0000224,
          ResponseClassDescription[ALastResponseClass],
          (ALastResponseClass in [rcFailure, rcError, rcSecurity]));
        // Gateway Response Status
        AStatusText := AEPaymentProcessor.Response.StatusDescription;
        if not String.IsNullOrWhiteSpace(AStatusText) then
          // cc_rscstr.cTXT0000463 = 'Response Text';
          _addLine(cc_rscstr.cTXT0000463, AStatusText,
            (ALastResponseClass in [rcFailure, rcError, rcSecurity]));
        // cc_rscstr.cTXT0000482 = 'Approval';
        _addLine(cc_rscstr.cTXT0000482,
          AEPaymentProcessor.Response.ApprovalCode);
        // 'Response Code'
        _addLine(cc_rscstr.cTXT0000227, AEPaymentProcessor.Response.ReturnCode);
        // cc_rscstr.cTXT0000483 = 'Transaction Type';
        _addLine(cc_rscstr.cTXT0000483,
          AEPaymentProcessor.Response.TransactionType);
        // cc_rscstr.cTXT0000484 = 'Amount';
        _addLine(cc_rscstr.cTXT0000484, IQMS.Common.Numbers.FloatToAnsiStr(
          AEPaymentProcessor.TransactionAmount, 0, 2));
        // Note:  ISO Code is only used by Moneris Canada, but is required by
        // them to be displayed in order to be certified.
        // cc_rscstr.cTXT0000485 = 'ISO Code';
        _addLine(cc_rscstr.cTXT0000485,
          AEPaymentProcessor.Response.GetReturnValue('iso_code'));
        // cc_rscstr.cTXT0000486 = 'Time Stamp';
        _addLine(cc_rscstr.cTXT0000486, AEPaymentProcessor.Response.TimeStamp);
        // Error
        if not AEPaymentProcessor.Response.Approved and
          not AEPaymentProcessor.Response.ErrorText.IsEmpty then
          begin
            _addLine(cc_rscstr.cTXT0000443,
              AEPaymentProcessor.Response.ErrorText);
            // cc_rscstr.cTXT0000511 = 'Error Details';
            _addLine(cc_rscstr.cTXT0000511,
              AEPaymentProcessor.Response.ErrorDetails);
            // Load the image immediately if we have an error.  This may be
            // changed below, but at least it is loaded.
            LoadResponseImage(AResponseImage, rcError);
          end;

        // 07/15/2014 Token request
        if AEPaymentProcessor.CreditCard.AddAsNewToken and
          not AEPaymentProcessor.CreditCard.IsToken then
          begin
            // cc_rscstr.cTXT0000680 = 'Tokenization Response';
            _addLine(cc_rscstr.cTXT0000680,
              AEPaymentProcessor.Response.TokenStatusDescription,
              (AEPaymentProcessor.Response.TokenStatusClass in [trcFailure]));
          end;

        // 'AVS Response'
        _addLine(cc_rscstr.cTXT0000228,
          AEPaymentProcessor.Response.AVSResultDescription,
          (AEPaymentProcessor.Response.AVSResponseClass in [acError,
          acWarning]));
        // 'CVV Response'
        _addLine(cc_rscstr.cTXT0000230,
          AEPaymentProcessor.Response.SecurityResultDescription,
          (AEPaymentProcessor.Response.SecurityResponseClass in [cvError,
          cvWarning]));
        // Note:  Moneris USA wants something special here.  Instead of the
        // "Transaction ID", we need to use the caption "Reference #".  It
        // is required to be displayed in order to be certified.
        if (AGateway = cgwMonerisUSA) then
          // cc_rscstr.cTXT0000481 = 'Reference #';
          _addLine(cc_rscstr.cTXT0000481,
            AEPaymentProcessor.Response.ReferenceNumber)
        else
          begin
            // 'Transaction ID'
            _addLine(cc_rscstr.cTXT0000233, AEPaymentProcessor.TransactionID);
            // cc_rscstr.cTXT0000481 = 'Reference #';
            _addLine(cc_rscstr.cTXT0000481,
              AEPaymentProcessor.Response.ReferenceNumber)
          end;
        // 'Response Transaction ID'
        _addLine(cc_rscstr.cTXT0000470,
          AEPaymentProcessor.Response.TransactionID);
        // 'Invoice #'
        _addLine(cc_rscstr.cTXT0000472, AEPaymentProcessor.InvoiceNumber);
        // 'Response Invoice #'
        _addLine(cc_rscstr.cTXT0000471,
          AEPaymentProcessor.Response.InvoiceNumber);
        // Note:  Card Holder Name is required by Moneris to be displayed, so that
        // it can be sent back to the customer.  This value is not encrypted.
        // cc_rscstr.cTXT0000487 = 'Card Holder';
        _addLine(cc_rscstr.cTXT0000487,
          AEPaymentProcessor.CreditCard.CustomerFullName);
        // Note:  Merchant and Merchant Web Site are required to be displayed
        // by Moneris for certification.
        // cc_rscstr.cTXT0000488 = 'Merchant';
        _addLine(cc_rscstr.cTXT0000488, AMerchantName);
        // cc_rscstr.cTXT0000489 = 'Merchant Web Site';
        _addLine(cc_rscstr.cTXT0000489,
          SelectValueAsString
          ('SELECT internet FROM iqsys WHERE ROWNUM < 2'));
        // Load the image
        // Update display to reflect AVS and CVV warning, but only if the overall
        // response was either Success or Warning
        if ((AEPaymentProcessor.Response.AVSResponseClass in [acWarning,
          acError]) or
          (AEPaymentProcessor.Response.SecurityResponseClass in [cvWarning,
          cvError]))
          and (ALastResponseClass in [rcSuccess, rcWarning]) then
          LoadResponseImage(AResponseImage, rcWarning)
        else
          LoadResponseImage(AResponseImage, ALastResponseClass);
      end
    else
      begin
        if (ALastResponseClass <> rcSuccess) then
          begin
            // cc_rscstr.cTXT0000224 = 'Status'
            _addLine(cc_rscstr.cTXT0000224, ResponseClassDescription
              [ALastResponseClass], True);

            // cc_rscstr.cTXT0000443 = 'Error';
            _addLine(cc_rscstr.cTXT0000443,
              AEPaymentProcessor.Response.ErrorText);

            // cc_rscstr.cTXT0000511 = 'Error Details';
            _addLine(cc_rscstr.cTXT0000511,
              AEPaymentProcessor.Response.ErrorDetails);

            if not AEPaymentProcessor.Response.ErrorCode.IsEmpty then
              // Load the image immediately if we have an error.  This may be
              // changed below, but at least it is loaded.
              LoadResponseImage(AResponseImage, rcError)
          end;

        // Gateway Response Status
        // 'AVS Response'
        _addLine(cc_rscstr.cTXT0000228,
          AEPaymentProcessor.Response.AVSResultDescription,
          (AEPaymentProcessor.Response.AVSResponseClass in [acError,
          acWarning]));

        // cc_rscstr.cTXT0000690 = 'AVS Code';
        _addLine(cc_rscstr.cTXT0000690, AEPaymentProcessor.Response.AVSCode,
          (AEPaymentProcessor.Response.AVSResponseClass in [acError,
          acWarning]));

        // 'CVV Response'
        _addLine(cc_rscstr.cTXT0000230,
          AEPaymentProcessor.Response.SecurityResultDescription,
          (AEPaymentProcessor.Response.SecurityResponseClass in [cvError,
          cvWarning]));

        // cc_rscstr.cTXT0000695 = 'AVS Approval';
        _addLine(cc_rscstr.cTXT0000695,
          AVSResponseClass[AEPaymentProcessor.Response.AVSResponseClass]);

        // 07/15/2014 Token request
        if AEPaymentProcessor.CreditCard.AddAsNewToken and
          not AEPaymentProcessor.CreditCard.IsToken then
          begin
            // cc_rscstr.cTXT0000680 = 'Tokenization Response';
            _addLine(cc_rscstr.cTXT0000680,
              AEPaymentProcessor.Response.TokenStatusDescription,
              (AEPaymentProcessor.Response.TokenStatusClass in [trcFailure]));
          end;

        // Load the image
        // Note:  If an error condition exists, we load the error image
        // immediately because we're loading the error text.  However,
        // we potentially change it again here, if an AVS response is
        // provided.  This is intentional because if an error occurs,
        // then sometimes not much comes back except the message.
        if AEPaymentProcessor.Response.ErrorCode = '' then
          case AEPaymentProcessor.Response.AVSResponseClass of
            acNone:
              ;
            acSuccess:
              LoadResponseImage(AResponseImage, rcSuccess);
            acError:
              LoadResponseImage(AResponseImage, rcError);
            acWarning:
              LoadResponseImage(AResponseImage, rcFailure);
          end;
      end;
  finally
    ARichEdit.Lines.EndUpdate;
  end;

  // go to first line of the rich edit control
  ARichEdit.SelStart := ARichEdit.Perform(EM_LINEINDEX, 0, 0);
  ARichEdit.Perform(EM_SCROLLCARET, 0, 0);
end;       *)

end.
